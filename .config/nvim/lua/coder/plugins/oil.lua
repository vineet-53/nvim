return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "rounded",
      },
      win_options = {
        wrap = true,
        winblend = 0,
      },
      keymaps = {
        ["<Esc>"] = false,
        ["q"] = "actions.close",
      },
    })
    vim.keymap.set("n", "<leader>e", oil.toggle_float, { desc = "toggle oil" }, { silent = true })
    vim.keymap.set("n", "t", oil.select, { desc = "select option" }, { silent = true })
  end,
}
