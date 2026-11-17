-- Other

-----------------------------------------------------------
-- 1. LEADER KEY & BASIC OPTIONS
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Move selected lines up/down in Visual mode using Shift + J / K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
-- Move selected lines left/right in Visual mode using H and L
vim.keymap.set("v", "H", "<gv", { silent = true })
vim.keymap.set("v", "L", ">gv", { silent = true })
-----------------------------------------------------------
-- 2. DISTRACTION-FREE FIXES (NO POPUPS / NO AUTO-DASHES)
-----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-----------------------------------------------------------
-- 3. PLUGIN MANAGER SETUP (LAZY.NVIM)
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Automatically load all plugin files from lua/plugins/
require("lazy").setup("plugins")

