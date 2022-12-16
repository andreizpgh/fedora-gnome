" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Copy and paste to/from clipboard
set clipboard=unnamedplus

" Quickly remove search highlights
nmap <CR> :nohl

" Vim Normal Mode Mappings
unmap <Space>

exmap openPalette obcommand command-palette:open
nmap <Space>p :openPalette

exmap back obcommand app:go-back
nmap <Space>h :back

exmap forward obcommand app:go-forward
nmap <Space>l :forward

exmap search obcommand switcher:open
nmap <Space>o :search

exmap search_word obcommand editor:open-search
nmap <Space>s :search_word

"editor:open-search-replace
"workspace:split-vertical
"editor:open-link-in-new-split
"workspace:close
"workspace:close-others
