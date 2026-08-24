return {
	"pmizio/typescript-tools.nvim",
	ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		tsserver_file_preferences = {
			autoImportFileExcludePatterns = {
				"**/node_modules/react-native/types/**",
			},
		},
	},
	keys = {
		{ "gri", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to source definition" },
		{ "<leader>mi", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add missing imports" },
	},
}
