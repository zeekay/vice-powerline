call vice#Extend({'addons': [
    \ 'github:Lokaltog/vim-powerline',
\ ]})

call vice#Register('github:Lokaltog/vim-powerline', 'vice#powerline#callback')

let g:Powerline_symbols_override = {
    \ 'FUGITIVE': '∓ ',
    \ 'LAWRENCIUM': '☿ ',
\ }

let g:Powerline_dividers_override = ['', '⏐', '', '⏐']
