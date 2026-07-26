-- Customize Treesitter
--
-- NOTE: As of AstroNvim v6, nvim-treesitter tracks its `main` branch, which
-- dropped the old `nvim-treesitter.configs` setup API. Parser installation is
-- no longer configured on the nvim-treesitter spec itself -- it moved to
-- AstroCore under `treesitter.ensure_installed`, which is declared in
-- AstroNvim's `opts_extend`, so this list is appended to the defaults rather
-- than replacing them.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  opts = {
    treesitter = {
      ensure_installed = {
        "go",
        "rust",
        -- add more arguments for adding more treesitter parsers
      },
      -- AstroCore replaces the buffer's `indentexpr` with nvim-treesitter's.
      -- On the `main` branch that indent implementation is still young, and for
      -- Rust it computes a new line one column short (4 -> 3), which a
      -- subsequent format then corrects. Neovim ships a mature Rust indent
      -- (`GetRustIndent`, runtime/indent/rust.vim), so opt Rust out and let the
      -- built-in handle it. Everything else keeps treesitter indenting.
      indent = function(lang) return lang ~= "rust" end,
    },
  },
}
