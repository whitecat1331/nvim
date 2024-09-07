return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          -- quick save
          -- personal config
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
          ["<C-K>"] = "zz<C-u>",
          ["<C-J>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          --
          ["<C-K>"] = "zz<C-u>",
          ["<C-J>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
        v = {
          ["S"] = { ":s///g<left><left><left>", desc = "Find and Replace" },
          ["p"] = { '"_dP', desc = "Paste and re-copy to nvim register" },
          ["<C-K>"] = "zz<C-u>",
          ["<C-J>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          ["<C-K>"] = "zz<C-u>",
          ["<C-J>"] = "zz<C-d>",
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}

