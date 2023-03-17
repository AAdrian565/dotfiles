local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

require("toggleterm").setup {
  start_in_insert = true,
  insert_mappings = true,
  shading_factor = 0,
}
