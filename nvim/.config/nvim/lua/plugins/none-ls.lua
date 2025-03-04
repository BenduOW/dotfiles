return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- C:
        null_ls.builtins.formatting.clang_format,
				-- lua:
				null_ls.builtins.formatting.stylua,
				-- python:
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy,
				--null_ls.builtins.diagnostics.ruff,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
