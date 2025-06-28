function ColorMyPencils(color)
	color = color or "tokyonight"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0,"LineNr", {fg = "yellow"})
	vim.api.nvim_set_hl(0,"LineNrBelow", {fg = "white"})
	vim.api.nvim_set_hl(0,"LineNrAbove", {fg = "white"})
end
ColorMyPencils()
