vim.g.mapleader = ' '
-- define common option
local set = vim.keymap.set
local opts = {
    noremap = true, -- non-recursive
    silent = true,  -- do not show message
}
local function desc(index)
    return {
        noremap = true,
        silent = true,
        desc = index
    }
end

if vim.g.vscode then
    set('n', 'zv', "<Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>", opts)
    set('n', 'zh', "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", opts)
    set('n', '==', 'gqq', opts)
    set('v', '=', 'gq', opts)
else
    set('n', '==', 'gqq', opts)
    set('v', '=', 'gq', opts)
    set('n', '=', 'gq', opts)

    --窗口跳转
    set('n', '<A-h>', '<C-w>h', opts)
    set('n', '<A-j>', '<C-w>j', opts)
    set('n', '<A-k>', '<C-w>k', opts)
    set('n', '<A-l>', '<C-w>l', opts)
    set('n', '<A-q>', ':q<CR>', opts)
    set('i', '<A-q>', '<Esc>:q<CR>', opts)
    set('n', '<A-S>', 'ggvGgcc', opts)
    set('t', '<A-q>', '<C-\\><C-n>:q<CR>', opts)

    vim.api.nvim_set_keymap("i", "<A-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

    --分屏
    set('n', 'zv', ':vsp<CR>', desc('vsplit'))
    set('n', 'zh', ':sp<CR>', desc('split'))
    set('n', 'zc', '<C-w>c', desc('close current'))
    set('n', 'zo', '<C-w>o', desc('close others')) -- close others

    set('n', '<C-h>', ':bp<CR>', opts)
    set('n', '<C-l>', ':bn<CR>', opts)
    set('n', '<C-/>', 'gcc', { remap = true, desc = 'comment' })
    set('n', '<C-w>', ':bdelete!<CR>', opts)
    set('n', '<C-s>', ':w<CR>', opts)
    set('i', '<C-s>', '<Esc>:w<CR>', opts)
    set('n', '<C-a>', 'gg0vG$', opts)
    set('v', '<C-a>', 'vgg0vG$', opts)
    set('i', '<C-a>', '<Esc>gg4vG$a', opts)
    set('v', '<C-c>', 'y', opts)

    --CP相关
    set('n', '<F1>', ':CompetiTest run<CR>', opts)
    set('i', '<F1>', '<Esc>:CompetiTest run<CR>', opts)
    set('n', '<F2>', ':CompetiTest add_testcase<CR>', opts)
    set('i', '<F2>', '<Esc>:CompetiTest add_testcase<CR>', opts)
    set('n', '<F3>', ':CompetiTest edit_testcase<CR>', opts)
    set('i', '<F3>', '<Esc>:CompetiTest edit_testcase<CR>', opts)
    set('n', '<F12>', ':Lazy<CR>', opts)
    set('t', '<Esc>', '<C-\\><C-n>:q<CR>', opts)

    --leader
    set('n', '<leader>f', ':Telescope find_files<CR>', desc('find files'))
    set('n', '<leader>w', ':Telescope live_grep<CR>', desc('find words'))
    set('n', '<leader>r', ':Telescope oldfiles<CR>', desc('recent files'))
    set('n', '<leader>t', ':FloatermToggle<CR>', desc('Terminal'))
    set('n', '<leader>e', ':Neotree toggle<CR>', desc('File Explorer'))
    set('n', '<leader>p', ':Lazy<CR>', desc('lazy'))

    --分语言执行运行指令
    --cpp
    vim.api.nvim_create_autocmd('filetype', {
        pattern = "cpp",
        callback = function()
            local opt = { noremap = true, silent = true, buffer = true }
            -- local file = vim.fn.expand("<afile>");
            vim.keymap.set('n', '<F5>',
                ':FloatermNew --autoclose=4 cd %:h; g++ %:t -g -std=c++20 -o bin/%:t:r; time ./bin/%:t:r<CR>',
                desc('Run code'))
            vim.keymap.set('i', '<F5>',
                '<Esc>:FloatermNew --autoclose=4 cd %:h; g++ %:t -g -std=c++20 -o bin/%:t:r; time ./bin/%:t:r<CR>',
                desc('Run code'))
        end
    })
    --python
    vim.api.nvim_create_autocmd('filetype', {
        pattern = "python",
        callback = function()
            local opt = { noremap = true, silent = true, buffer = true }
            vim.keymap.set('n', '<f5>', ':FloatermNew --autoclose=0 time python % <cr>', desc('Run code'))
            vim.keymap.set('i', '<f5>', '<esc>:FloatermNew --autoclose=0 time python % <cr>', desc('Run code'))
        end
    })
    --rust
    vim.api.nvim_create_autocmd('filetype', {
        pattern = "rust",
        callback = function()
            local opt = { noremap = true, silent = true, buffer = true }
            vim.keymap.set('n', '<f5>', ':FloatermNew --autoclose=0 cd %:h; time cargo run<CR>', desc('Run code'))
            vim.keymap.set('i', '<f5>', '<esc>:FloatermNew --autoclose=0 cd %:h; time cargo run<CR>', desc('Run code'))
        end
    })
end

