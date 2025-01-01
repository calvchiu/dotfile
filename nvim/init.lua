vim.opt.compatible = false
vim.cmd('filetype off')

-- General Settings
vim.opt.background = 'dark'
vim.opt.encoding = 'utf-8'
vim.opt.guifont = 'Inconsolata for Powerline:h12'
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

-- Leader Key
vim.g.mapleader = ' '

-- Key Mappings
vim.keymap.set('n', '<leader><leader>', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>n', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>J', ':%!python -m json.tool<CR>')
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('i', 'jk', '<ESC>')
