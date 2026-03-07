-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     local black = { bg = "#000000" }
--     vim.api.nvim_set_hl(0, "Normal", black)
--     vim.api.nvim_set_hl(0, "NormalFloat", black)
--     vim.api.nvim_set_hl(0, "NormalNC", black)
--     vim.api.nvim_set_hl(0, "SignColumn", black)
--     vim.api.nvim_set_hl(0, "LineNr", black)
--     vim.api.nvim_set_hl(0, "CursorLineNr", black)
--     vim.api.nvim_set_hl(0, "EndOfBuffer", black)
--   end,
-- })
--
--
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "NONE" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE", fg = "NONE" })
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
