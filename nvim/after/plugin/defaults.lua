vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
