---=================================================================================
---key combos
---==============================================================================

-- unmap old mappings to space
vim.api.nvim_set_keymap(
  "n",
  "<SPACE>",
  "<Nop>",
  { noremap = true }
)

-- default is left leaning slash
-- use space as a the leader key
vim.g.mapleader = ' '

-- go to end of line
-- noremap <leader>e $
vim.api.nvim_set_keymap(
  "",
  "<leader>e",
  "$",
  { noremap = true }
)

-- go to normal mode from insert mode
-- inoremap jj <Esc> 
vim.api.nvim_set_keymap(
  "i",
  "jj",
  "<Esc>",
  { noremap = true }
)

-- insert line without going to insert mode
-- nnoremap K O<Esc>
-- nnoremap <leader>O O<Esc>
-- nnoremap <leader>o o<Esc>
vim.api.nvim_set_keymap(
  "n",
  "<leader>O",
  "O<Esc>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  "o<Esc>",
  { noremap = true }
)

-- paragraph movement
-- noremap ^ }
-- noremap å {
-- nnoremap ~ ]
-- nnoremap Å [

-- for norwegian keyboards
-- map dead_diaeresis (^¨~) to asciicircum (^)
-- map dead_circumflex and dead_asciitilde to asciitilde (~) 
-- https://askubuntu.com/questions/254424/how-can-i-change-what-keys-on-my-keyboard-do-how-can-i-create-custom-keyboard?noredirect=1&lq=1
-- xmodmap -e "keycode 35 = asciicircum"
-- xmodmap -e "keycode 35 shift = asciicircum asciitilde"

---=================================================================================
---general
---=================================================================================

-- show line numbers
vim.wo.number = true

-- disable swapfile
vim.o.swapfile = false

--  highlight all results
vim.o.hlsearch = true

-- ignore case in search
vim.o.ignorecase = true

-- Override the ignorecase option if searching for capital letters.
-- This will allow you to search specifically for capital letters.
vim.o.smartcase = true

-- show search results as you type
vim.o.incsearch = true

-- use y and p with the system clipboard
-- try setting to unnamedplus if unnamed doesnt work
vim.o.clipboard = 'unnamed'

-- Highlight cursor line underneath the cursor horizontally.
-- vim.wo.cursorline = true

-- Highlight cursor line underneath the cursor vertically.
-- vim.wo.cursorcolumn = true

-- Set shift width to 4 spaces.
vim.opt.shiftwidth = 4

-- Set tab width to 4 columns.
vim.opt.tabstop = 4

-- Use space characters instead of tabs.
-- vim.bo.expandtab = true

-- Do not save backup files.
vim.o.backup = false

-- Do not let cursor scroll below or above N number of lines when scrolling.
vim.o.scrolloff = 10

-- Do not wrap lines. Allow long lines to extend as far as the line goes.
vim.wo.wrap = false

-- Show partial command you type in the last line of the screen.
vim.o.showcmd = true

-- Show the mode you are on the last line.
vim.o.showmode = true

-- Show matching words during a search.
vim.o.showmatch = true

-- Set the commands to save in history default number is 20.
vim.opt.history=1000

-- Show file stats
vim.o.ruler=true

-- Blink cursor on error instead of beeping (grr)
vim.o.visualbell = true

-- enable mouse support (might not work well on Mac OS X)
vim.o.mouse='a'

-- Instead of failing a command because of unsaved changes, instead raise a
-- dialogue asking if you wish to save changed files.
vim.opt.confirm = true

-- Enable auto completion menu after pressing TAB.
vim.o.wildmenu = true

-- Make wildmenu behave like similar to Bash completion.
vim.o.wildmode='list:longest'

-- There are certain files that we would never want to edit with Vim.
-- Wildmenu will ignore files with these extensions.
vim.o.wildignore='*.o,*.obj,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

-- configure Vim to use brighter colors
vim.o.background = 'dark'
