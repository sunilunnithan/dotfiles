return {
	"williamboman/mason.nvim",
	opts = {
		ui = {
			border = "double",
			icons = {
				package_installed = "﫟",
				package_pending = "﫠",
				package_uninstalled = "",
			},
		},
		ensure_installed = {
			"prettierd",
			"eslint_d",
			"shellcheck",
			"shfmt",
			"black",
			"isort",
			"flake8",
		},
	},
}
