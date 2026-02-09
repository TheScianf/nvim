vim.g.mapleader = ' '

vim.g.maplocalleader = ','

vim.g.have_nerd_font = true

vim.opt.relativenumber = true

-- Minimum width for the number column
vim.opt.numberwidth = 1

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

vim.opt.showmode = true
vim.opt.showcmd = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to clipboard whatever selected in Visual mode', noremap = true, silent = true })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank to clipboard current line', noremap = true, silent = true })
vim.keymap.set('n', '<leader>ya', 'gg"+yG', { desc = 'Yank entire file to clipboard', noremap = true, silent = true })
-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Hide cmdline after entering command
vim.opt.cmdheight = 0

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.fillchars = { eob = ' ' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

vim.opt.statusline = '%f %m%r%=%y %l/%L'
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- Highlight option while searching
vim.opt.hlsearch = false

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, fou normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')

vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tab keymaps
vim.keymap.set('n', '<leader>nt', ':tabnew<CR>', { desc = 'Open new tab', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close current tab', noremap = true, silent = true })

-- New terminal
vim.keymap.set('n', '<leader>te', ':tabnew | te<CR>', { desc = 'Open new terminal in the same tab', noremap = true, silent = true })
-- New terminal in new tab running codex or gemini (toggle comment of the preferred one)
-- vim.keymap.set('n', '<leader>tx', ':tabnew | terminal codex<CR>i', { desc = 'Open terminal in new tab and run codex', noremap = true, silent = true })
vim.keymap.set('n', '<leader>tx', ':tabnew | terminal gemini<CR>i', { desc = 'Open terminal in new tab and run gemini cli', noremap = true, silent = true })
-- Visual all buffer
vim.keymap.set('n', '<leader>va', 'ggVG', { desc = 'Visual select all buffer', noremap = true, silent = true })

-- Latex keymaps that uses latexmk and evince pdf reader
vim.keymap.set('n', '<leader>lx', ':!latexmk -pdf main.tex<CR>', { desc = 'Compile main.tex', noremap = true, silent = true })
vim.keymap.set('n', '<leader>lc', ':!latexmk -C', { desc = 'Delete auxiliary latex file', noremap = true, silent = true })

vim.keymap.set('n', '<leader>lp', function()
  -- Get the default .desktop entry for PDFs
  local default = vim.fn.systemlist('xdg-mime query default application/pdf')[1]
  if not default or default == '' then
    vim.notify('⚠️ No default PDF application found', vim.log.levels.WARN)
    return
  end

  -- Locate the .desktop file
  local desktop_file = '/usr/share/applications/' .. vim.trim(default)
  if vim.fn.filereadable(desktop_file) == 0 then
    desktop_file = vim.fn.expand('~/.local/share/applications/' .. vim.trim(default))
  end
  if vim.fn.filereadable(desktop_file) == 0 then
    vim.notify('⚠️ Desktop file not found for ' .. default, vim.log.levels.WARN)
    return
  end

  -- Extract the Exec command (first word after Exec=)
  local exec_line = vim.fn.systemlist("grep -m1 '^Exec=' " .. vim.fn.shellescape(desktop_file))[1]
  if not exec_line or exec_line == '' then
    vim.notify('⚠️ Could not read Exec line from ' .. default, vim.log.levels.WARN)
    return
  end

  local pdf_reader = exec_line:gsub('Exec=', ''):match '^%S+'
  if pdf_reader and vim.fn.executable(pdf_reader) == 1 then
    vim.system({ pdf_reader, 'main.pdf' }, { detach = true })
    vim.notify('📖 Opening main.pdf with ' .. pdf_reader, vim.log.levels.INFO)
  else
    vim.notify('⚠️ PDF reader command not found or not executable', vim.log.levels.WARN)
  end
end, { desc = 'Open main.pdf with default PDF reader' })
