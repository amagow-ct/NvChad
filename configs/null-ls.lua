local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	------------------
	-- completion
	------------------
	b.completion.luasnip,
	b.completion.spell,
	null_ls.builtins.completion.tags,

	------------------
	-- code actions
	------------------
	null_ls.builtins.code_actions.gomodifytags,
	null_ls.builtins.code_actions.impl,

	------------------
	-- formatting
	------------------
	-- webdev stuff
	b.formatting.deno_fmt, -- chosen deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }), -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,

	-- cpp
	b.formatting.clang_format,

	-- go
	b.formatting.gofumpt,
	b.formatting.golines,

	-- rust
	b.formatting.rustfmt,

	-- yamlfmt
	b.formatting.yamlfmt,

	b.formatting.sqlfmt,

	------------------
	-- diagnostics
	------------------
	b.diagnostics.codespell,
	b.diagnostics.commitlint,

	-- go
	null_ls.builtins.diagnostics.golangci_lint,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
