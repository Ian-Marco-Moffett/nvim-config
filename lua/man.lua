-- Manual
local fmt = require("utils").fmt
local api = vim.api
local M = {}

local buf, win


local function mkwin()
  local start_win = api.nvim_get_current_win()
  
  -- Create new buffer.
  api.nvim_command("vnew")
  buf = api.nvim_get_current_buf()
  win = api.nvim_get_current_win()

  api.nvim_buf_set_name(buf, "BasedTree")
  api.nvim_buf_set_option(buf, "buftype", "nofile")
  api.nvim_buf_set_option(buf, "swapfile", false)
  api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  api.nvim_buf_set_option(buf, "filetype", "nvim-oldfile")

  api.nvim_win_set_option(win, "cursorline", true)
  api.nvim_win_set_option(win, "number", false)
end


local function man(entry)
  mkwin()
  api.nvim_win_set_option(win, "wrap", true)
  api.nvim_command("vertical resize 50")
  vim.cmd(fmt("silent %%!man %s", entry))
  api.nvim_buf_set_option(buf, "modifiable", false)
end


function M.init()
  vim.keymap.set("n", "<leader>m", function()
    local entry = vim.fn.input("Entry: ", "", "file")
    man(entry)
  end, {desc="Show manual entry"})
end


return M
