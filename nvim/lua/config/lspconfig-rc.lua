--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end
protocol.CompletionItemKind = {
  '', -- Text
  '󰡱', -- Method
  '󰊕', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  '󰜰', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '󰎠', -- Value
  '', -- Enum
  '󰌆', -- Keyword
  '󰘍', -- Snippet
  '', -- Color
  '', -- File
  '󰆑', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  '󰘧', -- Operator
  '', -- TypeParameter
}

--Set up completion using nvim_cmp with LSP source
--local capabilities = require('cmp_nvim_lsp').update_capabilities(
--
--  vim.lsp.protocol.make_client_capabilities()
--)
--
-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if (not status) then return end
local cmp_status, _ = pcall(require, 'cmp_nvim_lsp')
local capabilities
if (cmp_status) then
    capabilities = require('cmp_nvim_lsp').default_capabilities()
elseif not cmp_status then
    capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItemKind.snippetSupport = true
end
local ddc_status, _ = pcall(require, 'ddc_source_lsp')
if(ddc_status) then
    capablilities = require("ddc_source_lsp").make_client_capabilities()
end

nvim_lsp.docker_compose_language_service.setup{}
nvim_lsp.dockerls.setup{}

nvim_lsp.rust_analyzer.setup{
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true;
            }
        }
    }
}

nvim_lsp.denols.setup({
  capabilities = capabilities,
})
nvim_lsp.pylsp.setup{
  capabilities = capabilities,
  cmd = {"pylsp"},
    settings = {
        pylsp = {
            configurationSources = {"flake8",},
            plugins = {
                pycodestyle = {
                    enabled = true
                },
                mccabe = {
                    enabled = false
                },
                pyflakes = {
                    enabled = false
                },
                flake8 = {
                    enabled = true
                },
                pylsp_mypy = {
                    enabled = true
                },
            }
        }
    },
  on_attach = on_attach,
}

nvim_lsp.omnisharp.setup{
--  capabilities = capabilities,
--  on_attach = on_attach,
  cmd = { "dotnet", "~/omnisharp/OmniSharp.dll" },
}


nvim_lsp.clangd.setup{
  cmd = {"clangd-12"},
  capabilities = capabilities,
  on_attach = on_attach,
  }
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
