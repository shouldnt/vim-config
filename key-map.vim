
let mapleader = " "
"past content from outside vim (like crtl + v)
"nmap <leader>f <C-^>
"copy content to system clipboard (like ctrl + c)
"
" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Clears the search register
nnoremap <silent> <leader>/ :nohlsearch<CR>

" --- move around splits {
" move to and maximize the below split
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split
nmap <c-l> <c-w>l<c-w><bar>
nnoremap <silent> <Leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winwidth(0) * 2/3)<CR>
xnoremap <leader>y "*y
noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>p "*p
noremap <leader>P "*P

"disable arrow keys
nnoremap <Up> :resize +4<CR>
nnoremap <Down> :resize -4<CR>
nnoremap <Left> :vertical resize +4<CR>
nnoremap <Right> :vertical resize -4<CR>

nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap <leader>u :UndotreeToggle<CR>

imap jj <ESC>
imap <C-}> <C-T>
imap <C-{> <C-D>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>


" scroll horizontal
nnoremap <silent> zh :call HorizontalScrollMode('h')<CR>
nnoremap <silent> zl :call HorizontalScrollMode('l')<CR>
nnoremap <silent> zH :call HorizontalScrollMode('H')<CR>
nnoremap <silent> zL :call HorizontalScrollMode('L')<CR>


function! HorizontalScrollMode( call_char )
    if &wrap
        return
    endif

    echohl Title
    let typed_char = a:call_char
    while index( [ 'h', 'l', 'H', 'L' ], typed_char ) != -1
        execute 'normal! z'.typed_char
        redraws
        echon '-- Horizontal scrolling mode (h/l/H/L)'
        let typed_char = nr2char(getchar())
    endwhile
    echohl None | echo '' | redraws
endfunction

nnoremap <leader>a :Ack!
