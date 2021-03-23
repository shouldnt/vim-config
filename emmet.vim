" let g:user_emmet_mode='n'
" let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings = {
\  'javascriptreact' : {
\	  'extends' : 'jsx',
\     'snippets': { 'c': "{/* |${child} */}" }
\  },
\  'javascript.jsx' : {
\	  'extends' : 'jsx',
\     'snippets': { 'c': "{/* |${child} */}" }
\  },
\}
let g:user_emmet_expandabbr_key = '<C-CR>'
nmap   <Leader>,   <C-y>,
imap   <C-CR> <plug>(emmet-expand-abbr)
imap   <C-/>   <plug>(emmet-toggle-comment)

