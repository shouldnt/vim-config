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








