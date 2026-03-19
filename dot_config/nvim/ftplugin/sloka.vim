" ftplugin/sloka.vim  — buffer-local settings for .sloka files

let s:fmt = expand('~/Software/nirukta/format.py')
let &l:formatprg = 'uv run ' . s:fmt . ' 2>/dev/null'

setlocal expandtab
setlocal textwidth=0
setlocal formatoptions=
setlocal commentstring=#\ %s
