-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")
Plug("shaunsingh/nord.nvim")
vim.call("plug#end")
--Lua:
vim.cmd([[colorscheme nord]])
