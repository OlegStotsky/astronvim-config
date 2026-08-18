-- Customize Aerial
--
-- NOTE: AstroNvim's pinned snapshot still tracks aerial `^3`, but the treesitter
-- backend in 3.x calls `TSNode:start()` and `iter_matches({ all = false })`,
-- both of which were removed in Neovim 0.12. That combination throws
-- "attempt to call method 'start' (a nil value)" on every attach.
--
-- aerial 4.0.0 moved to `TSNode:range()` and dropped support for Neovim < 0.12,
-- matching the nvim-treesitter `main` migration. Override the pin until
-- AstroNvim bumps it upstream.

---@type LazySpec
return {
  "stevearc/aerial.nvim",
  version = "^4",
}
