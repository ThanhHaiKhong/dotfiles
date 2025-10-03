-- plugins.lua - Enhanced plugin configuration
require("lazy").setup({
  -- ============================================================================
  -- CORE FUNCTIONALITY
  -- ============================================================================

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python",
          "rust", "go", "java", "swift", "c", "cpp", "html", "css", "json",
          "yaml", "toml", "markdown", "bash", "dart"
        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = { enable = true },
      })
    end,
  },

  { "b0o/schemastore.nvim" }, -- JSON/YAML schemas

  -- Mason for LSP/DAP/Linter/Formatter management
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "ts_ls", "pyright", "rust_analyzer",
          "gopls", "jdtls", "clangd"
        }
      })
    end,
  },

  -- ============================================================================
  -- COMPLETION & SNIPPETS
  -- ============================================================================

  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim", -- Icons for completion
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50,
          })
        }
      })
    end,
  },

  -- Snippet engine
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" }, -- Predefined snippets

  -- ============================================================================
  -- TELESCOPE (FUZZY FINDER)
  -- ============================================================================

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- Better sorting
      "nvim-telescope/telescope-project.nvim", -- Project management
    },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = " 🔍 ",
          selection_caret = " ➤ ",
          path_display = { "truncate" },
          file_ignore_patterns = { "node_modules", ".git" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          project = {
            base_dirs = {
              {'~/Projects', max_depth = 2},
              {'~/Documents', max_depth = 1},
              {'~/Desktop', max_depth = 1},
              {'~/', max_depth = 1},
            },
            hidden_files = true,
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
          }
        }
      })
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("project")
    end,
  },

  -- ============================================================================
  -- UI ENHANCEMENTS
  -- ============================================================================

  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- night, moon, day, storm
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
      vim.cmd[[colorscheme tokyonight]]
    end,
  },

  -- Icons
  { "nvim-tree/nvim-web-devicons" },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        }
      })
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "┊" },
        scope = { enabled = false },
      })
    end,
  },

  -- Better buffer/tab management
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          show_buffer_close_icons = false,
          show_close_icon = false,
        }
      })
    end,
  },

  -- ============================================================================
  -- GIT INTEGRATION
  -- ============================================================================

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 1000,
        },
      })
    end,
  },

  -- Git commands
  { "tpope/vim-fugitive" },

  -- Lazygit integration
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      { "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Current File" },
    },
  },

  -- ============================================================================
  -- EDITING ENHANCEMENTS
  -- ============================================================================

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      -- Integration with nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Surround operations
  { "tpope/vim-surround" },

  -- Multiple cursors
  { "mg979/vim-visual-multi" },

  -- Tmux integration
  { "christoomey/vim-tmux-navigator" },

  -- ============================================================================
  -- TERMINAL & NAVIGATION
  -- ============================================================================

  -- Terminal toggle
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })
    end,
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- ============================================================================
  -- QUALITY OF LIFE
  -- ============================================================================

  -- Auto-save
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        trigger_events = {"InsertLeave", "TextChanged"},
        debounce_delay = 135,
      })
    end,
  },

  -- Session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup()
    end,
  },

  -- Startup screen
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "    ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        "    ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        "    ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        "    ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        "    ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        "    ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", "  Find project", ":Telescope project project <CR>"),
        dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
        dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
      }

      alpha.setup(dashboard.opts)
    end,
  },

  -- ============================================================================
  -- LANGUAGE SPECIFIC & FORMATTING
  -- ============================================================================

  -- Formatting and linting (replaces null-ls which is deprecated)
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "black", "isort" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          swift = { "swiftformat" },
          c = { "clang_format" },
          cpp = { "clang_format" },
          rust = { "rustfmt" },
          go = { "gofmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },

  -- Better diagnostics
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  },

  -- ============================================================================
  -- ADDITIONAL PRODUCTIVITY PLUGINS
  -- ============================================================================

  -- Better quickfix window
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({})
    end,
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
      })
    end,
  },

  -- Highlight word under cursor
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { "lsp" },
        },
      })
    end,
  },

  -- Better incremental search
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup({})

      local kopts = {noremap = true, silent = true}
      vim.api.nvim_set_keymap('n', 'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', 'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts)
      vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end,
  },

  -- Rainbow brackets
  {
    "luochen1990/rainbow",
    config = function()
      vim.g.rainbow_active = 1
    end,
  },

  -- ============================================================================
  -- DEBUGGING (DAP)
  -- ============================================================================

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- Required for nvim-dap-ui
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({})
      require("nvim-dap-virtual-text").setup({})

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Debug keymaps
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>dc", dap.continue)
      vim.keymap.set("n", "<leader>ds", dap.step_over)
      vim.keymap.set("n", "<leader>di", dap.step_into)
      vim.keymap.set("n", "<leader>do", dap.step_out)
      vim.keymap.set("n", "<leader>dr", dap.repl.open)
    end,
  },

})