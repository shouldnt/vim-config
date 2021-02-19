
"set runtimepath^=~/.vim/bundle/ctrlp.vim
set number relativenumber
set shiftwidth=4
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
hi TabLineFill term=bold cterm=bold ctermbg=1000
set cursorcolumn
set cursorline
set encoding=UTF-8
set autoindent
set smartindent
call plug#begin("~/.vim/plugged")
    Plug 'vimwiki/vimwiki'
    Plug 'https://github.com/danro/rename.vim.git' 
    Plug 'https://github.com/jiangmiao/auto-pairs.git'
    Plug 'https://github.com/kana/vim-textobj-user.git'
    Plug 'https://github.com/kana/vim-textobj-line.git'
    Plug 'https://github.com/tpope/vim-unimpaired.git'
    Plug 'https://github.com/tmhedberg/matchit.git'
    Plug 'https://github.com/tpope/vim-repeat.git'
    Plug 'https://tpope.io/vim/surround.git'
    Plug 'https://github.com/pangloss/vim-javascript.git' 
    Plug 'dracula/vim'
    Plug 'https://github.com/kien/ctrlp.vim.git'
    Plug 'preservim/nerdtree'
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mattn/emmet-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'https://github.com/Yggdroot/indentLine.git'
    Plug 'ryanoasis/vim-devicons'
call plug#end()
"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


"Map keys
map <C-n> :NERDTreeToggle<CR>

"coc configs

" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"font_enable = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_ctrlp = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
set guifont=DroidSansMono\ Nerd\ Font:h11



"nerdtree config
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'j'
let NERDTreeShowHidden=1



"vim-javascript setting
let g:javascript_plugin_jsdoc = 1
