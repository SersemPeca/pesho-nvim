(local lazy (require "lazy"))

(local
  plugins
  [;; Fennel loader
   {1 :rktjmp/hotpot.nvim
    :prority 1000
    :lazy false
    :config (. (require :pesho.config.hotpot) :config)}

   {1 "akinsho/toggleterm.nvim"
    :config (fn []
              ((. (require "toggleterm") :setup) {}))}

   {:dir "~/Projects/FMI/Vim/nix-update.nvim"
    :config (fn []
              (let [nix-update (require "nix-update")
                    nix-update-fetches (require "nix-update.fetches")]
                (nix-update.setup)
                (vim.keymap.set :n :<leader>nc nix-update-fetches.prefetch-fetch)))}

   {:dir "~/Projects/FMI/Vim/docker-decompose-nvim"
    :dependencies ["akinsho/toggleterm.nvim" "nvim-telescope/telescope.nvim"]}

   {1 :mfussenegger/nvim-jdtls
    :config (. (require :pesho.config.jdtls) :config)} 
   {1 :nanotee/luv-vimdocs}

   {1 :isovector/cornelis
    :dependencies [:neovimhaskell/nvim-hs.vim
                   :kana/vim-textobj-user
                   :junegunn/vim-easy-align]
    :config (. (require :pesho.config.cornelis) :config)}


   {1 :kawre/leetcode.nvim
    :build ":TSUpdate html"
    :dependencies ["nvim-treesitter/nvim-treesitter"
                   "nvim-telescope/telescope.nvim"
                   "nvim-lua/plenary.nvim"
                   "MunifTanjim/nui.nvim"
                   "nvim-tree/nvim-web-devicons"]
    :opts {:console {:open_on_runcode true}}}

   {1 :milisims/nvim-luaref}
    
   ;; LSP
   ;; Language server set-up happens through tables contained within lspconfig file from nvim-LSPConfig
   {1 :neovim/nvim-lspconfig
    :config (. (require :pesho.config.lsp) :config)} 

   {1 :nvim-treesitter/playground
    :dependencies :nvim-treesitter/nvim-treesitter}

   ;; Neogit
   {1 :NeogitOrg/neogit
    :dependencies ["nvim-lua/plenary.nvim"
                   "sindrets/diffview.nvim"
                   "nvim-telescope/telescope.nvim"]}
    
    

   ;; Telescope  
   {1 :nvim-telescope/telescope.nvim
    :config (. (require :pesho.config.telescope) :config)
    :dependencies ["nvim-lua/plenary.nvim"]
    :tag "0.1.4"}
   ;; Telescope-ui-select
   {1 :nvim-telescope/telescope-ui-select.nvim}

   ;; Which-key
   {1 :folke/which-key.nvim
    :config (. (require :pesho.config.whichkey) :config)}

   {1             :TimUntersberger/neogit
    :dependencies [:nvim-lua/plenary.nvim]
    :config       #((. (require :neogit) :setup) {})}

   ;;Colorizer
   {1 :NvChad/nvim-colorizer.lua
    :config (. (require :pesho.config.colorizer) :config)}

   ;;Treesitter
   {1 :nvim-treesitter/nvim-treesitter
    :config (. (require :pesho.config.treesitter) :config)}

   {1 :nvim-treesitter/nvim-treesitter-textobjects}
   {1 :mfussenegger/nvim-ts-hint-textobject}
   {1 :HiPhish/nvim-ts-rainbow2}
   {1 :romgrk/nvim-treesitter-context}
   {1 :JoosepAlviste/nvim-ts-context-commentstring}
   {1 :windwp/nvim-ts-autotag}
   {1 :RRethy/nvim-treesitter-textsubjects}

   ;;Neo-tree
   {1 :nvim-neo-tree/neo-tree.nvim
    :branch "v2.x"
    :dependencies ["nvim-lua/plenary.nvim" 
                   "nvim-tree/nvim-web-devicons" 
                   "MunifTanjim/nui.nvim"]
    :config (. (require :pesho.config.neotree) :config)}


    ;;Rust-analyzer setup
   {1 :simrat39/rust-tools.nvim
    :dependencies ["neovim/nvim-lspconfig"
                   "nvim-lua/plenary.nvim"
                   "mfussenegger/nvim-dap"]}

    ;;Autopairs
   {1 :windwp/nvim-autopairs
    :config (. (require :pesho.config.autopairs) :config)
    :dependencies ["nvim-treesitter/nvim-treesitter"]}

    ;;Luasnip
   {1 :L3MON4D3/LuaSnip
    :config (. (require :pesho.config.luasnip) :config)}

    ;;Autocomplete
   {1 :hrsh7th/nvim-cmp
    :dependencies ["hrsh7th/cmp-nvim-lsp"
                   "saadparwaiz1/cmp_luasnip"
                   "hrsh7th/cmp-buffer"
                   "hrsh7th/cmp-nvim-lua"
                   "hrsh7th/cmp-path"
                   "hrsh7th/cmp-calc"
                   "f3fora/cmp-spell"
                   "andersevenrud/cmp-tmux"
                   "hrsh7th/cmp-cmdline"
                   "hrsh7th/cmp-omni"
                   "windwp/nvim-autopairs"]
    :config (. (require :pesho.config.cmp) :config)}
     
   ;; Surround
   {1 :kylechui/nvim-surround
    :config nil}

   ;; Tabout
   {1 :abecodes/tabout.nvim
    :config nil}

   ;; Indent Blankline
   {1 :lukas-reineke/indent-blankline.nvim
    :config nil}

   ;; Parinfer
   {1 :eraserhd/parinfer-rust
    :build "cargo build --release"
    :cond (= (vim.fn.executable :cargo) 1)
    :config (. (require :pesho.config.parinfer) :config)}

   ;; Theme
   {1 :folke/tokyonight.nvim
    :prority 1000
    :lazy false
    :config  (. (require :pesho.config.tokyonight) :config)}])

(local opts
       {:concurrenct 30})

(lazy.setup plugins opts)
