----------------------------
-- plugins stuff
----------------------------

-- unmap old mappings to space
vim.keymap.set("n", "<SPACE>", "<Nop>", { noremap = true })

vim.keymap.set("i", "<C-u>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<C-i>", "<Nop>", { noremap = true })

-- default is left leaning slash
-- use space as a the leader key
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

-- configure Vim to use brighter colors
vim.o.background = 'dark'

--- theme stuff
local true_color_supported = (vim.env.COLORTERM == "truecolor") or (vim.env.COLORTERM == "24bit")
if true_color_supported then
    vim.opt.termguicolors = true
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Color schemes
    {
        "Iron-E/nvim-highlite",
        version = '^3.0.0',
        lazy = false,
        priority = 1000,
        cond = not true_color_supported,
        config = function()
            vim.cmd([[colorscheme highlite]])
        end,
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        branch = "cterm-compat",
        lazy = false,
        priority = 995,
        enabled = false,
        cond = not true_color_supported,
        config = function()
            require('moonfly').setup({})
            vim.cmd([[colorscheme moonfly]])
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 990,
        enabled = true,
        cond = true_color_supported,
        config = function()
            require('nightfox').setup({})
            vim.cmd([[colorscheme nightfox]])
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 985,
        enabled = false,
        cond = true_color_supported,
        config = function()
            require('catppuccin').setup({})
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 980,
        enabled = false,
        cond = true_color_supported,
        config = function()
            require('gruvbox').setup({
                underline = false,
                bold = false,
                italic = {
                    strings = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
            })
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 975,
        enabled = false,
        cond = true_color_supported,
        config = function()
            require('rose-pine').setup({
                disable_italics = true,
            })
            vim.cmd([[colorscheme rose-pine]])
        end,
    },
    -- Appearance
    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { 'nvim-lualine/lualine.nvim' },

    -- ui
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    -- Git related plugins
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim" },

    -- Add indentation guides even on blank lines
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim" },
    -- highlight trailing space in red
    { "echasnovski/mini.trailspace" },

    -- examine keyboard bindings currently available
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 1000
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },

    -- Autocompletion
    -- main autocompletion engine, provides the hover window, not sources for completion
    { "hrsh7th/nvim-cmp" },
    -- snippet engine for loading snippets and expanding e.g. fn to full function template
    { "L3MON4D3/LuaSnip" },
    -- interface between LuaSnip & nvim-cmp, adds snippets to autocompletion menus
    { "saadparwaiz1/cmp_luasnip" },
    -- snippets database (from vscode)
    { "rafamadriz/friendly-snippets" },

    -- buffer autocompletion source
    { "hrsh7th/cmp-buffer" },
    -- file paths autocompletion source
    { "hrsh7th/cmp-path" },
    -- commands autocompletion source
    { "hrsh7th/cmp-cmdline" },
    -- LSP autocompletion source for nvim-cmp
    { "hrsh7th/cmp-nvim-lsp" },
    -- lua neovim api autocompletion sources
    { "hrsh7th/cmp-nvim-lua" },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end
    },

    -- LSP
    { "neovim/nvim-lspconfig" },
    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/neodev.nvim" },
    -- Useful status updates for LSP
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {},
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    { 'AndreM222/copilot-lualine' },


    -- for status bar to show current code context
    {
        "SmiteshP/nvim-navic",
        dependencies = { "neovim/nvim-lspconfig" }
    },
    -- plugin for auto inserting closing bracket
    { "windwp/nvim-autopairs" },
})

---=================================================================================
---key combos
---==============================================================================

--[[
leader first char summary

a
b
c - copy file path
d - diagnostics
e - go to end
f - telescope
g - gitsigns
h
i
j - go to normal mode
k
l - lsp
m
n - search word under cursor
o - new line
p - pasting
q
r
s - shortcut for / grep in current file
t - treesitter
u
v
w - wordwrap
x
y
z - never gonna use this shortcut but good to have documented

A
B
C
D - delete buffer inside telescope (non leader)
E
F
G
H
I
J
K - hover (non leader)
L
M
N - search word under cursor
O - new line
P
Q
R
S
T
U
V
W
X
Y
Z
]]
---==============================================================================

-- go to end of line
vim.keymap.set({ "n", "v" }, "<leader>e", "$", { noremap = true })

-- go to normal mode from insert mode
vim.keymap.set({ "i" }, "jj", "<Esc>", { noremap = true })

-- go to normal mode from visual mode
vim.keymap.set({ "v" }, "<leader>jj", "<Esc>", { noremap = true })

-- insert line without going to insert mode
vim.keymap.set("n", "<leader>O", "O<Esc>", { noremap = true })
vim.keymap.set("n", "<leader>o", "o<Esc>", { noremap = true })

-- paragraph movement
-- noremap ^ }
-- noremap å {
-- nnoremap ~ ]
-- nnoremap Å [

vim.keymap.set("n", "ø", "}", { noremap = true })
vim.keymap.set("n", "Ø", "{", { noremap = true })

-- for norwegian keyboards
-- map dead_diaeresis (^¨~) to asciicircum (^)
-- map dead_circumflex and dead_asciitilde to asciitilde (~)
-- https://askubuntu.com/questions/254424/how-can-i-change-what-keys-on-my-keyboard-do-how-can-i-create-custom-keyboard?noredirect=1&lq=1
-- xmodmap -e "keycode 35 = asciicircum"
-- xmodmap -e "keycode 35 shift = asciicircum asciitilde"

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":NvimTreeFindFile<CR>:NvimTreeFocus<CR>", { noremap = true })

-- move selected blockes of code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- less disorienting when moving page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- I never use q intentionally, only hit it by mistake
vim.keymap.set("n", "q", "<nop>", { noremap = true })
vim.keymap.set("n", "s", "<Nop>", { noremap = true })
vim.keymap.set("n", "S", "<Nop>", { noremap = true })

-- set :wrap and set :nowrap
vim.keymap.set("n", "<leader>ww", ":set wrap<CR>", { noremap = true })
vim.keymap.set("n", "<leader>wnw", ":set nowrap<CR>", { noremap = true })
vim.keymap.set("n", "<leader>w2", ":set shiftwidth=2<CR>", { noremap = true })
vim.keymap.set("n", "<leader>w4", ":set shiftwidth=4<CR>", { noremap = true })

-- copy full path of currently opened buffer
vim.keymap.set("n", "<leader>cfp", ":let @+ = expand(\"%:p\")<cr>", { noremap = true })
-- copy relative path of currently opened buffer
vim.keymap.set("n", "<leader>crp", ":let @+ = expand(\"%\")<cr>", { noremap = true })
-- alternative use nvim-tree and when cursor is over file press y or Y

-- delete without yanking
vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n" }, "D", '"_D', { noremap = true })
vim.keymap.set({ "n" }, "x", '"_x', { noremap = true })
vim.keymap.set({ "n" }, "c", '"_c', { noremap = true })

-- find next word under cursor
vim.keymap.set({ "n" }, "<leader>n", 'g*', { noremap = true })
vim.keymap.set({ "n" }, "<leader>N", 'g#', { noremap = true })

vim.keymap.set({ "n" }, "<leader>s", '/', { noremap = true })

-- allow deleting in quickfix list
-- using range-aware function
function QFdelete()
    local bufnr = vim.api.nvim_get_current_buf()
    -- get current qflist
    local qfl = vim.fn.getqflist()
    local linenumber = vim.fn.line(".");
    if vim.fn.visualmode() == "V" then
        local firstline = vim.fn.getpos("'<'")[2]
        local lastline = vim.fn.getpos("'>'")[2]
        for i = firstline, lastline do
            table.remove(qfl, i)
        end
    else
        table.remove(qfl, linenumber)
    end
    -- replace items in the current list, do not make a new copy of it;
    -- this also preserves the list title
    vim.fn.setqflist(qfl, 'r')
    -- restore cursor to current line
    vim.fn.setpos('.', { bufnr, linenumber, 1, 0 })
end

local qflist_autocmd_group_id = vim.api.nvim_create_augroup("QFList", { clear = true });
vim.api.nvim_create_autocmd(
    { "BufWinEnter" },
    {
        group = qflist_autocmd_group_id,
        desc = "Quickfix list remove entry",
        pattern = "quickfix",
        callback = function(ev)
            if vim.api.nvim_buf_get_option(ev.buf, 'buftype') == 'quickfix' then
                vim.keymap.set({ "n" }, "dd", QFdelete, { noremap = true, buffer = true, desc = "delete qflist entry" })
                vim.keymap.set({ "v" }, "d", ":<c-u>lua =QFdelete()<cr>",
                    { noremap = true, buffer = true, desc = "delete qflist range" })
            end
        end
    }
)

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
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- trailing space marked using underscore
vim.o.list = true
vim.opt.listchars = { tab = '!-', trail = '·', precedes = '<', extends = '>' }

-- Highlight cursor line underneath the cursor horizontally.
-- vim.wo.cursorline = true

-- Highlight cursor line underneath the cursor vertically.
-- vim.wo.cursorcolumn = true

-- Set shift width to 4 spaces.
vim.opt.shiftwidth = 4

-- Set tab width to 4 columns.
vim.opt.tabstop = 4

vim.o.smartindent = false

-- Use space characters instead of tabs.
vim.o.expandtab = true

-- Do not save backup files.
vim.o.backup = false

-- Do not let cursor scroll below or above N number of lines when scrolling.
vim.o.scrolloff = 10

-- new window should come below or to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Do not wrap lines. Allow long lines to extend as far as the line goes.
vim.wo.wrap = false

-- Do not wrap in middle of word when turn on wrapping turned on temporarily
vim.o.linebreak = true

-- Show partial command you type in the last line of the screen.
vim.o.showcmd = true

-- Show the mode you are on the last line.
vim.o.showmode = true

-- Show matching words during a search.
vim.o.showmatch = true

-- Set the commands to save in history default number is 20.
vim.opt.history = 1000

-- Show file stats
vim.o.ruler = true

-- Blink cursor on error instead of beeping (grr)
vim.o.visualbell = true

-- enable mouse support (might not work well on Mac OS X)
vim.o.mouse = 'a'

-- Instead of failing a command because of unsaved changes, instead raise a
-- dialogue asking if you wish to save changed files.
vim.opt.confirm = true

-- Enable auto completion menu after pressing TAB.
vim.o.wildmenu = true

-- Make wildmenu behave like similar to Bash completion.
vim.o.wildmode = 'list:longest'

-- There are certain files that we would never want to edit with Vim.
-- Wildmenu will ignore files with these extensions.
vim.o.wildignore = '*.o,*.obj,*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

-- treat .def files as python code
vim.api.nvim_command('autocmd BufRead,BufNewFile *.def set filetype=python')

----------------------------
-- plugins stuff (part 2)
----------------------------

local navic = require("nvim-navic")
navic.setup()

require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            "filename",
            {
                function()
                    return navic.get_location()
                end,
                cond = function()
                    return navic.is_available()
                end
            },
        },
        lualine_x = {
            {'copilot', show_colors = true },
            'encoding', 'fileformat', 'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    }
})

-- Enable Comment.nvim
require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<leader>gnh', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '<leader>gph', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({ 'n', 'v' }, '<leader>gsh', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>grh', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>gsb', gs.stage_buffer)
        map('n', '<leader>guh', gs.undo_stage_hunk)
        map('n', '<leader>grb', gs.reset_buffer)
        map('n', '<leader>gP', gs.preview_hunk)
        map('n', '<leader>gbl', function() gs.blame_line { full = true } end)
        map('n', '<leader>gtb', gs.toggle_current_line_blame)
        map('n', '<leader>gd', gs.diffthis)
        map('n', '<leader>gD', function() gs.diffthis('~') end)
        map('n', '<leader>gtd', gs.toggle_deleted)
    end
}

require('mini.trailspace').setup()

-- disable netrw at the very start of your init.lua (strongly advised by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- common shortcuts when nvim-tree active:
-- <CR> open
-- y/Y yank name
-- r rename
-- d delete
-- c copy
-- p paste
-- x cut
-- a create
-- q quit same as <leader>tt

require("nvim-tree").setup({
    diagnostics = {
        enable = true,
    },
    renderer = {
        icons = {
            webdev_colors = true,
            symlink_arrow = " ➛ ",
            show = {
                file = false,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
            },
            glyphs = {
                default = "▬",
                symlink = "⇛",
                bookmark = "★",
                modified = "●",
                folder = {
                    arrow_closed = ">",
                    arrow_open = "v",
                    default = "▤",
                    open = "▤",
                    empty = "⊙",
                    empty_open = "᭵",
                    symlink = "⇛",
                    symlink_open = "⇛",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "▱",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "✘",
                    ignored = "◌",
                },
            },
        },
    },
    view = {
        width = 40,
    },
    filters = {
        git_ignored = false,
    },
})

-- auto startup nvim-tree if opened a directory
local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- telescope

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        layout_strategy = 'flex',
        layout_config = {
            horizontal = {
                width = 0.8,
                height = 0.9,
                mirror = false,
                prompt_position = "bottom",
                -- number of cols below which to not show preview
                preview_cutoff = 120,
                preview_width = 0.5
            },
            vertical = {
                width = 0.8,
                height = 0.9,
                mirror = false,
                prompt_position = "bottom",
                -- number of lines below which to not show preview
                preview_cutoff = 20,
                preview_height = 0.4
            },
            flex = {
                -- number of columns required to switch to horizontal layout
                flip_columns = 180,
            }
        },
        mappings = {
            n = {
                ["<C-h>"] = "which_key",
                ["<leader>jj"] = actions.close,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<leader>tp"] = require("telescope.actions.layout").toggle_preview,
                ["<leader>q"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
            i = {
                ["<C-h>"] = "which_key",
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            }
        },
    },
    pickers = {
        buffers = {
            mappings = {
                n = {
                    ["D"] = require("telescope.actions").delete_buffer,
                }
            }
        }
    }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- partially applied function
local wrap = function(func, ...)
    local args = { ... }
    return function()
        func(unpack(args))
    end
end

local live_grep_with_args = function(opts)
    local conf = require("telescope.config").values
    local finders = require "telescope.finders"
    local make_entry = require "telescope.make_entry"
    local pickers = require "telescope.pickers"
    local flatten = vim.tbl_flatten
    opts = opts or {}
    opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
    opts.shortcuts = opts.shortcut or {
        ["l"] = "*.lua",
        ["v"] = "*.vim",
        ["n"] = "*.{vim,lua}",
        ["c"] = "*.c",
    }
    opts.pattern = opts.pattern or "%s"

    local custom_grep = finders.new_async_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local prompt_split = vim.split(prompt, "  ", { trimempty = true })

            local args = { "rg" }
            if prompt_split[1] then
                table.insert(args, "-e")
                table.insert(args, prompt_split[1])
                table.remove(prompt_split, 1)
            end
            ---@diagnostic disable-next-line: unused-local
            for i, arg in ipairs(prompt_split) do
                table.insert(args, "--iglob")

                local pattern
                if opts.shortcuts[arg] then
                    pattern = opts.shortcuts[arg]
                else
                    pattern = arg
                end

                table.insert(args, string.format(opts.pattern, pattern))
            end

            return flatten {
                args,
                { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            }
        end,
        entry_maker = make_entry.gen_from_vimgrep(opts),
        cwd = opts.cwd,
    }

    -- Example of using this grep
    -- embeddeddapp  functional/helmet/**  !*.cpp
    pickers.new(opts, {
        debounce = 100,
        prompt_title = "Live Grep (with shortcuts)",
        finder = custom_grep,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
    }):find()
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set(
    'n', '<leader>fa', wrap(builtin.find_files, {
        hidden = true, no_ignore = true, no_ignore_parent = true
    }),
    { desc = '[F]ind [A]ll [F]iles including hidden .dot' }
)
vim.keymap.set('n', '<leader>fF', builtin.git_files, { desc = '[F]ind [G]it [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fG', live_grep_with_args, { desc = '[S]earch by [G]rep with glob args' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume last telescope session' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = '[F]ind Git [S]tatus' })
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = '[F]ind [T]reesitter' })
vim.keymap.set('n', '<leader>fb', builtin.builtin, { desc = '[F]ind [B]uiltins' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = '[F]ind [C]ommands' })

vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })

-- treesitter

require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "cmake",
        "make",
        "nix",
        "markdown",
        "bash",
        "dockerfile",
        "json",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
        "python",
        "rust",
        "svelte",
        "java",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    indent = { enable = true },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        ---@diagnostic disable-next-line: unused-local
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
}

-- diagnostics

vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { noremap = true })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, { noremap = true })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { noremap = true })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { noremap = true })

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- copied from lsp-zero
luasnip.config.set_config({
    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave'
})
luasnip.config.setup {}
require('luasnip.loaders.from_vscode').lazy_load()

-- just some local variables for convinience
local select_opts = { behavior = cmp.SelectBehavior.Select }
local merge = function(a, b)
    return vim.tbl_deep_extend('force', {}, a, b)
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    preselect = cmp.PreselectMode.None,
    completion = {
        completeopt = 'menu,menuone,noinsert,noselect'
    },
    -- window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered(),
    -- },
    window = {
        documentation = merge(
            cmp.config.window.bordered(),
            {
                max_height = 15,
                max_width = 60,
            }
        )
    },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
            local short_name = {
                nvim_lsp = 'LSP',
                nvim_lua = 'nvim'
            }

            local menu_name = short_name[entry.source.name] or entry.source.name

            item.menu = string.format('[%s]', menu_name)
            return item
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- navigate items on the list
        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),
        -- scroll up and down in the completion documentation
        -- ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
        ['<C-d>'] = cmp.mapping.scroll_docs(5),
        -- toggle completion
        -- bring up the completion menu, kind of similar to as hover (K) and <C-h>
        ---@diagnostic disable-next-line: unused-local
        ['<C-Space>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end),
        -- Accept currently selected item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace, -- or Insert
            select = false,
        },
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil,
        -- -- go to next placeholder in the snippet
        -- ['<C-f>'] = cmp.mapping(function(fallback)
        --     if luasnip.jumpable(1) then
        --         luasnip.jump(1)
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'}),
        --
        -- -- go to previous placeholder in the snippet
        -- ['<C-b>'] = cmp.mapping(function(fallback)
        --     if luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, {'i', 's'}),
    }),
    sources = cmp.config.sources({
        { name = "copilot", group_index = 1 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'luasnip', group_index = 3, option = { show_autosnippets = false } }, -- For luasnip users.
        { name = 'nvim_lua', group_index = 3 },
        { name = 'buffer',  group_index = 3, option = { keyword_length = 3 } },
        { name = 'path', group_index = 4 },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
    -- {{ name = 'path' }},
        { { name = 'cmdline' } }
    )
})

-- use menu rather than floating window
vim.opt.completeopt:append('menu')
-- show menu even for one item
vim.opt.completeopt:append('menuone')
-- dont change the inserted text as we move through the options
vim.opt.completeopt:append('noinsert')
-- dont select the first item when window first opens
vim.opt.completeopt:append('noselect')

-- auto insert closing bracket
require("nvim-autopairs").setup {
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.set_log_level("WARN")

local lspconfig = require('lspconfig')

local my_on_attach = function(client, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)

    vim.keymap.set("n", '<leader>zzltd', vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>zzlws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>zzlr", vim.lsp.buf.references, opts)
    nmap('<leader>zzlwa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>zzlwr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>zzlwl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    vim.keymap.set("n", "<leader>flr", require('telescope.builtin').lsp_references, opts)
    vim.keymap.set("n", "<leader>fld", require('telescope.builtin').lsp_definitions, opts)
    vim.keymap.set("n", "<leader>flD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>fli", require('telescope.builtin').lsp_implementations, opts)
    vim.keymap.set("n", "<leader>fltd", require('telescope.builtin').lsp_type_definitions, opts)
    vim.keymap.set("n", "<leader>fls", require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>flws", require('telescope.builtin').lsp_workspace_symbols, opts)

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        if vim.lsp.buf.format then
            vim.lsp.buf.format()
        elseif vim.lsp.buf.formatting then
            vim.lsp.buf.formatting()
        end
    end, { desc = 'Format current buffer with LSP' })

    -- disable semantic tokens, which is essentially same as treesitter
    client.server_capabilities.semanticTokensProvider = nil

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

lspconfig['clangd'].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig['lua_ls'].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

lspconfig["cmake"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["nil_ls"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["ts_ls"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["html"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["jsonls"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["eslint"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["cssls"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["lemminx"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["pyright"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["rust_analyzer"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
            }
        }
    }
}

lspconfig["svelte"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["tailwindcss"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["prismals"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}

lspconfig["jdtls"].setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
}
