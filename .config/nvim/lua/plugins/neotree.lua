return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	opts = {
		filesystem = { follow_current_file = { enabled = true } },
		window = { width = 32 },
	},
	keys = {
		{
			"<C-n>",
			function()
				vim.cmd("Neotree toggle")
			end,
			desc = "Neo-tree toggle",
		},
	},
}
