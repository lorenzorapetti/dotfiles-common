-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.hl", "hypr*.conf", "hyprland/*.conf" },
  callback = function()
    vim.opt.ft = "hyprlang"
  end,
})

local rust_group = vim.api.nvim_create_augroup("Rust_disable_single_quote", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  group = rust_group,
  callback = function()
    if MiniPairs ~= nil then
      MiniPairs.unmap("i", "'", "''")
    end
  end,
  desc = "Disable single quote Rust",
})

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyLoad",
  group = vim.api.nvim_create_augroup("Rust_disable_single_quote_lazyload", { clear = true }),
  callback = function(event)
    if event.data == "mini.pairs" then
      vim.api.nvim_exec_autocmds("FileType", {
        pattern = "rust",
        group = rust_group,
      })
    end
  end,
  desc = "Disable single quote Rust",
})

-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "lua" },
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })
