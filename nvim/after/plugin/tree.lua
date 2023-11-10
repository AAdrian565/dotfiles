-- examples for your init.lua
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_root = true,

  },
  -- sort_by = "case_sensitive",
  actions = {
    open_file = {
      quit_on_open = true,
      -- WHY IT DOESNT WORK!!!???
    },
  },
  view = {
    width = 30,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      -- WHY IT DOESNT WORK!!!???
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
