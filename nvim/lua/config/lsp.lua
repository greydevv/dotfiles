require("mason").setup({
  log_level = vim.log.levels.INFO,
  registries = {
    "github:mason-org/mason-registry"
  },
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN]  = "W",
      [vim.diagnostic.severity.INFO]  = "I",
      [vim.diagnostic.severity.HINT]  = "H"
    }
  }
})

-- vim.lsp.log.set_level(vim.log.levels.DEBUG)

vim.g.zig_fmt_autosave = 0
vim.g.zig_fmt_parse_errors = 0

vim.lsp.config["luals"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  settings = {
    Lua = {
      diagnostics = {
        -- silence "Undefined global 'vim'" warnings
        globals = { "vim" }
      },
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
    local bufnr = client.bufnr;

    vim.o.updatetime = 50

    -- see info about symbol
    vim.keymap.set("n", "gi", vim.lsp.buf.hover, { buffer = bufnr })

    -- go to definition
    vim.keymap.set("n", "gd", vim.lsp.buf.definition)

    -- rename symbol
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = bufnr })

    -- see all references
    vim.keymap.set("n", "gu", vim.lsp.buf.references, { buffer = bufnr })

    -- open diagnostic window
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = bufnr })
  end,
})

local function get_tbl_keys(tbl)
  local keyset={}
  local n=0

  for k,_ in pairs(tbl) do
    n=n+1
    keyset[n]=k
  end

  return keyset
end

local log_file_mappings = {
  ["lsp"] = "/???/.local/state/nvim/lsp.log",
  ["zls"] = "/???/Library/Caches/zls/zls.log"
}

-- Opens a log file in the current buffer.
vim.api.nvim_create_user_command(
  "OpenLog",
  function(opts)
    local key = opts.fargs[1]

    if log_file_mappings[key] == nil then
      vim.api.nvim_echo({{ "Log file for '" .. key .. "' not in registry."}}, true, {})
      return
    end

    vim.cmd("edit " .. log_file_mappings[key])
  end,
  {
    desc = "Open a log file for some process.",
    nargs = 1,
    complete = function()
      return get_tbl_keys(log_file_mappings)
    end
  }
)
