if vim.g.loaded_ppy then
  return
end
vim.g.loaded_ppy = true

local cmd = vim.api.nvim_create_user_command

cmd("PpyCompile", function()
  require("ppy").compile()
end, { desc = "ppy: rebuild the compiled highlight cache" })

cmd("PpyClearCache", function()
  require("ppy").clear_cache()
end, { desc = "ppy: delete the compiled highlight cache" })

cmd("PpyExtras", function(args)
  local out = require("ppy").extras(args.args ~= "" and args.args or nil)
  vim.notify("ppy: extras written to " .. out)
end, { nargs = "?", complete = "dir", desc = "ppy: generate ghostty/kitty/lazygit themes" })
