local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "auto"

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- count words with dashes as one word
opt.iskeyword:append("-")

-- autocomplete menu
opt.completeopt = "menu,menuone,noselect"

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 300
