local map = require("utils").map
local man_init = require("man").init
local set = vim.opt
local api = vim.api
local Plug = vim.fn["plug#"]

-- Tab behaviour.
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.clipboard = "unnamedplus"

-- Show line numbers.
set.number = true

-- No wrap.
set.wrap = false

-- Set space as leader key.
vim.g.mapleader = '.'
-- Change autocomplete color.
vim.cmd("highlight Pmenu ctermfg=15 ctermbg=0 guifg=#FFFFFF guibg=#000000")
vim.cmd("highlight PmenuSel ctermfg=0 ctermbg=255 guifg=#EBDBB2 guibg=#EBDBB2")

vim.call("plug#begin")
Plug "jiangmiao/auto-pairs"
Plug "preservim/nerdtree"
Plug "nvim-lualine/lualine.nvim"
vim.call("plug#end")

require("lualine").setup{
  options={theme="gruvbox"},
}

man_init()
