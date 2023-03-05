----------------------------
-- plugins stuff
----------------------------

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    -- Only required if you have packer configured as `opt`
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Appearance
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use "EdenEast/nightfox.nvim"
    use { "ellisonleao/gruvbox.nvim" }
    use 'Iron-E/nvim-highlite'
    use { 'bluz71/vim-moonfly-colors', branch = 'cterm-compat' }
    use { "catppuccin/nvim", as = "catppuccin" }

    use { 'nvim-tree/nvim-tree.lua', tag = 'nightly' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    -- Git related plugins
    use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'echasnovski/mini.trailspace' -- highlight trailing space in red

    -- Autocompletion
    -- main autocompletion engine, provides the hover window, not sources for completion
    use { 'hrsh7th/nvim-cmp' }
    -- snippet engine for loading snippets and expanding e.g. fn to full function template
    use { 'L3MON4D3/LuaSnip' }
    -- interface between LuaSnip & nvim-cmp, adds snippets to autocompletion menus
    use { 'saadparwaiz1/cmp_luasnip' }
    -- snippets database (from vscode)
    use {'rafamadriz/friendly-snippets'}
    -- buffer autocompletion source
    use {'hrsh7th/cmp-buffer'}
    -- file paths autocompletion source
    use {'hrsh7th/cmp-path'}
    -- commands autocompletion source
    use {'hrsh7th/cmp-cmdline'}

    -- for status bar to show current code context
    use "SmiteshP/nvim-navic"

    if is_bootstrap then
        require('packer').sync()
    end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

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
-- unmap old mappings to space
vim.api.nvim_set_keymap("n", "<SPACE>", "<Nop>", { noremap = true })

-- default is left leaning slash
-- use space as a the leader key
vim.g.mapleader = ' '

-- go to end of line
-- noremap <leader>e $
vim.keymap.set(
    { "n", "v" },
    "<leader>e",
    "$",
    { noremap = true }
)

-- go to normal mode from insert mode
vim.keymap.set(
    { "i" },
    "jj",
    "<Esc>",
    { noremap = true }
)

-- go to normal mode from visual mode
vim.keymap.set(
    { "v" },
    "<leader>jj",
    "<Esc>",
    { noremap = true }
)

-- insert line without going to insert mode
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

vim.keymap.set("n", "ø", "}", { noremap = true })
vim.keymap.set("n", "Ø", "{", { noremap = true })

-- for norwegian keyboards
-- map dead_diaeresis (^¨~) to asciicircum (^)
-- map dead_circumflex and dead_asciitilde to asciitilde (~)
-- https://askubuntu.com/questions/254424/how-can-i-change-what-keys-on-my-keyboard-do-how-can-i-create-custom-keyboard?noredirect=1&lq=1
-- xmodmap -e "keycode 35 = asciicircum"
-- xmodmap -e "keycode 35 shift = asciicircum asciitilde"

vim.api.nvim_set_keymap(
    "n",
    "<leader>tt",
    ":NvimTreeToggle<CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>tf",
    ":NvimTreeFocus<CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>to",
    ":NvimTreeFindFile<CR>",
    { noremap = true }
)

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

-- copy full path of currently opened buffer
vim.keymap.set("n", "<leader>cfp", ":let @+ = expand(\"%:p\")<cr>", { noremap = true })
-- copy relative path of currently opened buffer
vim.keymap.set("n", "<leader>crp", ":let @+ = expand(\"%\")<cr>", { noremap = true })
-- alternative use nvim-tree and when cursor is over file press y or Y

-- delete without yanking
vim.keymap.set(
    { "n", "v" },
    "d",
    '"_d',
    { noremap = true }
)

vim.keymap.set(
    { "n" },
    "D",
    '"_D',
    { noremap = true }
)

vim.keymap.set(
    { "n" },
    "<leader>n",
    'g*',
    { noremap = true }
)

vim.keymap.set(
    { "n" },
    "<leader>N",
    'g#',
    { noremap = true }
)

vim.keymap.set(
    { "n" },
    "<leader>s",
    '/',
    { noremap = true }
)

-- auto insert closing bracket
vim.keymap.set({ "i" }, "{", '{<CR>}<Esc>O', { noremap = true })
vim.keymap.set({ "i" }, "(", '()<Esc>ha', { noremap = true })
vim.keymap.set({ "i" }, "[", '[]<Esc>ha', { noremap = true })
vim.keymap.set({ "i" }, '"', '""<Esc>ha', { noremap = true })
vim.keymap.set({ "i" }, "'", "''<Esc>ha", { noremap = true })
vim.keymap.set({ "i" }, "<", "<><Esc>ha", { noremap = true })

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

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- configure Vim to use brighter colors
vim.o.background = 'dark'

--- theme stuff
local true_color_supported = (vim.env.COLORTERM == "truecolor") or (vim.env.COLORTERM == "24bit")
if true_color_supported then
    vim.opt.termguicolors = true
end

----------------------------
-- plugins stuff (part 2)
----------------------------

if true_color_supported then
    -- vim.cmd("colorscheme catppuccin")
    -- vim.cmd("colorscheme gruvbox")
    vim.cmd("colorscheme nightfox")
else
    vim.cmd("colorscheme highlite")
    -- vim.cmd("colorscheme moonfly")
end


local navic = require("nvim-navic")
navic.setup()

require('lualine').setup({
    options = {
        icons_enabled = false,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_c = {
            "filename", { navic.get_location, cond = navic.is_available },
        }
    }
})

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
    char = '┊',
    show_trailing_blankline_indent = false,
}

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

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["<C-h>"] = "which_key",
                ["<leader>jj"] = require('telescope.actions').close,
                ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
                ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
                ["<leader>zztp"] = require("telescope.actions.layout").toggle_preview,
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
                    ["D"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
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

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fa', wrap(builtin.find_files, { hidden = true }),
    { desc = '[F]ind [A]ll [F]iles including hidden .dot' })
vim.keymap.set('n', '<leader>fF', builtin.git_files, { desc = '[F]ind [G]it [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
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
        "bash",
        "javascript",
        "typescript",
        "python",
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
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local select_opts = {behavior = cmp.SelectBehavior.Select}
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
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = 'menu,menuone,noinsert'
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
        fields = {'abbr', 'menu', 'kind'},
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

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

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
        { name = 'luasnip', option = { show_autosnippets = false } }, -- For luasnip users.
        { name = 'path' },
        { name = 'buffer', option = { keyword_length = 3 }},
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
        {{ name = 'cmdline' }}
    )
})

-- use menu rather than floating window
vim.opt.completeopt:append('menu')
-- show menu even for one item
vim.opt.completeopt:append('menuone')
-- dont select the first item when window first opens
vim.opt.completeopt:append('noselect')
