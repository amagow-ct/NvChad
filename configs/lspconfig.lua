local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = {
	"html",
	"cssls",
	"tsserver",
	"clangd",
	"gopls",
	"dockerls",
	"bufls",
	"bashls",
	"rust_analyzer",
	"sqlls",
}

for _, lsp in ipairs(servers) do
	if lsp == "clangd" then
		lspconfig[lsp].setup({
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
			on_attach = on_attach,
			capabilities = capabilities,
		})
		goto continue
	end

	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	::continue::
end

--
-- lspconfig.pyright.setup { blabla}
