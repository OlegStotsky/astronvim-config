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

vim.keymap.del("n", "<leader>o")

local wk = require "which-key"
wk.add({
    { "<leader>o", group = "Obsidian Shortcuts"},
    { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Open Today's Note", mode = "n" },
    { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "Open Dailies", mode = "n" },
    { "<leader>ont",
        function()
            local note = vim.fn.input("Enter note name: ")
            if note ~= "" then
                vim.cmd("ObsidianNewFromTemplate " .. note)
            else
                print("No note entered.")
            end
        end,
        desc = "New note from template",
        mode = "n",
    },
    {
        "<leader>owd",
        function()
            local datetime = os.time()
            local id = tostring(os.date("%Y-%m-%d", datetime))
            local client = require("obsidian").get_client()
            local note = client.create_note(client, {title=id, id=id, dir='work/daily', template='work-daily.md'})
            client.open_note(client, note)
        end,
        desc = "New Work Daily",
        mode = "n",
    },
})
