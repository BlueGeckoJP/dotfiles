-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local final_newline_group = vim.api.nvim_create_augroup("user_final_newline", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = final_newline_group,
  callback = function(event)
    local bufnr = event.buf
    if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
      return
    end
    if vim.bo[bufnr].buftype ~= "" then
      return
    end

    vim.bo[bufnr].eol = true
    vim.bo[bufnr].fixeol = true
  end,
})
