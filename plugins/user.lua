return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
    {
    "TimUntersberger/neogit",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy", --読み込みタイミングの指定
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
          },
        TODO = {
          icon = " ",
          color = "info",
          alt = {"todo", "Todo"},
        },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
        --ここに設定を記載
        --TODO: GPT4が対応した場合は以下を修正する
        openai_params = {
          model = "gpt-3.5-turbo",
          -- frequency_penalty = 0, 
          -- presence_penalty = 0, 
          -- max_tokens = 300, 
          -- temperature = 0, 
          -- top_p = 1, 
          -- n = 1, 
        },
        openai_edit_params = {
          model = "gpt-3.5-turbo",
          -- frequency_penalty = 0, 
          -- presence_penalty = 0, 
          -- temperature = 0, 
          -- top_p = 1, 
          -- n = 1, 
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  -- TODO: tab key との競合を解決
  -- {
  --   'codota/tabnine-nvim',
  --   event = "VeryLazy",
  --   build = './dl_binaries.sh',
  --   config = function()
  --     require('tabnine').setup({
  --       disable_auto_comment=true,
  --       accept_keymap="<Tab>",
  --       dismiss_keymap = "<C-]>",
  --       debounce_ms = 800,
  --       suggestion_color = {gui = "#808080", cterm = 244},
  --       exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  --       log_file_path = nil, -- absolute path to Tabnine log file
  --     })
  --     require('tabnine.status').status()
  --   end,
  -- },
  {
    "tzachar/cmp-tabnine",
    event = "VeryLazy",
    dependencies = "hrsh7th/nvim-cmp",
    after = "nvim-cmp",
    build = "./install.sh",
    config = function()
      require'cmp'.setup {
        sources = {
 	        { name = 'cmp_tabnine', priority = 1000, max_item_count = 5 },
 	        { name = 'nvim_lsp', priority = 900},
 	        { name = 'nvim_lua', priority = 800},
 	        { name = 'cmp-dap', priority = 900},
 	        { name = 'luasnip', priority = 700},
 	        { name = 'buffer', priority = 600},
 	        { name = 'path', priority = 200},
        },
      }
      local tabnine = require('cmp_tabnine.config')
      tabnine:setup({
	      max_lines = 1000,
	      max_num_results = 5,
	      sort = true,
	      run_on_every_keystroke = true,
	      snippet_placeholder = '..',
	      ignored_file_types = {
		      -- default is not to ignore
		      -- uncomment to ignore in lua:
		      -- lua = true
	      },
	      show_prediction_strength = false
      })
    end,
  },
}
