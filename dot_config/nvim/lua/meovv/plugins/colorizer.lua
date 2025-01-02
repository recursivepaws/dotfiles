-- Turns color codes like "#FF0000" into actual colors
return {
	"norcalli/nvim-colorizer.lua",
	cmd = { "ColorizerToggle" },
	config = function()
		require("colorizer").setup({ "*" })
	end,
}
