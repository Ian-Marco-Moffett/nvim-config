local M = {}


local function kill_usedbuffers()
  vim.cmd("silent! execute \"%bd|e#|bd#\"")
end


function M.bufclean_init()
  vim.keymap.set("n", "<leader>k", function()
    kill_usedbuffers()
  end, {desc="Kill unused buffers."})
end

return M
