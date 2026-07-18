vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for all operations

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy "+",
    ["*"] = require("vim.ui.clipboard.osc52").copy "*",
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste "+",
    ["*"] = require("vim.ui.clipboard.osc52").paste "*",
  },
}

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("LspShutdown", { clear = true }),
  callback = function()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
      vim.lsp.stop_client(client.id)
    end
  end,
})
