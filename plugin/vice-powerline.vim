call vice#Extend({
    \ 'addons': [
        \ 'github:zeekay/vim-powerline-hax',
        \ 'github:Lokaltog/vim-powerline',
    \ ]
\ })

let g:Powerline_symbols_override = {
    \ 'FUGITIVE': '∓ ',
    \ 'LAWRENCIUM': '☿ ',
\ }

let g:Powerline_dividers_override = ['', '⏐', '', '⏐']

if exists('g:loaded_lawrencium') && exists(':Powerline') > 0
    call Pl#Theme#InsertSegment('lawrencium:branch', 'after', 'fugitive:branch')
endif
