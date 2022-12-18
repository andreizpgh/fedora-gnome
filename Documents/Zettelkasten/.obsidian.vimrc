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

exmap nextTab obcommand workspace:next-tab
nmap tj :nextTab

exmap prevTab obcommand workspace:previous-tab
nmap tk :prevTab

exmap closeTab obcommand workspace:close
map tc :closeTab

exmap followLink obcommand editor:follow-link
nmap <CR> :followLink

exmap search obcommand switcher:open
nmap <Space>o :search

exmap search_word obcommand editor:open-search
nmap <Space>s :search_word

"editor:open-search-replace
"workspace:close-others
