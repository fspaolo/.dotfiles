require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
      "pylsp",  -- "python-lsp-server"
      -- "flake8",
      -- "black",
      -- "isort",
  }
})

-- local servers = {
--   -- clangd = {},
--   -- gopls = {},
--   -- pyright = {},
--   -- rust_analyzer = {},
--   -- tsserver = {},
-- 
--   sumneko_lua = {
--     Lua = {
--       workspace = { checkThirdParty = false },
--       telemetry = { enable = false },
--     },
--   },
-- }
-- 
