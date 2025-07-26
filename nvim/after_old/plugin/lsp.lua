require("mason").setup({
  log_level = vim.log.levels.DEBUG,
  registries = {
    "github:mason-org/mason-registry"
  },
  ui = {
  }
})

vim.lsp.log.set_level(vim.log.levels.DEBUG)

vim.g.zig_fmt_autosave = 0
vim.g.zig_fmt_parse_errors = 0

vim.lsp.config["luals"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      }
    }
  }
}

vim.lsp.config["zls"] = {
  cmd = { "/???/Developer/zig/zls/zig-out/bin/zls" },
  filetypes = { "zig" },
  settings = {
    zls = {
      zig_lib_path = "/???/Developer/zig/zig/lib",
      zig_exe_path = "/???/Developer/zig/zig/build/stage3/bin/zig"
    }
  }
}

vim.lsp.enable("zls")
vim.lsp.enable("luals")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method("textDocument/rename") then
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end

    -- vim.o.updatetime = 50
    --
    -- -- see info about symbol
    -- vim.keymap.set("n", "gi", vim.lsp.buf.hover, {buffer = bufnr})
    --
    -- -- go to definition
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    --
    -- -- rename symbol
    -- vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer = bufnr})
    --
    -- -- see all references
    -- vim.keymap.set("n", "gu", vim.lsp.buf.references, {buffer = bufnr})
    --
    -- -- open diagnostic window
    -- vim.keymap.set("n", "ge", vim.diagnostic.open_float, {buffer = bufnr})
  end,
})
