-- leader key
vim.g.mapleader = ' '

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- setup lazy.nvim
require("lazy").setup({
  spec = {
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },
    { "tpope/vim-surround" },
    { "tpope/vim-unimpaired" },
    { "tpope/vim-projectionist" },
    { "catppuccin/nvim" },
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
    },
    {
      "echasnovski/mini.comment",
      branch = "stable",
    },
    {
      "wellle/targets.vim",
      tag = "v0.5.0",
    },
    {
      "j-hui/fidget.nvim",
      commit = "0ba1e16d07627532b6cae915cc992ecac249fb97",
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.opt.rtp:prepend(lazypath)
-- general settings
vim.opt.compatible = false
vim.opt.incsearch = true
vim.opt.mouse = 'a'
vim.opt.laststatus = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.scrolloff = 3
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.history = 1000
vim.opt.undolevels = 1000
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.path = '.,,**'
vim.opt.breakindent = true
vim.opt.showbreak = '¬'
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }
vim.opt.wrap = false
vim.opt.foldenable = true
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 1
vim.opt.lazyredraw = true
vim.opt.regexpengine = 1
vim.opt.splitbelow = true
vim.opt.splitright = true

-- key mappings
vim.keymap.set('n', '<leader><leader>', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>J', ':%!python -m json.tool<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')

-- butterfingers commands
vim.cmd('command! W w')
vim.cmd('command! Q q')
vim.cmd('command! Wq wq')
vim.cmd('command! WQ wq')

-- buffer management
vim.keymap.set('n', '<leader>l', ':bnext<CR>')
vim.keymap.set('n', '<leader>h', ':bprevious<CR>')

-- get better at vim
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')
