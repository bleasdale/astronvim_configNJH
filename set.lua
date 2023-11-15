-- Nicholas's set.lua
-- In ~/.config/nvim/lua
-- Called from ~/.config/nvim/init.lua
-- Dec 2022

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

-- Set Python executable locations
vim.g.python3_host_prog = "C:/Python311/python"
vim.g.python_host_prog = "C:/Python27/python"

-- Set Options
vim.opt.timeoutlen = 500
vim.opt.history = 2000
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.tabstop = indent
vim.opt.softtabstop = indent
vim.opt.shiftwidth = indent
vim.opt.title = true
vim.opt.errorbells = false
vim.opt.belloff = "all"
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.smartcase = true
vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.list = false
vim.opt.magic = true -- grep-like regexp (recall :perldo for pcre)
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.joinspaces = false -- no double spaces with J join
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildignore:append({
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
})
-- ignore LaTeX aux files
vim.opt.wildignore:append({
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
})
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.spelllang = { "en_gb" }
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.foldenable = true
vim.opt.foldmethod = "marker"
vim.opt.hidden = true
vim.opt.ruler = true
--vim.opt.pumheight = 10            -- popup menu height
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 4
vim.opt.showtabline = 2
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.colorcolumn = "81"
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "preview" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
