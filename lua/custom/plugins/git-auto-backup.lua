return {
	"yo-reign/nvim-git-auto-backup",
	opts = {
		dirs = { "~/notes" }, -- must be git dir/s
		interval = 15, -- per minute/s
		commit_prefix = "Backup", -- prefix for commit messages
		push = true, -- push after each commit
		pull = true, -- pull before commit cycle
		pull_on_open = true, -- pull when nvim starts
		enabled = true, -- start timer automatically
	},
}
