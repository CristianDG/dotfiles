return {

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  -- 'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = "legacy", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- Markdown

  { 'godlygeek/tabular' },
  {
    'plasticboy/vim-markdown',
    init = function ()
      vim.g.markdown_recommended_style = 0
    end,
  },


  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',


      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'ray-x/lsp_signature.nvim',
    event = "VeryLazy",
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      formatters = {
        clang_format = {
          prepend_args = { '--style=file', '--fallback-style=WebKit' },
        },
      }
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- icons
  -- { 'nvim-tree/nvim-web-devicons' },

  -- File tree
  -- {
  --   'nvim-tree/nvim-tree.lua',
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },

  -- {
  --   'stevearc/oil.nvim',
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },


  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',          opts = {} },

  -- git worktrees
  { 'ThePrimeagen/git-worktree.nvim' },
  {
    'numToStr/Comment.nvim',
    options = {
      ignore = '^$',
      mappings = {
        basic = false,
        extra = false,
      },
    },
    lazy = false,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      multiwindow = true, -- Enable multiwindow support.
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
      line_numbers = true,
      multiline_threshold = 20, -- Maximum number of lines to show for a single context
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
      -- Separator between context and content. Should be a single character string, like '-'.
      -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
      separator = nil,
      zindex = 20, -- The Z-index of the context window
      on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
    }
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        --vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'onedark'
    -- end,
  },

  {
    "blazkowolf/gruber-darker.nvim",
    init = function ()
      local c = require('gruber-darker.palette')
      local opts = require("gruber-darker.config").get_opts()
      local gruber_hl = require("gruber-darker.highlights.colorscheme").highlights
      local Highlight = require("gruber-darker.highlight")
      local tshl = require("gruber-darker.highlights.treesitter")
      local vim_hl = require("gruber-darker.highlights.vim")
      -- local Color = require('gruber-darker.color')

      vim_hl.highlights.normal_float = Highlight.new("NormalFloat", { fg = c["niagara-2"], bg = c.bg })

      gruber_hl.dark_niagara = Highlight.new("GruberDarkerDarkNiagara", { fg = c.niagara })
      gruber_hl.dark_niagara_bold = Highlight.new("GruberDarkerDarkNiagaraBold", { fg = c.niagara, bold = opts.bold })
      gruber_hl.darker_niagara = Highlight.new("GruberDarkerDarkestNiagara", { fg = c["niagara-1"] })
      gruber_hl.darker_niagara_bold = Highlight.new("GruberDarkerDarkestNiagaraBold", { fg = c["niagara-1"], bold = opts.bold })

      tshl.highlights.punctuation_bracket = Highlight.new( "@punctuation.bracket", { })
      tshl.highlights.builtin = Highlight.new("@builtin", { link = tshl.highlights.type })
      tshl.highlights.module = Highlight.new("@module", { link = gruber_hl.none })
      tshl.highlights.module = Highlight.new("@module", { link = gruber_hl.none })

      tshl.highlights.variable_builtin = Highlight.new("@variable.builtin", { link = tshl.highlights.builtin })
      tshl.highlights.type_builtin = Highlight.new("@type.builtin", { link = tshl.highlights.builtin })
      tshl.highlights.type_definition = Highlight.new("@type.definition", { link = tshl.highlights.builtin })

    end
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
  },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    --
    main = "ibl",
    opts = {
      indent = {
        char = '┊',
      },
    },
    init = function ()
      local hooks = require "ibl.hooks"

      local isspace = function(str)
        return str:match("%s") ~= nil
      end

      hooks.register(hooks.type.SKIP_LINE, function(_, _, _, line)
        if #line == 0 then
          return false
        end

        local skip = true
        for i=1, #line do
	        skip = skip and isspace(line:sub(i, i))
          if not skip then
            break
          end
        end

        return skip
      end)
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO(Cristian): sla
    -- TODO: sla
    opts = {
      keywords = {
        CLEANUP = { color = "warning" },
        STUDY = { color = "warning" },
        SPEED = { color = "error" },
        IMPORTANT = { color = "warning" },
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "", -- "fg" or "bg" or empty
        pattern = [[.*<((KEYWORDS)(\(.{-1,}\))?):]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      search = {
        -- ripgrep regex, supporting the pattern TODO(name):
        pattern = [[\b(KEYWORDS)(\(\w*\))*:]],
      }
    }
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     "theHamsta/nvim-dap-virtual-text",
  --     "nvim-neotest/nvim-nio",
  --   },
  -- },

  { 'wbthomason/packer.nvim' },
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- EMMET
  { 'https://github.com/mattn/emmet-vim' },
  -- NIM
  { 'alaviss/nim.nvim', ft = "nim" },
  -- c3
  { 'Airbus5717/c3.vim', ft = "c3" },
}
