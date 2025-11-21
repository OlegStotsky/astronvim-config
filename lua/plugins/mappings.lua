return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gr = {
            function()
              vim.lsp.buf.references()
            end,
            desc = "References of current symbol",
            cond = "textDocument/declaration",
          },
          dt = {
            function()
              require('dap-go').debug_test()
            end,
            desc = "debug current test",
          },
        },
      },
    },
  },
}
