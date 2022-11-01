-- set leader key
vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set('i', 'jk', '<ESC>')
keymap.set('n', '<leader>sh', ':split<CR>')
keymap.set('n', '<leader>sv', ':vsplit<CR>')

-- Plugin Keymaps

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- nvim-tree
keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>')

-- telescope
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fc', builtin.grep_string, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fr', builtin.lsp_references, {})
keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})

-- coc
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keymap.set('n', "gl", ":CocDiagnostics<CR>")
keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- lazygit
keymap.set('n', '<leader>lg', ':LazyGit<CR>')
