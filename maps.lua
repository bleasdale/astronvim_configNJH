------------------
-- Key Mappings --
------------------

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- convenience variable
local km = vim.keymap

-- Swap ; and : for faster command mode
km.set("n", ";", ":", { desc = "Swap ; for :" })
km.set("n", ":", ";", { desc = "Swap ; for :" })

-- Terminal
-- km.set("t", "<C-[>", "<C-\\><C-n>", { silent = true, noremap = true, desc = "To Normal mode terminal." })
-- ToggleTerm
-- vim.cmd([[
-- autocmd TermEnter term://*toggleterm#*
--       \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
--
-- " By applying the mappings this way you can pass a count to your
-- " mapping to open a specific window.
-- " For example: 2<C-t> will open terminal 2
-- nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
-- ]])
--

-- open init.lua in a new buffer, vertical split
km.set("n", "<leader>ev", ":vsplit ~/.config/nvim/init.lua<CR>", { silent = true, desc = "Edit config shortcut." })

-- 'cd' to the dir in which the current buffer is, but only for the current window
km.set(
  "n",
  "<leader>cd",
  ":lcd %:h<CR>",
  { desc = "Change the cwd to the location of the current buffer, but only for the current buffer." }
)

-- resize window
km.set("n", "<leader><UP>", ":resize +5<CR>", { silent = true, desc = "Increase vertical window size." })
km.set("n", "<leader><DOWN>", ":resize -5<CR>", { silent = true, desc = "Decrease vertical window size." })
km.set("n", "<leader><RIGHT>", ":vertical resize +5<CR>", { silent = true, desc = "Increase window width." })
km.set("n", "<leader><LEFT>", ":vertical resize -5<CR>", { silent = true, desc = "Decrease window width." })

-- movement between windows
km.set("n", "<leader>h", ":wincmd h<CR>", { desc = "Move focus to window on the left." })
km.set("n", "<leader>j", ":wincmd j<CR>", { desc = "Move focus to window below" })
km.set("n", "<leader>l", ":wincmd l<CR>", { desc = "Move focus to window on the right." })
km.set("n", "<leader>k", ":wincmd k<CR>", { desc = "Move focus to window above." })

-- movement while in insert and command modes
km.set("i", "<C-h>", "<LEFT>", { desc = "Move left in insert mode." })
km.set("i", "<C-j>", "DOWN", { desc = "Move down in insert mode." })
km.set("i", "<C-l>", "RIGHT", { desc = "Move right in insert mode." })
km.set("i", "<C-k>", "UP", { desc = "Move up in insert mode." })
km.set("c", "<C-h>", "<LEFT>", { desc = "Move left in command mode." })
km.set("c", "<C-j>", "DOWN", { desc = "Move down in command mode." })
km.set("c", "<C-l>", "RIGHT", { desc = "Move right in command mode." })
km.set("c", "<C-k>", "UP", { desc = "Move up in command mode." })

-- buffers
km.set("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New buffer." })
km.set("n", "<leader>n", ":bn<CR>", { desc = "Show the next buffer." })
km.set("n", "<leader>p", ":bp<CR>", { desc = "Show the previous buffer." })

km.set(
  "n",
  "<leader>zbb",
  "<cmd>lua buf_kill(0, true)<CR>",
  { silent = true, desc = "Force delete the buffer but leave the window open." }
)

-- move lines around
km.set("n", "<c-j>", ":m .+1<CR>==", { silent = true, desc = "Bubble line down" })
km.set("n", "<c-k>", ":m .-2<CR>==", { silent = true, desc = "Bubble line up" })
km.set("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true, desc = "Bubble line down" })
km.set("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true, desc = "Bubble line up" })

-- clear search highlighting
km.set("n", "<leader><CR>", ":noh<CR><ESC>", { silent = true, desc = "Remove search highlighting" })

-- tabs
km.set("n", "<leader>tN", ":tabnew<CR>", { desc = "Open new tab." })
km.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab." })
km.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Move focus to next tab." })
km.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Move focus to previous tab." })
km.set("n", "<leader>1", "1gt", { desc = "Go to tab number 1." })
km.set("n", "<leader>2", "2gt", { desc = "Go to tab number 2." })
km.set("n", "<leader>3", "3gt", { desc = "Go to tab number 3." })
km.set("n", "<leader>4", "4gt", { desc = "Go to tab number 4." })
km.set("n", "<leader>5", "5gt", { desc = "Go to tab number 5." })
km.set("n", "<leader>6", "6gt", { desc = "Go to tab number 6." })
km.set("n", "<leader>7", "7gt", { desc = "Go to tab number 7." })
km.set("n", "<leader>8", "8gt", { desc = "Go to tab number 8." })
km.set("n", "<leader>9", "9gt", { desc = "Go to tab number 9." })

-- Make visual yanks place the cursor back where it started
km.set("v", "y", "ygv<ESC>", { desc = "Yank and put cursor back." })

-- call :LazyGit
km.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "Open a lazygit floating window in the current working directory." })

-- telescope related maps
-- See `:help telescope.builtin`
km.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
km.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
km.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer]" })

km.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
km.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
km.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
km.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
km.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Telescope file browser
km.set("n", "<leader>fb", function()
  require("telescope").extensions.file_browser.file_browser()
end, { desc = "Open Telescope file browser" })

-- Luasnip
vim.cmd([[
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" Cycle forward through choice nodes with Control-f (for example)
imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])

-- stylua-nvim mapping to format lua files
km.set(
  "n",
  "<leader>st",
  require("stylua-nvim").format_file,
  { noremap = true, silent = true, desc = "Format lua file with Stylua." }
)

-- Insert mode map to escape out of insert mode, type undo and reenter insert mode
km.set("i", "<C-U>", "<ESC>ui", { desc = "From insert mode, exit to normal, undo, reenter insert mode." })

-- window-picker
-- km.set("n", "<leader>g", function()
--   local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
--   vim.api.nvim_set_current_win(picked_window_id)
-- end, { desc = "Pick a window" })
