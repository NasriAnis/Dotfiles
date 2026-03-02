-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- For GUI clients
if vim.g.neovide then
  vim.o.guifont = "monospace:h16"
end

--vim.diagnostic.config({
--  virtual_text = false,
--  virtual_lines = { current_line = true }, -- { current_line = true }
--  update_in_insert = true,
--})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = { current_line = true },
      update_in_insert = true,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      callback = function()
        local mode = vim.fn.mode()
        if mode == "n" then
          vim.diagnostic.config({ virtual_lines = { current_line = true } })
        else
          vim.diagnostic.config({ virtual_lines = false })
        end
      end,
    })
  end,
})

vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.inlayHintProvider = false
    end
  end,
})
