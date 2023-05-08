local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",

    -- lua
    "lua",

    -- web
    "html",
    "css",

    -- js
    "javascript",
    "typescript",
    "tsx",
    "vue",

    -- c
    "c",

    -- markdown
    "markdown",
    "markdown_inline",

    -- go
    "go",
    "gomod",
    "gosum",
    "gowork",

    -- make
    "make",

    -- rust
    "rust",

    -- sql
    "sql",

    -- toml
    "toml",

    -- yaml
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- go
    "gopls",
    "gofumpt",
    "golines",

    -- web dev stuff
    "vue-languge-server",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust stuff
    "rust_analyzer",
    "rustfmt",

    -- bash
    "bashls",

    -- docker
    "dockerls",
    "docker_compose_language_service",

    -- sql
    "sqlls",

    -- protobuf
    "bufls",

    -- yaml
    "yaml-language-server",
    "yamlfmt",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
