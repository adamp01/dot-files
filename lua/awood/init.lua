require("awood.set");
require("awood.remap");
require("awood.packer");
local augroup = vim.api.nvim_create_augroup
local buf_group = augroup('BufferWrite', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = buf_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
  },
  severity_sort = true,
  float = {
    source = "always",
  },
})

-- Use a global .prettierrc file
vim.cmd([[autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.html,*.css Prettier]])

-- Specify the path to the global .prettierrc file
vim.g["prettier#autoformat_config_path"] = "~/.config/nvim/.prettierrc"
