function GotoMidleBetweenCursorAndTop()
	let l:currentPosition = line('.')
	execute "normal! H"
	let l:topPosition = line('.')
	if((l:topPosition - g:scroll_off_value) > 0)
		let l:topPosition = l:topPosition - g:scroll_off_value
	endif

	let l:middle = l:topPosition + float2nr((l:currentPosition - l:topPosition) / 2)

	execute "normal! ". string(l:middle) . "G"
endfunction

function GotoMidleBetweenCursorAndBottom()
	let l:totalLine = line('$')

	let l:currentPosition = line('.')

	execute "normal! L"
	let l:bottomPosition = line('.')

	if((l:bottomPosition + g:scroll_off_value) > l:totalLine)
		let l:bottomPosition = l:totalLine
	endif

	let l:middle = l:currentPosition + float2nr((l:bottomPosition - l:currentPosition) / 2)

	execute "normal! ". string(l:middle) . "G"
endfunction

function FocusToCocExplorer()
	redir =>rawString
	silent execute 'ls! a'
	redir END
	let @o = rawString
	let list = split(rawString, '\n')
	for s in list
		if( match(s, "coc-explorer") >= 0 )
			let winId = win_findbuf(matchstr(s, '\v[0-9]+'))[0]
			execute "call win_gotoid(".winId.")"
		endif
	endfor
	" win_findbuf({bufnr})					*win_findbuf()*
	" win_gotoid({expr})					*win_gotoid()*
	" win_findbuf()		find windows containing a buffer
	" search()		find a match for a pattern
	return ''
endfunction








