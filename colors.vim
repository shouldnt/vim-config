"Config Section
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
colorscheme spaceduck
highlight Cursor guifg=white guibg=yellow


set cursorcolumn
set cursorline
hi nCursor ctermfg=white ctermbg=black guifg=white guibg=yellow
hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=#172833
hi CursorLine guibg=#172833
highlight Normal guibg=none
highlight NonText guibg=none
hi Visual  guibg=#363f68
" 0f111b
