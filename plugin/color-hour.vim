" Initialize configuration parameters
if !exists("g:ColorHourList")
    let g:ColorHourList = 'xoria256 jellybeans twilight two2tango wombat'
endif

" Autorun flag
if !exists("g:ColorHourAutoRun")
    let g:ColorHourAutoRun = 1
endif

command! -nargs=0 ColorHour call ColorHour(1)
function! ColorHour(timerId)
	let s:hr = str2nr(strftime('%H'))
	let s:colorsList = split(g:ColorHourList)

	let s:timeBlockSize = 24.0 / len(s:colorsList)

	let s:blockEnd = s:timeBlockSize
	let s:idx = 0
	while s:hr > s:blockEnd && s:idx < len(s:colorsList)
		let s:blockEnd += s:timeBlockSize
		let s:idx += 1
	endwhile

	if !exists("g:colors_name") || g:colors_name != s:colorsList[s:idx]
		execute 'colorscheme ' . s:colorsList[s:idx]
	endif
endfunction

if g:ColorHourAutoRun
	ColorHour
	call timer_start (1000*60, 'ColorHour', {'repeat': -1})
endif
