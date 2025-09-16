vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

vim.cmd.colorscheme 'unokai'

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
-- New terminal in new tab running codex
vim.keymap.set('n', '<leader>tx', ':tabnew | terminal codex --search <CR>i', { desc = 'Open terminal in new tab and run codex', noremap = true, silent = true })
-- Visual all buffer
vim.keymap.set('n', '<leader>va', 'ggVG', { desc = 'Visual select all buffer', noremap = true, silent = true })

-- center to screen when jumping to line
vim.keymap.set('n', 'j', 'jzz', { desc = 'Move down and center', noremap = true, silent = true })
vim.keymap.set('n', 'k', 'kzz', { desc = 'Move up and center', noremap = true, silent = true })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Move to end of file and center', noremap = true, silent = true })

-- Autopair brackets and quotes with cursor positioning
vim.keymap.set('i', '(', '()<Left>', { desc = 'Autopair (', noremap = true, silent = true })
vim.keymap.set('i', '[', '[]<Left>', { desc = 'Autopair [', noremap = true, silent = true })
vim.keymap.set('i', '{', '{}<Left>', { desc = 'Autopair {', noremap = true, silent = true })
vim.keymap.set('i', '"', '""<Left>', { desc = 'Autopair "', noremap = true, silent = true })
vim.keymap.set('i', "'", "''<Left>", { desc = "Autopair '", noremap = true, silent = true })
vim.keymap.set('i', '`', '``<Left>', { desc = 'Autopair `', noremap = true, silent = true })
vim.keymap.set('i', '<', '<><Left>', { desc = 'Autopair <', noremap = true, silent = true })

-- Surround with brackets
local function create_surround_operator(left, right)
  return function()
    vim.o.operatorfunc = 'v:lua.surround_operator'
    _G.surround_left = left
    _G.surround_right = right
    return 'g@'
  end
end

_G.surround_operator = function(motion_type)
  local start_mark = vim.api.nvim_buf_get_mark(0, '[')
  local end_mark = vim.api.nvim_buf_get_mark(0, ']')

  local lines = vim.api.nvim_buf_get_text(0, start_mark[1] - 1, start_mark[2], end_mark[1] - 1, end_mark[2] + 1, {})
  local text = table.concat(lines, '\n')

  local new_text = _G.surround_left .. text .. _G.surround_right
  vim.api.nvim_buf_set_text(0, start_mark[1] - 1, start_mark[2], end_mark[1] - 1, end_mark[2] + 1, vim.split(new_text, '\n'))
end

vim.keymap.set('n', 's[', create_surround_operator('[', ']'), { expr = true, desc = 'Surround with brackets' })
vim.keymap.set('n', 's(', create_surround_operator('(', ')'), { expr = true, desc = 'Surround with parentheses' })
vim.keymap.set('n', 's"', create_surround_operator('"', '"'), { expr = true, desc = 'Surround with double quotes' })
--
-- Change colorscheme from light to dark and viceversa
vim.keymap.set('n', '<leader>bg', function()
  vim.cmd.colorscheme(vim.g.colors_name == 'unokai' and 'shine' or 'unokai')
end, { desc = 'Toggle between unokai and shine colorschemes' })

-- Explore commands
vim.g.netrw_banner = 0 -- Remove the banner/description
vim.g.netrw_liststyle = 3 -- Tree view
vim.g.netrw_winsize = 25

-- Set the keymap to toggle file tree on the left
vim.keymap.set('n', '\\', ':Lexplore<CR>', { desc = 'Toggle file tree', noremap = true, silent = true })
