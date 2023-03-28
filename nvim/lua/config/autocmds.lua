-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- chatgpt did this but it works
-- ensures new directories and files are created on save if they don't exist
vim.api.nvim_command("augroup AutoCreateDirectory")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command('autocmd BufWritePre * silent! execute "!mkdir -p " .. shellescape(expand("%:p:h"))')
vim.api.nvim_command("augroup END")

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "norg" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})