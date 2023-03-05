--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below
--
--
-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key

local config = {
        -- Configure AstroNvim updates
        updater = {
                remote = "origin",     -- remote to use
                channel = "stable",    -- "stable" or "nightly"
                version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main",       -- branch name (NIGHTLY ONLY)
                commit = nil,          -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false,  -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false,   -- automatically reload and sync packer after a successful update
                auto_quit = false,     -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },
        -- Set colorscheme to use
        colorscheme = "default_theme",
        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },
        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true,         -- sets vim.opt.number
                        spell = false,         -- sets vim.opt.spell
                        signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
                        wrap = false,          -- sets vim.opt.wrap
                        ignorecase = true,     -- Set insensitive case search
                        smartcase = true,      --If there is an uppercase letter it will work as ignorecase is off
                        clipboard = "",
                        scrolloff = 8,         -- Scroll when you are 8 lines far from top/bottom
                        timeoutlen = 150,      -- Sets keycode timeout
                        ttimeoutlen = 0,
                        updatetime = 100,      -- Git checks file every 100ms(default 4000ms)
                        undofile = true,       -- Persistent undo, undo works after closing file
                        incsearch = true,      -- Searches while typing
                        swapfile = false,      -- Doesn't create swap files
                        expandtab = true,      -- Converts tabs to spaces
                        tabstop = 2,           -- The width of a TAB is set to 2. Still it is a \t. It is just that Vim will interpret it to have  width of 2.
                        shiftwidth = 2,        -- Indents will have a width of 2
                        softtabstop = 2,       -- Sets the number of columns for a TAB
                        hidden = true          -- Hide buffer
                },
                g = {
                        mapleader = " ",                   -- sets vim.g.mapleader
                        autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true,                -- enable completion at start
                        autopairs_enabled = false,         -- enable autopairs at start
                        diagnostics_enabled = true,        -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
                        heirline_bufferline = false,       -- enable new heirline based bufferline (requires :PackerSync after changing)
                        vim_markdown_folding_disabled = 1,
                        fzf_layout = { window = { width = 0.9, height = 0.9 } },
                        fzf_preview_window = { 'right:50%' },
                        fzf_action = {
                                ['ctrl-t'] = 'tab split',
                                ['ctrl-h'] = 'split',
                                ['ctrl-v'] = 'vsplit',
                        },
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                "       .-.      _______                   .  '  *   .  . '",
                "      {}``; |==|_______D                    .  * * -+-  ",
                "      / ('        /|\\                   .    * .    '  *",
                "  (  /  |        / | \\                      * .  ' .  . ",
                "   \\(_)_]]      /  |  \\                  *   *  .   .",
                "                                                     '   *",
                "",
                "",
                "             ███    ██ ██    ██ ██ ███    ███",
                "             ████   ██ ██    ██ ██ ████  ████",
                "             ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "             ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "             ██   ████   ████   ██ ██      ██",
        },
        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },
        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },
        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true,     -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },
        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                -- Normal mode
                n = {
                        -- second key is the lefthand side of the map
                        -- mappings seen under group name "Buffer"
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        ["Q"] = { ":q!<cr>", desc = "Save File", remap = false },
                        ["Y"] = { "\"+y", desc = "Save File", remap = false },
                        ["U"] = { ":redo<CR>", remap = false, desc = "Maps redo to U" },
                        [";"] = { ":Telescope find_files<CR>", remap = false, desc =
                        "Search files with telescope(same as <leader> f f" },
                        -- Doesn't scroll screen when doing C-u and C-d
                        ["<C-d>"] = { "30j", desc = "Change <C-d> to 30j instead" },
                        ["<C-u>"] = { "30k", desc = "Change <C-u> to 30k instead" },
                        ["<C-t>"] = { ":FloatermNew --height=0.8 --width=0.8<CR>", remap = false, desc =
                        "Open terminal in floating window" },
                        ["<C-o>"] = { ":Neotree toggle<CR>", remap = false, desc = "Toggle Neotree" },
                        ["<C-_>"] = { function() require("Comment.api").toggle.linewise.current() end, desc =
                        "Toggles comment with Ctrl+/ NOT _, vim for some reason registers <C-/> as <C-_>" },
                        ["<C-s>"] = { "1z=", desc = "Corrects mistyped word" },
                        ["<C-g>"] = { ":FloatermNew --height=1.0 --width=1.0 lazygit<CR>", remap = false, silent = true, desc =
                        "Opens lazygit in floating window" },
                        ["<C-n>"] = {
                                ":FloatermNew --height=1.0 --width=1.0 MDV_THEME=960.847 mdv % \\| less -r<CR>", remap = false, silent = true, desc =
                        "Opens markdown preview in floating window" },
                        ["<C-x>"] = { ":bd<CR>", remap = false, desc = "Close buffer" },
                        ["<C-e>"] = { ":tabedit %<CR>", remap = false, desc = "Open split temp in new tab" },
                        -- RgRaw required repgrep and 'vim-agriculture' plugin
                        ["<C-f>"] = { ":RgRaw -i ", remap = false, desc =
                        "Grep patern in files and search through files, this uses fzf instead of telescope because telescope is too slow and search isn't as good as fzf" },
                },
                -- Visual mode
                v = {
                        ["Y"] = { "\"+y", desc = "Save File" },
                        ["<C-_>"] = { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
                                desc = "Toggles comment with Ctrl+/ NOT _, vim for some reason registers <C-/> as <C-_>",
                        },
                        -- Doesn't scroll screen when doing C-u and C-d
                        ["<C-d>"] = { "30j", desc = "Change <C-d> to 30j instead" },
                        ["<C-u>"] = { "30k", desc = "Change <C-u> to 30k instead" },
                        -- By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with.
                        -- Press enter and then confirm each change you agree with y or decline with n.
                        ["<C-r>"] = { '"hy:%s/<C-r>h//gc<left><left><left>' },
                        -- P doesn't override the deafult registrer
                        ["p"] = { "\"_dP", remap = false }
                },
                -- Command mode
                c = {
                        -- When mistyping uppercase instead of lowercase
                        ["W"] = { "w" },
                        ["Q"] = { "q" },
                },
                -- Terminal mode
                t = {
                        --
                        [","] = { "<C-\\><C-N>", desc = "Remaps exit from nvim terminal to ,", remap = false }
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },
        -- Configure plugins
        plugins = {
                init = {
                        -------------------------------
                        ------- CUSTOM PLUGINS --------
                        -------------------------------

                        { "voldikss/vim-floaterm" },
                        { "RRethy/vim-illuminate" },
                        { "junegunn/fzf" },
                        { "junegunn/fzf.vim" },
                        { "jesseleite/vim-agriculture" }, -- Used together with fzf to append flag to Rg and Ag

                        -------------------------------

                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = {        -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
        },
        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },
        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },
        -- Customize Heirline options
        heirline = {
                -- -- Customize different separators between sections
                -- separators = {
                --   tab = { "", "" },
                -- },
                -- -- Customize colors for each element each element has a `_fg` and a `_bg`
                -- colors = function(colors)
                --   colors.git_branch_fg = astronvim.get_hlgroup "Conditional"
                --   return colors
                -- end,
                -- -- Customize attributes of highlighting in Heirline components
                -- attributes = {
                --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
                --   git_branch = { bold = true }, -- bold the git branch statusline component
                -- },
                -- -- Customize if icons should be highlighted
                -- icon_highlights = {
                --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
                --   file_icon = {
                --     winbar = false, -- Filetype icon in the winbar inactive windows
                --     statusline = true, -- Filetype icon in the statusline
                --   },
                -- },
        },
        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },
        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

------------------------------------------------------
---------------- CUSTOM CONFIGURATION ----------------
------------------------------------------------------

-- Old vimscript configs
-- vim.cmd('source ~/.config/nvim/lua/user/custom_vimscript_configs.vim')

-- Load custom settings
local custom_settings = require('user.custom')
custom_settings.apply()

return config
