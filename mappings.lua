---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.nvimtree = {
  n = {
    ["<C-f>"] = { "<cmd> NvimTreeFindFile <CR>", "find file nvimtree" },
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

M.copilot = {
  n = {
    ["<leader>po"] = { "<Cmd>Copilot panel<CR>", "Open panel copilot" },
    ["<leader>pa"] = {
      function()
        require("copilot.panel").accept()
      end,
      "accept suggestion copilot",
    },
    ["<leader>pn"] = {
      function()
        require("copilot.panel").jump_next()
      end,
      "Next suggestion copilot",
    },
    ["<leader>pp"] = {
      function()
        require("copilot.panel").jump_prev()
      end,
      "Previous suggestion copilot",
    },
    ["<leader>pr"] = {
      function()
        require("copilot.panel").refresh()
      end,
      "Refresh panel copilot",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>fw"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "live grep",
    },
  },
}
return M
