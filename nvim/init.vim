source $HOME/.vimrc
" source $HOME/.config/nvim/plug-config/coc.nvim

lua << EOF
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "%.o",
            "%.dSYM",
            "%.png",
            "%.jpg",
            "%.pyc",
            "pycache",
            "./node%_modules"
        }
    }
}
EOF
