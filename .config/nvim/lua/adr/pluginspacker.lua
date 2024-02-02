vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Simple plugins can be specified as strings
    use("rstacruz/vim-closer")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("tpope/vim-fugitive")
    -- Color theme
    use("navarasu/onedark.nvim")
    use("junegunn/goyo.vim")
    use("nvim-tree/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")

    use("lambdalisue/suda.vim")

    --runner
    use("CRAG666/code_runner.nvim")
    use("nvim-lua/plenary.nvim")
    --tree
    use("preservim/nerdtree")
    use("ThePrimeagen/harpoon")

    -- Auto comment
    use("terrortylor/nvim-comment")
    -- use ("mhartington/formatter.nvim")

    -- Tree sitter
    use("nvim-treesitter/nvim-treesitter", { run = "TSUpdate" })
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")

    -- Undo Tree
    use("mbbill/undotree")

    -- LANGUAGE SPECIFIC
    -- WEB DEV
    use("windwp/nvim-ts-autotag")
    use("mattn/emmet-vim")
    use("manzeloth/live-server")

    -- GO LANGUAGE
    use("fatih/vim-go")

    -- LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },    -- Required
            { "williamboman/mason.nvim" },  -- Optional
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "hrsh7th/cmp-buffer" }, -- Optional
            { "hrsh7th/cmp-path" }, -- Optional
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" },    -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
        },
    })
    use("nvim-lua/completion-nvim")
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })
    -- -- inc-rename
    -- use {
    --     "smjonas/inc-rename.nvim",
    --     config = function()
    --         require("inc_rename").setup()
    --     end,
    -- }
    -- galaxyline
    use({
        "NTBBloodbath/galaxyline.nvim",
        -- your statusline
        config = function()
            require("galaxyline.themes.eviline")
        end,
        -- some optional icons
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end,
    })
end)
