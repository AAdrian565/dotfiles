local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "christoomey/vim-titlecase",
  "christoomey/vim-system-copy",
  "christoomey/vim-tmux-navigator",
  "nvim-lua/plenary.nvim",
  -- Color theme/ decoration
  "navarasu/onedark.nvim",
  "folke/tokyonight.nvim",
  "nvim-tree/nvim-tree.lua",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Utilities
  "github/copilot.vim",
  -- "Exafunction/codeium.vim",
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  "lambdalisue/suda.vim",
  -- "nvim-lua/completion-nvim",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({ --[[ your config ]]
      })
    end,
  },
  "nvim-lualine/lualine.nvim",
  "mbbill/undotree",
  "honza/vim-snippets",
  "mg979/vim-visual-multi",
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  "AndrewRadev/splitjoin.vim",
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  "CRAG666/code_runner.nvim",
  {
    "imNel/monorepo.nvim",
    config = function()
      require("monorepo").setup({
        -- Your config here!
      })
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  --games
  "ThePrimeagen/vim-be-good",
  --tree/ navigation
  "preservim/nerdtree",
  "ThePrimeagen/harpoon",
  -- Auto comment
  "tpope/vim-commentary",
  "nvimtools/none-ls.nvim",

  -- Tree sitter
  { "nvim-treesitter/nvim-treesitter", build = "TSUpdate" },
  "nvim-treesitter/playground",
  "nvim-treesitter/nvim-treesitter-context",
  -- LANGUAGE SPECIFIC
  -- WEB DEV
  "windwp/nvim-ts-autotag",
  -- "mattn/emmet-vim",
  -- "manzeloth/live-server",
  -- GO LANGUAGE
  "fatih/vim-go",
  "rstacruz/vim-closer",
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
  -- FLUTTER
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  -- LSP
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },          -- Required
      { "williamboman/mason.nvim" },        -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional
      -- Autocompletion
      { "hrsh7th/nvim-cmp" },               -- Required
      { "hrsh7th/cmp-nvim-lsp" },           -- Required
      { "hrsh7th/cmp-buffer" },             -- Optional
      { "hrsh7th/cmp-path" },               -- Optional
      { "saadparwaiz1/cmp_luasnip" },       -- Optional
      { "hrsh7th/cmp-nvim-lua" },           -- Optional
      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        version = "<CurrentMajor>.*",
        build = "make install_jsregexp",
      },
      -- { 'L3MON4D3/LuaSnip' }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("startup").setup({ theme = "greeterTheme" })
    end,
  },
})
