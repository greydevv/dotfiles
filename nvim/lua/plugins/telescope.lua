return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', function() require("telescope.builtin").find_files() end, desc = 'Telescope find files' },
    { '<leader>fg', function() require("telescope.builtin").live_grep() end,  desc = 'Telescope live grep' },
    { '<leader>fb', function() require("telescope.builtin").buffers() end,    desc = 'Telescope buffers' },
    { '<leader>fh', function() require("telescope.builtin").help_tags() end,  desc = 'Telescope help tags' },
  },
  opts = {
    defaults = {
      preview = false,
      layout_strategy = "vertical",
      layout_config = { height = 0.8 },
      file_ignore_patterns = {
        "%.o",
        "%.woff",
        "%.woff2",
        "%.ttf",
        "%.dSYM",
        "%.ico",
        "%.png",
        "%.jpeg",
        "%.jpg",
        "%.pyc",
        "pycache",
        "node_modules/.*",
      }
    },
    pickers = {
      find_files = {
        prompt_prefix = '  ',
      }
    }
  }
}
