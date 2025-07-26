vim.opt.background = "dark"

-- require("evergarden").setup({
--   transparent_background = false,
--   contrast_dark = "medium",
--   override_terminal = false,
-- })

-- require("gruvbox").setup()

vim.cmd [[ colorscheme warm_noir ]]

vim.api.nvim_create_autocmd("OptionSet", {
  desc = "Automatically apply theme when background changes",
  pattern = "background",
  callback = function(ev)
    vim.cmd [[ colorscheme warm_noir ]]
  end
})
