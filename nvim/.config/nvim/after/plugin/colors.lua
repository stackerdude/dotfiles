function ColorProfile(color)
    color = color or "nordic"
    vim.cmd.colorscheme(color)
end

ColorProfile()
