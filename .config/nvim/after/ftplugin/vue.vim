set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smartindent

setlocal path=.,**
setlocal wildignore=*/node_modules/*

" https://gist.github.com/igemnace?page=2
let &l:include = 'from\|require'
let &l:define = "^\\s*\\(name\\)\\?"
let &l:suffixesadd = '.vue'

function! VueInclude(fname)
	let path = a:fname

	if stridx(path, '/') == 0
		let npath = path[1:strlen(path)]
		if stridx(npath, 'modules') == 0
			return './src/'.npath.'.vue'
		end

		return './'.npath.'.vue'
	end
	return path.'.vue'
endfunction

setlocal includeexpr=VueInclude(v:fname)
