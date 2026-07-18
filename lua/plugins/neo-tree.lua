return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,         -- show items even if filtered
        hide_dotfiles = false,  -- don't hide .files
        hide_gitignored = false,-- don't hide gitignored files
        hide_hidden = false,    -- Windows-only "hidden" attribute
      },
    },
  },
}
