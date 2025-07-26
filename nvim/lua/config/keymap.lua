local function bind(op, outer_opts)
  outer_opts = outer_opts or {noremap = true}
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
      outer_opts,
      opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

nmap = bind("n", {noremap = false})
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")
tnoremap = bind("t")

-- netrw
nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("zz", "<cmd>wa<CR>")
nnoremap("r", "<cmd>redo<CR>")

-- esc to :noh
nnoremap("<ESC>", "<cmd>noh<CR>")

-- Floaterm Rust Commands
-- nnoremap("<Leader>c", ":FloatermNew --title=[\\ cargo\\ run\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo run<CR>")
-- nnoremap("<Leader>v", ":FloatermNew --title=[\\ cargo\\ test\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo test <CR>")
-- nnoremap("<Leader>b", ":FloatermNew --title=[\\ cargo\\ build\\ ] --autoclose=0 --wintype=float --height=0.8 --width=0.9 cargo build <CR>")
-- nnoremap("<Leader>d", ":FloatermNew --title=[\\ cargo\\ doc\\ ] --autoclose=1 --wintype=float --height=0.8 --width=0.9 cargo doc --no-deps --document-private-items --open <CR>")
