set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smartindent

setlocal path=.,**
setlocal wildignore=*/node_modules/*

" https://gist.github.com/igemnace?page=2
let &l:include = 'from\|require'
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|function|class)|export\s+'
" set include='from\|require'
" setlocal define='\v(export\s+(default\s+)?)?(var|let|const|function|class)|export\s+'
