-- Nicholas's options.lua for AstroNvim
-- In ~/.config/nvim/lua/user
-- Nov. 2023

-- MS Windows, Terminal -use PowerShell
-- local powershell_options = {
--   shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
--   shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
--   shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
--   shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
--   shellquote = "",
--   shellxquote = "",
-- }
--
-- for option, value in pairs(powershell_options) do
--   vim.opt[option] = value
-- end

-- variables
local indent = 2
local wildignore = ""

return {
  g = {
    mapleader = " ",
    maplocalleader = " ",
    cmp_enabled = true,
    -- Set Python executable locations
    python3_host_prog = "C:/Python311/python",
    python_host_prog = "C:/Python27/python",
  },

  opt = {
    -- Set Options
    guifont = "CASKAYDIA_COVE_NERD_FONT:h14",
    guicursor = "n-v-c-sm:block-blinkon0,i-ci-ve:ver25-Cursor-blinkon500-blinkoff250,r-cr-o:hor20",
    timeoutlen = 500,
    history = 2000,
    swapfile = false,
    backup = false,
    undofile = true,
    undodir = vim.fn.stdpath("config") .. "/undo",
    backspace = { "indent", "eol", "start" },
    tabstop = indent,
    softtabstop = indent,
    shiftwidth = indent,
    title = true,
    errorbells = false,
    belloff = "all",
    laststatus = 2,
    expandtab = true,
    autoindent = true,
    smartindent = true,
    cindent = true,
    smartcase = true,
    linebreak = true,
    wrap = true,
    list = false,
    magic = true, -- grep-like regexp (recall :perldo for pcre)
    showmatch = true,
    matchtime = 3,
    joinspaces = false, -- no double spaces with J join
    wildmenu = true,
    wildmode = "full",
    wildignore:append({
      "*.swp",
      "*.bak",
      "*.log",
      "*.tmp",
      "*.jpg",
      "*.gif",
      "*.png",
      "*.ico",
      "*.a",
      "*.o",
      "*.so",
      "*.docx",
      "*.img",
      "*.xlsx",
      "*.exe",
      "*.flv",
    }),
    -- ignore LaTeX aux files
    wildignore:append({
      "*.aux",
      "*.lof",
      "*.lot",
      "*.fls",
      "*.out",
      "*.toc",
      "*.fmt",
      "*.fot",
      "*.cb",
      "*.cb2",
      ".*.lb",
      "__latex*",
      "*.fdb_latexmk",
      "*.synctex",
      "*.synctex(busy)",
      "*.synctex.gz",
      "*.synctex.gz(busy)",
      "*.pdfsync",
      "*.bbl",
      "*.bcf",
      "*.blg",
      "*.run.xml",
      "indent.log",
      "*.pdf",
    }),
    mouse = "a",
    hlsearch = true,
    incsearch = true,
    inccommand = "split",
    spelllang = { "en_gb" },
    encoding = "utf-8",
    fileencoding = "utf-8",
    foldenable = true,
    foldmethod = "marker",
    hidden = true,
    ruler = true,
    --pumheight = 10,            -- popup menu height
    signcolumn = "yes:1",
    scrolloff = 4,
    showtabline = 2,
    termguicolors = true,
    splitbelow = true,
    splitright = true,
    relativenumber = true,
    number = true,
    colorcolumn = "81",
    completeopt = { "menuone", "noselect", "noinsert", "preview" },
    --shortmess = shortmess + { c = true },
  },
}
