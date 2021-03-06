--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.wrap = true
vim.opt.relativenumber = true
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.conceallevel = 1
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding

lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "tokyonight"

require("luasnip.loaders.from_snipmate").lazy_load()

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jj"] = false
lvim.keys.insert_mode["jk"] = false
lvim.keys.insert_mode["kj"] = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["C"] = {
    "<cmd>DogeGenerate<cr>", "GenerateComment"
}

-- lvim.builtin.which_key.mappings["P"] = {
--     ":lua require'telescope'.extensions.project.project{}<CR>", "OpenProject"
-- }

lvim.builtin.which_key.mappings["R"] = {
    name = "+SnipRun",
    r = { "<cmd>SnipRun<cr>", "RunCode" },
    c = { "<cmd>SnipClose<cr>", "Clean" },
}


lvim.builtin.which_key.mappings["D"] = {
    name = "+Todo",
    q = { "<cmd>TodoQuickFix<cr>", "TodoQuickFix" },
    l = { "<cmd>TodoLocList<cr>", "TodoLocList" },
    t = { "<cmd>TodoTelescope<cr>", "TodoTelescope" },
}

lvim.builtin.which_key.mappings["t"] = {
    name = "+Diagnostics",
    t = { "<cmd>TroubleToggle<cr>", "trouble" },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["o"] = {
    "<cmd>SymbolsOutline<cr>", "SymbolsOutline"
}

lvim.builtin.which_key.mappings["Q"] = {
    "<cmd>wa<cr><cmd>qa<cr>", "SaveAndQuitAll"
}

lvim.builtin.which_key.mappings["r"] = {
    name = "+Replace",
    a = { "<cmd>lua require('spectre').open()<cr>", "replace in all file" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "replace in current file" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "replace current word" }
}


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.dap.active = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "cpp",
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "go",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    { --tokyonight??????
        "folke/tokyonight.nvim" },
    { --????????????
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { --Markdown??????
        "npxbr/glow.nvim",
        ft = { "markdown" }
    },
    { --???????????????????????????
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
            -- place this in one of your configuration file(s)
            vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
            vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
            vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
            vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
            -- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
            -- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
            -- vim.api.nvim_set_keymap('n', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
            -- vim.api.nvim_set_keymap('v', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
            -- vim.api.nvim_set_keymap('o', '<leader>e', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})
        end,
    },
    { --????????????????????????
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            }
        end,
    },
    { --????????????????????????
        "tpope/vim-surround",
        keys = { "c", "d", "y" },
    },
    { --??????TODO
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    { --??????%???????????????????????????if???
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    { --??????goto
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = true; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },
    { --?????????????????????
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end
    },
    { --???????????????????????????
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
                lastplace_ignore_filetype = {
                    "gitcommit", "gitrebase", "svn", "hgcommit",
                },
                lastplace_open_folds = true,
            })
        end,
    },
    { -- latex??????
        "lervag/vimtex",
        ft = { "tex" }

    },
    { --??????????????????
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    },
    { --Snips,??????????????????????????????
        "SirVer/ultisnips" },
    { --????????????????????????
        'michaelb/sniprun', run = 'bash ./install.sh' },
    { --????????????.????????????
        "tpope/vim-repeat" },
    -- { --???????????????
    --     "windwp/nvim-spectre",
    --     event = "BufRead",
    --     config = function()
    --         require("spectre").setup()
    --     end,
    -- },
    { --????????????
        "p00f/nvim-ts-rainbow",
    },
    { --??????????????????
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".setup()
        end
    },
    { --code action
        "kosayoda/nvim-lightbulb",
        config = function()
            require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
        end
    },
    { --??????????????????????????????????????????????????????
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                },
            }
        end
    },
    { --session??????????????????
        "Shatur/neovim-session-manager",
        config = function()
            local Path = require('plenary.path')
            require('session_manager').setup({
                sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
                path_replacer = '__', -- The character to which the path separator will be replaced for session files.
                colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
                autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
                autosave_last_session = true, -- Automatically save last session on exit and on session switch.
                autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
                autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                    'gitcommit',
                },
                autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
                max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
            })
        end
    },
    { --????????????????????????????????????
        "kkoomen/vim-doge", run = ':call doge#install()'
        -- config = function()
        --     -- vim.g.doge_enable_mappings = 0
        -- end,

    },
    { --????????????cmd
        "hrsh7th/cmp-cmdline",
        config = function()
            require 'cmp'.setup.cmdline(':', {
                sources = {
                    { name = 'cmdline' }
                },
            })
            require 'cmp'.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })
        end
    },
    -- {
    --     "nvim-telescope/telescope-project.nvim",
    --     event = "BufWinEnter",
    --     setup = function()
    --         vim.cmd [[packadd telescope.nvim]]
    --     end,
    -- },
    { "theHamsta/nvim-dap-virtual-text" },
    { "rcarriga/nvim-dap-ui" },
}


-- require('dap.dap-cpp')
-- require('dap.di-cpp')

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
