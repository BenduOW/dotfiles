---@diagnostic disable: undefined-global

return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.setconceallevel = 1
    vim.g.tex_conceallevel = "abdmg"
    vim.g.vimtext_compiler_method = "latexmk"
    -- From: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L4671-L4713
--    vim.o.foldmethod = "expr"
--    vim.o.foldexpr="vimtex#fold#level(v:lnum)"
--    vim.o.foldtext="vimtex#fold#text()"
--    vim.o.foldlevel=2
  end,
}
