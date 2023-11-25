return {
  -- Configure AstroNvim updates
  updater = {
    -- remote = "origin", --remote to use
    -- channel = "nightly", -- "stable" or "nightly"
    -- version = "latest",
  },
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
    {
      "goolord/alpha-nvim",
      opts = function(_, opts) --overide the options using lazy.nvim
        opts.section.header.val = { -- change the header section
          "███╗   ██╗        ██╗   ██╗  ██╗ █████╗ ███████╗███████╗",
          "████╗  ██║        ██║   ██║  ██║██╔══██╗██╔════╝██╔════╝",
          "██╔██╗ ██║        ██║   ███████║███████║█████╗  ███████╗",
          "██║╚██╗██║   ██   ██║   ██╔══██║██╔══██║██╔══╝  ╚════██║",
          "██║ ╚████║██╗╚█████╔╝██╗██║  ██║██║  ██║███████╗███████║",
          "╚═╝  ╚═══╝╚═╝ ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝",
        }
      end,
    },
    {
      "lervag/vimtex",
      lazy = false,
      init = function()
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
          callback = 1,
          continuous = 1,
          executable = "latexmk",
          options = {
            "-shell-escape",
            "-verbose",
            "-file-line-error",
            "-synctex=1",
            "-interaction=nonstopmode",
          },
        }
        vim.g.vimtex_compiler_latexmk_engines = {
          "lualatex",
        }
        vim.g.vimtex_view_general_viewer = "SumatraPDF"
        vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
        -- vim.g.vimtex_view_method = "SumatraPDF"
        -- add which-key mapping descriptions for VimTex
        vim.api.nvim_create_autocmd("FileType", {
          desc = "Set up VimTex Which-Key descriptions",
          group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
          pattern = "tex",
          callback = function(event)
            local wk = require("which-key")
            local opts = {
              mode = "n", -- NORMAL mode
              buffer = event.buf, -- Specify a buffer number for buffer local mappings to show only in tex buffers
            }
            local mappings = {
              ["<localleader>l"] = {
                name = "+VimTeX",
                a = "Show Context Menu",
                C = "Full Clean",
                c = "Clean",
                e = "Show Errors",
                G = "Show Status for All",
                g = "Show Status",
                i = "Show Info",
                I = "Show Full Info",
                k = "Stop VimTeX",
                K = "Stop All VimTeX",
                L = "Compile Selection",
                l = "Compile",
                m = "Show Imaps",
                o = "Show Compiler Output",
                q = "Show VimTeX Log",
                s = "Toggle Main",
                t = "Open Table of Contents",
                T = "Toggle Table of Contents",
                v = "View Compiled Document",
                X = "Reload VimTeX State",
                x = "Reload VimTeX",
              },
              ["ts"] = {
                name = "VimTeX Toggles & Cycles", -- optional group name
                ["$"] = "Cycle inline, display & numbered equation",
                c = "Toggle star of command",
                d = "Cycle (), \\left(\\right) [,...]",
                D = "Reverse Cycle (), \\left(\\right) [, ...]",
                e = "Toggle star of environment",
                f = "Toggle a/b vs \\frac{a}{b}",
              },
              ["[/"] = "Previous start of a LaTeX comment",
              ["[*"] = "Previous end of a LaTeX comment",
              ["[["] = "Previous beginning of a section",
              ["[]"] = "Previous end of a section",
              ["[m"] = "Previous \\begin",
              ["[M"] = "Previous \\end",
              ["[n"] = "Previous start of a math zone",
              ["[N"] = "Previous end of a math zone",
              ["[r"] = "Previous \\begin{frame}",
              ["[R"] = "Previous \\end{frame}",
              ["]/"] = "Next start of a LaTeX comment %",
              ["]*"] = "Next end of a LaTeX comment %",
              ["]["] = "Next beginning of a section",
              ["]]"] = "Next end of a section",
              ["]m"] = "Next \\begin",
              ["]M"] = "Next \\end",
              ["]n"] = "Next start of a math zone",
              ["]N"] = "Next end of a math zone",
              ["]r"] = "Next \\begin{frame}",
              ["]R"] = "Next \\end{frame}",
              ["cs"] = {
                c = "Change surrounding command",
                e = "Change surrounding environment",
                ["$"] = "Change surrounding math zone",
                d = "Change surrounding delimiter",
              },
              ["ds"] = {
                c = "Delete surrounding command",
                e = "Delete surrounding environment",
                ["$"] = "Delete surrounding math zone",
                d = "Delete surrounding delimiter",
              },
            }
            wk.register(mappings, opts)
            -- VimTeX Text Objects without variants with targets.vim
            opts = {
              mode = "o", -- Operator pending mode
              buffer = event.buf,
            }
            local objects = {
              ["ic"] = [[LaTeX Command]],
              ["ac"] = [[LaTeX Command]],
              ["id"] = [[LaTeX Math Delimiter]],
              ["ad"] = [[LaTeX Math Delimiter]],
              ["ie"] = [[LaTeX Environment]],
              ["ae"] = [[LaTeX Environment]],
              ["i$"] = [[LaTeX Math Zone]],
              ["a$"] = [[LaTeX Math Zone]],
              ["iP"] = [[LaTeX Section, Paragraph, ...]],
              ["aP"] = [[LaTeX Section, Paragraph, ...]],
              ["im"] = [[LaTeX Item]],
              ["am"] = [[LaTeX Item]],
            }
            wk.register(objects, opts)
          end,
        })
      end,
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
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        --follow_current_file = true,
        filtered_items = {
          hide_dotfiles = false,
        },
      },
    },

    telescope = {
      defaults = {
        file_ignore_patterns = {
          ".git",
          ".hg",
          ".svn",
          "*.aux",
          "*.out",
          "*.toc",
          "*.o",
          "*.obj",
          "*.exe",
          "*.dll",
          "*.manifest",
          "*.rbc",
          "*.class",
          "*.ai",
          "*.bmp",
          "*.gif",
          "*.ico",
          "*.jpg",
          "*.jpeg",
          "*.png",
          "*.psd",
          "*.webp",
          "*.avi",
          "*.divx",
          "*.mp4",
          "*.webm",
          "*.mov",
          "*.m2ts",
          "*.mkv",
          "*.vob",
          "*.mpg",
          "*.mpeg",
          "*.mp3",
          "*.oga",
          "*.ogg",
          "*.wav",
          "*.flac",
          "*.eot",
          "*.otf",
          "*.ttf",
          "*.woff",
          "*.doc",
          "*.pdf",
          "*.cbr",
          "*.cbz",
          "*.zip",
          "*.tar.gz",
          "*.tar.bz2",
          "*.rar",
          "*.tar.xz",
          "*.kgb",
          "*.swp",
          ".lock",
          ".DS_Store",
          "._*",
          "*/tmp/*",
          "*/obj/*",
          "*/bin/*",
          "*.so",
          "*.swp",
          "*.zip",
          "**/node_modules/**",
          "**/target/**",
          "**.terraform/**",
        },
      },
    },
  },
}
