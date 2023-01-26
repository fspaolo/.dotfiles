-- Resume last telescope action
local resume = require("telescope.builtin").resume
vim.keymap.set("n", "<leader>sr", resume, { desc = "[S]earch [R]esume" })
