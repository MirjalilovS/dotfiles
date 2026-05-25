return {
  -- 1. Install and configure the Everforest theme
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        -- Match the "medium" contrast you mentioned earlier
        background = "medium",

        -- Set to 1 or 2 if you want Neovim to be slightly transparent
        -- (Assuming you have transparency set in Alacritty and Niri)
        transparent_background_level = 0,

        -- Enable italic for comments (optional but looks great in Everforest)
        italics = true,
      })
    end,
  },

  -- 2. Tell LazyVim to override Tokyonight and use Everforest instead
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
