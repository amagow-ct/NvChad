local opts = require("plugins.configs.cmp")
local cmp = require("cmp")

-- backward compatibility
if not table.unpack then
	---@diagnostic disable-next-line: deprecated
	table.unpack = unpack
end

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- add copilot source
table.insert(opts.sources, { name = "copilot" })

-- update mapping
opts.mapping = {
	["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() and has_words_before() then
			cmp.select_next_item()
		elseif require("luasnip").expand_or_jumpable() then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
		else
			fallback()
		end
	end, {
		"i",
		"s",
	}),
	["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() and has_words_before() then
			cmp.select_prev_item()
		elseif require("luasnip").jumpable(-1) then
			vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
		else
			fallback()
		end
	end, { "i", "s" }),
}

-- update sorting
opts.sorting = {

	priority_weight = 2,
	comparators = {
		require("copilot_cmp.comparators").prioritize,

		-- Below is the default comparator list and order for nvim-cmp
		cmp.config.compare.offset,
		-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
		cmp.config.compare.exact,
		cmp.config.compare.score,
		cmp.config.compare.recently_used,
		cmp.config.compare.locality,
		cmp.config.compare.kind,
		cmp.config.compare.sort_text,
		cmp.config.compare.length,
		cmp.config.compare.order,
	},
}

return opts
