-- Load custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./lua/user/snippets" } })

local a = vim.api
local c = vim.cmd
local t_builtin = require 'telescope.builtin'
local models = {}

-- Search string with telescope
-- NOT RECOMMENDED because it a lot worse that fzf with Rg, it's slower and search is not good as fzf
function TelescopeSearch(opts)
  local search_string = opts.args
  return t_builtin.grep_string { shorten_path = true, word_match = "-w", only_sort_text = false, search = search_string }
end

function models.apply()
  -- Create user commands
  a.nvim_create_user_command('TelescopeSearch', TelescopeSearch, { nargs = 1 })
  a.nvim_create_user_command('G', ':FloatermNew --height=0.8 --width=0.8 go run %', {})

  -- Execute commands
  -- TODO: Convert to nvim lua api autocmd
  -- Don't autocomment next line
  c('autocmd FileType * set formatoptions-=cro')

  -- Disable bell sound on Mac
  c('autocmd! GUIEnter * set vb t_vb=')

  -- Set default tab width to 4 for Go
  c('autocmd FileType go setlocal shiftwidth=4 tabstop=4')

  -- Triger `autoread` when files changes on disk
  -- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  -- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  c(
    'autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *  if mode() !~ \'\v(c|r.?|!|t)\' && getcmdwintype() == \'\' | checktime | endif ')

  -- Notification after file change
  -- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  c('autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')

  -- Uncomment the following to have Vim jump to the last position when reopening a file
  c('autocmd BufReadPost * if line("\'\\"") > 0 && line("\'\\"") <= line("$") | exe "normal! g`\\"" | endif')

  -- Yaml syntax for *.sls files
  c('autocmd BufNewFile,BufRead *.sls setfiletype yaml')
end

return models
