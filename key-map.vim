
let mapleader = " "
"past content from outside vim (like crtl + v)
"nmap <leader>f <C-^>
"copy content to system clipboard (like ctrl + c)
"
xnoremap <leader>y "+y
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

"disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l
nmap <leader>u :UndotreeShow<CR>

imap jj <ESC>
imap <C-}> <C-T>
imap <C-{> <C-D>
