" Initialize configuration parameters
if !exists("g:ColorHourList")
    let g:ColorHourList = 'xoria256 jellybeans twilight two2tango wombat'
endif

" Autorun flag
if !exists("g:ColorHourAutoRun")
    let g:ColorHourAutoRun = 1
endif

command! -nargs=0 ColorHour call ColorHour()
function! ColorHour()
	let s:hr = str2nr(strftime('%H'))
	let s:colorsList = split(g:ColorHourList)

	let s:timeBlockSize = 24 / len(s:colorsList)

	"echo s:hr . ' ' . s:timeBlockSize

	let s:blockEnd = s:timeBlockSize
	let s:idx = 0
	while s:hr > s:blockEnd && s:idx < len(s:colorsList)
		"echo s:colorsList[s:idx]
		let s:blockEnd += s:timeBlockSize
		let s:idx += 1
	endwhile

	"echo 'Setting colorscheme to ' . s:colorsList[s:idx]
	execute 'colorscheme ' . s:colorsList[s:idx]
endfunction

if g:ColorHourAutoRun
	ColorHour
endif
