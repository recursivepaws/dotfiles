if vim.fn.has("nvim-0.11") == 0 then
  error("Need Neovim v0.11+ (Nightly) in order to run Cosmic!")
end

vim.filetype.add({
  extension = {
    mdx = "markdown",
  },
})
vim.filetype.add({
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
    ["%.bashrc"] = "sh",
    ["%.zshrc"] = "zsh",
    ["dot_zshrc%.tmpl"] = "zsh",
    ["dot_bashrc%.tmpl"] = "sh",
  },
})

local ok, err = pcall(require, "meovv")

if not ok then
  error(("Error loading core...\n\n%s"):format(err))
end

-- Deno-specific markup
vim.g.markdown_fenced_languages = {
  "ts=typescript",
}
