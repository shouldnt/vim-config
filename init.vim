source ~/.vim/autoload/plug.vim
source ~/.config/nvim/key-map.vim

filetype plugin on

"set runtimepath^=~/.vim/bundle/ctrlp.vim
" set synmaxcol=128
" syntax sync minlines=256
set number
set ignorecase
set shiftwidth=4
set list
set noswapfile
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set completeopt=menuone,noinsert,noselect
hi TabLineFill term=bold cterm=bold ctermbg=1000
set encoding=UTF-8
set autoindent
set smartindent

call plug#begin("~/.vim/plugged")

Plug 'ayu-theme/ayu-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' },
" Plug 'https://github.com/unblevable/quick-scope'
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
Plug 'preservim/nerdtree'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/Yggdroot/indentLine.git'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"Config Section
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
let ayucolor="dark"
colorscheme ayu
highlight Cursor guifg=white guibg=yellow

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
nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
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
"let g:javascript_plugin_jsdoc = 1

"webdevicons#refresh


"source ~/.config/nvim/my-setting.vim


"my vim setting
" set timeoutlen=200
autocmd FileType javascript setlocal shiftwidth=4 tabstop=2 softtabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType xml setlocal shiftwidth=4 softtabstop=2 expandtab
autocmd FileType javascriptreact setlocal shiftwidth=4 tabstop=2 softtabstop=2 expandtab

"emmet setting
let g:user_emmet_leader_key=','


" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
"telescope setting
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
map <C-p> <esc><Leader>ff
map! <C-p> <esc><Leader>ff
lua << EOF
require('telescope').setup{
defaults = {
file_ignore_patterns = {"node_modules/.*"},
prompt_position = "top",
sorting_strategy = "ascending"
}
}
EOF
nnoremap <leader>sv :source $MYVIMRC<CR>
let g:NERDToggleCheckAllLines = 1
" remove trailing when save
"
"
autocmd BufWritePre * :%s/\s\+$//e

set cursorcolumn
set cursorline
" hi CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
hi nCursor ctermfg=white ctermbg=black guifg=white guibg=yellow
autocmd Filetype json let g:indentLine_setConceal = 0 | let g:vim_json_syntax_conceal = 0

set conceallevel=0

source ~/.config/nvim/startify-bookmark.vim
source ~/.config/nvim/coc-config.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/command.vim
