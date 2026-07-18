return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      },
      live_grep = {
        additional_args = { "--hidden", "--no-ignore" },
      },
    },
  },
}
