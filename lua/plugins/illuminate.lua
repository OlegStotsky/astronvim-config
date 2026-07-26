-- Customize vim-illuminate
--
-- NOTE: AstroNvim v6 migrated its own reference highlighting from vim-illuminate
-- to `snacks.words`, so it no longer ships a vim-illuminate spec. Without one,
-- lazy.nvim falls back to calling `require("illuminate").setup(opts)` -- but
-- this plugin's entry point is `configure()`, not `setup()`, which fails with
-- "attempt to call field 'setup' (a nil value)". Wire it up explicitly.
--
-- `event` restores the lazy-loading AstroNvim used to provide; without it the
-- plugin would load eagerly at startup.
--
-- If you'd rather drop this plugin, `snacks.words` is already in the stack and
-- covers the same reference-highlighting behavior.

---@type LazySpec
return {
  "RRethy/vim-illuminate",
  event = "User AstroFile",
  opts = {
    providers = {
      "lsp",
      "regex",
    },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
