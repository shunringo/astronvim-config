return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    event = "VeryLazy",
    config = function()
      -- NOTE: 言語特有ののsnippetsを設定する場合は以下を参考に記載
      -- https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
      require 'luasnip'.filetype_extend("ruby", {"rails"})
    end,
  },
}
