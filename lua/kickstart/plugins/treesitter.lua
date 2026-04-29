return {
	{ -- Tree-sitter parser installer/manager for Neovim 0.12+
		"romus204/tree-sitter-manager.nvim",
		dependencies = {}, -- tree-sitter CLI must be installed system-wide
		config = function()
			require("tree-sitter-manager").setup({
				ensure_installed = {
					"bash",
					"c",
					"diff",
					"html",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"query",
					"vim",
					"vimdoc",
				},
				-- Install missing parsers automatically when opening a filetype.
				auto_install = true,
				-- Use Neovim core Tree-sitter highlighting through tree-sitter-manager.
				highlight = true,
				-- Keep Ruby on regex highlighting, matching the old config's Ruby exception.
				nohighlight = { "ruby" },
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
