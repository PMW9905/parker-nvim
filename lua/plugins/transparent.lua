return {
	"xiyaowong/transparent.nvim",

	config = function()
		require("transparent").clear_prefix("NeoTree")
		vim.keymap.set("n", "<leader>tt", ":TransparentToggle<CR>")
	end,
}
