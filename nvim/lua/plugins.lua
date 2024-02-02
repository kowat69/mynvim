return {
    {
        'jbgutierrez/vim-better-comments',
        event = 'VeryLazy',
    },
    {
        'svrana/neosolarized.nvim',
        dependencies = {'tjdevries/colorbuddy.nvim',},
        event = 'VeryLazy',
        config = function()
--            require('config.neosolarized-rc')
        end,
    },
    {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
            require('config.tokyonight-rc')
            vim.cmd[[colorscheme tokyonight]]
      end
    },
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        config = function()
            require('config.lualine-rc')
        end
    },
    { 
        'neovim/nvim-lspconfig',
        event = 'VeryLazy',
        config = function()
            require('config.lspconfig-rc')
        end

    },-- LSP
    {
        'williamboman/mason.nvim',
        event = 'VeryLazy',
    },
    {
        'williamboman/mason-lspconfig.nvim',
        event = 'VeryLazy',
        config = function()
            require('config.mason-rc')
        end
    },
    {
        'onsails/lspkind-nvim',
        event = 'InsertEnter',
        config = function()
            require('config.lspkind-rc')
        end
    },
    {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('config.lspsaga-rc')
        end
    },
    {
        'hrsh7th/nvim-cmp', event = {'InsertEnter', 'CmdlineEnter'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter', enabled = true}, -- nvim-cmp source for neovim's build-in LSP
            {'hrsh7th/cmp-omni', event = 'InsertEnter', enabled = true},
            {'hrsh7th/cmp-buffer', event = 'InsertEnter', enabled = true}, -- nvim-cmp source for buffer words
            {'hrsh7th/cmp-path', event = 'InsertEnter', enabled = true}, -- nvim-cmp source for path
            {'hrsh7th/cmp-cmdline', event = 'ModeChanged', enabled = true}, -- nvim-cmp source for command wordsv
            {'hrsh7th/cmp-nvim-lsp-signature-help', event = 'InsertEnter', enabled = true},
            {'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'InsertEnter', enabled = true},
            {'hrsh7th/cmp-calc', event = 'InsertEnter', enabled = true},
        },
        enabled = true,
        config = function()
            require('config.cmp-rc')
        end
    }, -- Completion
--    {
--        "Shougo/ddc.vim",
--        event = 'VeryLazy',
--        enable = true,
--        dependencies = {
--          "vim-denops/denops.vim",
--          -- UI
--          "Shougo/ddc-ui-native",
--          -- Source
--          "Shougo/ddc-source-around",
--          "Shougo/ddc-source-lsp",
--          'uga-rosa/ddc-source-lsp-setup',
--          "LumaKernel/ddc-source-file",
--
--          'hrsh7th/vim-vsnip',
--          'uga-rosa/ddc-source-vsnip',
----          'hrsh7th/vim-vsnip-integ',
--          -- Filter
--          "Shougo/ddc-filter-matcher_head",
--          "Shougo/ddc-filter-matcher_length",
--          "Shougo/ddc-filter-sorter_rank",
--          "Shougo/ddc-filter-converter_remove_overlap",
--          -- Preview
--          "matsui54/denops-popup-preview.vim",
--          "matsui54/denops-signature_help",
--        },
--        config = function()
--            require('config.ddc-rc')
--        end
--    },
    {
        'SirVer/ultisnips',
        event = 'InsertEnter'
    },
    {
        'honza/vim-snippets',
        event = 'InsertEnter'
    },

    {
        'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        build = ':TSUpdate', 
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        config = function()
            require('config.treesitter-rc')
            vim.cmd([[LspStart]])
        end
    },
    -- LSP UIs
        {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function()
            require('config.autopairs-rc')
        end
   },-- LSP UIs
    {
        'windwp/nvim-ts-autotag',
        event = 'InsertEnter',
        config = function()
            require('config.ts-autotag-rc')
        end
    },

    {
        'akinsho/bufferline.nvim', version = "*",
        
        event = 'VeryLazy',
        config = function()
            require('config.bufferline-rc')
        end
    },
    {
        'norcalli/nvim-colorizer.lua',
        event = {'BufNewFile','BufRead'},
        config = function()
            require('config/colorizer-rc')
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        event = 'VeryLazy',
        config = function()
            require('config.web-devicons-rc')
        end
    },

    { 
        "nvim-telescope/telescope.nvim",
        event = 'VeryLazy',
    },
    {
        "nvim-lua/plenary.nvim",
        event = 'VeryLazy',
    },

    {
        'nvim-telescope/telescope-file-browser.nvim',
        event = 'VeryLazy',
        config = function()
            require('config.telescope-rc')
        end
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = 'VeryLazy',
        config = function()
            require('config.toggleterm-rc')
        end,

    }

}
