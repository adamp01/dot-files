function ChangeColourScheme(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
    vim.cmd([[hi LineNr guifg=#fff200]])
end

ChangeColourScheme()
