return {
	"ej-shafran/compile-mode.nvim",
	branch = "latest",
	-- or a specific version:
	-- tag = "v4.0.0"
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- if you want to enable coloring of ANSI escape codes in
		-- compilation output, add:
		{ "m00qek/baleia.nvim", tag = "v1.3.0" },
	},
	config = function(args)
		---@type CompileModeOpts
		vim.g.compile_mode = {
			-- to add ANSI escape code support, add:
			baleia_setup = true,
			error_regexp_table = {
				typescript = {
					-- TypeScript errors take the form
					-- "path/to/error-file.ts(13,23): error TS22: etc."
					regex = "^\\(.\\+\\)(\\([1-9][0-9]*\\),\\([1-9][0-9]*\\)): error TS[1-9][0-9]*:",
					filename = 1,
					row = 2,
					col = 3,
				},
			},
		}

		vim.keymap.set("n", "<leader>cn", function()
			require("compile-mode").next_error()
		end, {})
		vim.keymap.set("n", "<leader>cp", function()
			require("compile-mode").prev_error()
		end, {})
		vim.keymap.set("n", "<M-c>", "<CMD>Compile<CR>")
		vim.keymap.set("n", "<M-r>", "<CMD>Recompile<CR>")
	end,
	lazy = false,
}
