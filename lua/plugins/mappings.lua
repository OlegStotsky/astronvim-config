return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- Disable Neovim 0.11 built-in gr* mappings so that our `gr` (find references) fires immediately
          grr = false,
          gra = false,
          grn = false,
          gri = false,
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
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function()
              vim.lsp.buf.hover()
            end,
            desc = "Hover symbol details",
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
