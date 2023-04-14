---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.clipboard = {
  n = {
    ["<leader>y"] = { '"+y', "Copy to clipboard" },
    ["<leader>p"] = { '"+p', "Paste from clipboard" },
  },
}

M.fugitive = {
  n = {
    ["<leader>gg"] = { "<Cmd>Git<CR>", "Open fugitive" },
  },
}
return M
