

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`


-- Diagnostic keymaps
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({count=-1, float=true}) end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({count=1, float=true}) end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  if client.name ~= "jdtls" then
    client.server_capabilities.completionProvider = false
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>d', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- nmap('<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')

end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local lsp = require 'lspconfig'

local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  -- lua_ls = {
  --   Lua = {
  --     workspace = { checkThirdParty = false },
  --     telemetry = { enable = false },
  --   },
  -- },
}


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

lsp.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.ocamllsp.setup {
  cmd = { 'ocamllsp' },
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = capabilities
}

lsp.denols.setup {
  root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc"),
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.ols.setup {
  cmd = { 'ols' },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lsp.util.root_pattern("ols.json", ".git", "src"),-- "*.odin"),
  single_file_support = true,
  settings = {
    enable_document_symbols = true,
    enable_procedure_context = true,
    enable_inlay_hints = true,
    enable_fake_methods = true,
    enable_references = true,
    enable_hover = true,
    verbose = true,

    enable_procedure_snippet = false,
    enable_semantic_tokens = false,
    enable_snippets = false,
  },
}

-- lsp.zls.setup {
--   cmd = { 'zls' },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = lsp.util.root_pattern("build.zig"),
-- }

-- lsp.ts_ls.setup {
--   root_dir = lsp.util.root_pattern("package.json"),
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

lsp.serve_d.setup {
  cmd = {
    'serve-d --provide context-snippets --provide default-snippets'
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.nim_langserver.setup {
  root_dir = lsp.util.root_pattern("*.nim","*.nims","*.nimble"),
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.gdscript.setup {
  --force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
  single_file_support = true,
  root_dir = lsp.util.root_pattern('project.godot', '.git'),
  filetypes = {'gd', 'gdscript', 'gdscript3' },
  on_attach = on_attach,
  capabilities = capabilities,
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    lsp[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'


require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local s = luasnip.snippet
local i = luasnip.insert_node
local t = luasnip.text_node

luasnip.add_snippets("all", {
  s("fold comment", {
    i(1), t('{{{ }}}'),
  })
})

---@diagnostic disable-next-line: missing-fields
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace, -- NOTE: replace?
      select = true,
    },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if luasnip.locally_jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
            local result = vim.tbl_filter(
              function(buf)
                return vim.fn.buflisted(buf) == 1 and
                       vim.fn.bufloaded(buf) == 1
              end,
              vim.api.nvim_list_bufs()
            )
          return result
        end,
      }
    },
    { name = 'luasnip' },
  },
}

