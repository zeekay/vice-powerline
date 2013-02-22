func! vice#powerline#callback()
    func! Powerline#Functions#fugitive#GetBranch(symbol)
        if !has_key(g:Powerline_symbols_override, 'FUGITIVE')
            let g:Powerline_symbols_override['FUGITIVE'] = 'git '
        endif

        let status = substitute(fugitive#statusline()[5:-3], '(', ' ', '')

        if status != ''
            let parts = split(status)
            if len(parts) == 2
                return g:Powerline_symbols_override['FUGITIVE'].parts[1].':'.parts[0]
            else
                return g:Powerline_symbols_override['FUGITIVE'].parts[0]
            endif
        else
            return ''
        endif
    endf

    func! Powerline#Functions#syntastic#GetErrors(line_symbol)
        if !exists('g:syntastic_stl_format')
            " Syntastic hasn't been loaded yet
            return ''
        endif
        return SyntasticStatuslineFlag()
    endf

    if exists('g:loaded_lawrencium')
        func! Powerline#Functions#lawrencium#GetBranch(...)
            if !has_key(g:Powerline_symbols_override, 'LAWRENCIUM')
                let g:Powerline_symbols_override['LAWRENCIUM'] = 'hg '
            endif

            let status = lawrencium#statusline()

            if status != ''
                return g:Powerline_symbols_override['LAWRENCIUM'].status
            else
                return ''
            endif
        endf

        call Pl#Theme#InsertSegment('lawrencium:branch', 'after', 'fugitive:branch')

        let g:Powerline#Segments#lawrencium#segments = Pl#Segment#Init(['lawrencium',
            \ (exists('g:loaded_lawrencium') && g:loaded_lawrencium == 1),
            \
            \ Pl#Segment#Create('branch', '%{Powerline#Functions#lawrencium#GetBranch("$BRANCH")}')
        \ ])
    endif
endf
