-- init.lua

-- Netrw settings
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- Auto-open netrw and resize on launch
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Vex")
    vim.cmd("vertical resize 25")
  end
})

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- UI tweaks
vim.opt.scrolloff = 3
vim.opt.cursorline = true
vim.opt.hidden = true
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>q', ':qall<CR>', { noremap = true, silent = true })



-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.cmd("syntax enable")
vim.opt.background = "dark"
vim.cmd("colorscheme sorbet")

-- Spelling
vim.keymap.set('n', '<F3>', function()
  if vim.opt.spell:get() then
    vim.opt.spell = false
  else
    vim.opt.spell = true
    vim.opt.spelllang = { 'en_us' }
  end
end, { noremap = true, silent = true })


