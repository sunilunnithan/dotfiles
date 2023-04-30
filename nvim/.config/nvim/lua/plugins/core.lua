return {
	"tpope/vim-surround",
	"godlygeek/tabular",    -- Quickly align text by pattern
	"tpope/vim-repeat",     -- Repeat actions better
	"tpope/vim-abolish",    -- Cool things with words!
	"tpope/vim-characterize", -- ?
	"tpope/vim-scriptease",
	"romainl/vim-qf",
	{
		"nvim-tree/nvim-web-devicons",
		config = { default = true },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = true,
	},
	{ "nacro90/numb.nvim", event = "BufReadPre", config = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		enabled = true,
		config = { default = true }, -- same as config = true
	},
}
