return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      ---@class snacks.explorer.Config
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
          },
          files = {
            hidden = true,
          },
        },
      },
    },
  },
}
