return {
  -- Configure AstroNvim updates
  -- Configure colourscheme
  colorscheme = "carbonfox",
  -- Configure plugins, this can be moved to /user/plugins/
  plugins = {
    "AstroNvim/astrocommunity",
    -- ... import any community contributed plugins here
    -- { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.colorscheme.nightfox-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.nord-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.tokyonight-nvim", enabled = true },
    { import = "astrocommunity.colorscheme.everforest", enabled = true },
    { -- further customize the options set by the community
      "catppuccin",
      opts = {
        integrations = {
          sandwich = false,
          noice = true,
          mini = true,
          leap = true,
          markdown = true,
          neotest = true,
          cmp = true,
          overseer = true,
          lsp_trouble = true,
          rainbow_delimiters = true,
        },
      },
    },
  },
}
