vim.lsp.enable { 'lua_ls', 'kotlin_lsp', 'python_lsp', 'markdown_ls' }

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    -- Helper function to create buffer-local keymaps
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        desc = 'LSP: ' .. desc,
        silent = true,
      })
    end

    -- textDocument/implementation
    if client:supports_method 'textDocument/implementation' then
      map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    end
    -- textDocument/completion
    if client:supports_method 'textDocument/completion' then
      vim.opt_local.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end, { buffer = bufnr })
    end
    -- textDocument/codeLens
    if client:supports_method 'textDocument/codeLens' then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('my.lsp.codelens', { clear = false }),
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
      })
      map('n', '<leader>cl', vim.lsp.codelens.run, 'Run code lens')
    end

    -- textDocument/documentHighlight
    if client:supports_method 'textDocument/documentHighlight' then
      local highlight_group = vim.api.nvim_create_augroup('my.lsp.document_highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = highlight_group,
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = highlight_group,
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- textDocument/documentSymbol
    if client:supports_method 'textDocument/documentSymbol' then
      map('n', '<leader>ds', vim.lsp.buf.document_symbol, 'Document symbols')
      map('n', '<leader>ws', vim.lsp.buf.workspace_symbol, 'Workspace symbols')
    end

    -- textDocument/formatting
    if client:supports_method 'textDocument/formatting' then
      map('n', '<leader>f', function()
        vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 1000 }
      end, 'Format document')

      -- Auto-format on save (only if server doesn't support willSaveWaitUntil)
      if not client:supports_method 'textDocument/willSaveWaitUntil' then
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = vim.api.nvim_create_augroup('my.lsp.format', { clear = false }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { bufnr = bufnr, id = client.id, timeout_ms = 1000 }
          end,
        })
      end
    end

    -- textDocument/rangeFormatting
    if client:supports_method 'textDocument/rangeFormatting' then
      map('v', '<leader>f', function()
        vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 1000 }
      end, 'Format selection')
    end

    -- textDocument/hover
    if client:supports_method 'textDocument/hover' then
      map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    end

    -- textDocument/inlayHint
    if client:supports_method 'textDocument/inlayHint' then
      -- Enable inlay hints by default
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      map('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }, { bufnr = bufnr })
      end, 'Toggle inlay hints')
    end

    -- textDocument/rename
    if client:supports_method 'textDocument/rename' then
      map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    end
    -- textDocument/signatureHelp
    if client:supports_method 'textDocument/signatureHelp' then
      map('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature help')

      -- Auto-trigger signature help
      vim.api.nvim_create_autocmd('CursorHoldI', {
        group = vim.api.nvim_create_augroup('my.lsp.signature', { clear = false }),
        buffer = bufnr,
        callback = function()
          local params = vim.lsp.util.make_position_params(0, 'utf-8')
          vim.lsp.buf_request(bufnr, 'textDocument/signatureHelp', params, function(err, result, ctx, config)
            if result and result.signatures and #result.signatures > 0 then
              vim.lsp.handlers['textDocument/signatureHelp'](err, result, ctx, config)
            end
          end)
        end,
      })
    end

    -- Additional useful keymaps
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gr', vim.lsp.buf.references, 'Go to references')
    map('n', 'gtt', vim.lsp.buf.type_definition, 'Go to type definition')
    map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')
    map('v', '<leader>ca', vim.lsp.buf.code_action, 'Code actions')

    -- LSP info
    map('n', '<leader>li', function()
      local clients = vim.lsp.get_clients { bufnr = bufnr }
      if #clients == 0 then
        vim.notify('No LSP clients attached to buffer', vim.log.levels.INFO)
        return
      end

      local info = {}
      for _, c in ipairs(clients) do
        table.insert(info, string.format('• %s (id: %d)', c.name, c.id))
      end
      vim.notify('LSP clients attached to buffer:\n' .. table.concat(info, '\n'), vim.log.levels.INFO,
        { title = 'LSP Info' })
    end, 'LSP info')
    map('n', '<leader>lr', function()
      local clients = vim.lsp.get_clients { bufnr = bufnr }
      for _, c in ipairs(clients) do
        vim.lsp.stop_client(c.id, true)
      end
      vim.notify('Restarted LSP clients', vim.log.levels.INFO)
    end, 'LSP restart')
  end,
})
