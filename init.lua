return {
  -- Configure AstroNvim updates
  -- Configure colourscheme
  colorscheme = "carbonfox",
  -- Configure plugins, this can be moved to /user/plugins/
  plugins = {
    {
      { -- override nvim-cmp plugin
        "hrsh7th/nvim-cmp",
        keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
        dependencies = {
          "hrsh7th/cmp-cmdline", -- add cmp-cmdline as dependency of cmp
        },
        config = function(plugin, opts)
          local cmp = require("cmp")
          -- run cmp setup
          cmp.setup(opts)

          -- configure `cmp-cmdline` as described in their repo: https://github.com/hrsh7th/cmp-cmdline#setup
          cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          })
        end,
      },
      { -- override nvim-cmp plugin
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-emoji", -- add cmp source as dependency of cmp
        },
        -- override the options table that is used in the `require("cmp").setup()` call
        opts = function(_, opts)
          -- opts parameter is the default options table
          -- the function is lazy loaded so cmp is able to be required
          local cmp = require("cmp")
          -- modify the sources part of the options table
          opts.sources = cmp.config.sources({
            { name = "nvim_lsp", priority = 1000 },
            { name = "luasnip", priority = 750 },
            { name = "buffer", priority = 500 },
            { name = "path", priority = 250 },
            { name = "emoji", priority = 700 }, -- add new source
          })

          -- return the new table to be used
          return opts
        end,
      },
    },
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
