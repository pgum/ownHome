syntax on
set showcmd
set nocompatible
set number
set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=2
set tabstop=2       "tab step size
set showmatch       " matching brackets
set ruler           "show the cursor position

set expandtab
"set list listchars=tab:\ \ ,trail:·
colorscheme desert  "Sets defaut color scheme
set expandtab       " Check what is it
set laststatus=2    " zawsze pokazuj linie statusu
set notagbsearch    " dodaje mozliwosc logow bez szukania /dzieki temu nie ma errora: E432: Tags file not sorted: tags ani E257

set switchbuf=usetab
set wildmode=list:longest
set wildmenu                "enable ct\l-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set hlsearch
set ignorecase
set smartcase

fun! TurnNumbersOn()
   set number
   highlight LineNr ctermfg=yellow
endfun
fun! TurnRelNumbersOn()
   set relativenumber
   highlight LineNr ctermfg=green
endfun
fun! TurnNumbersOff()
   set nonumber
   set norelativenumber
endfun

let s:numtgl = 0
fun! NumberToggle()
   if s:numtgl == 2
      let s:numtgl = 0
      call TurnNumbersOn()
   elseif s:numtgl == 0
      let s:numtgl = 1
      call TurnRelNumbersOn()
   elseif s:numtgl == 1
      let s:numtgl = 2
      call TurnNumbersOff()
   endif
endfun


set hidden
map <F4> :so %<CR>
map <F9> :call NumberToggle()<CR>

function! s:ExecuteInShell(command, bang)
	let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

	if (_ != '')
		let s:_ = _
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')
		silent! execute  winnr < 0 ? 'belowright new ' . fnameescape(_) : winnr . 'wincmd w'
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile wrap number
		silent! :%d
		let message = 'Execute ' . _ . '...'
		call append(0, message)
		echo message
		silent! 2d | resize 1 | redraw
		silent! execute 'silent! %!'. _
		silent! execute 'resize ' . line('$')
		silent! execute 'syntax on'
		silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nno,emap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
		nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
		silent! syntax on
	endif
endfunction
command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

command! Mm call s:ExecuteInShell('./m','')

" zaznacz biale znaki na koncach linii
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"""""""" hint na podpowiadanie tab'em
set wildchar=<TAB> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <TAB> :b <C-Z>

"""""""" show 120column and overlenght string
let s:hlLenghtyLines = 1
set cc=120

fun! TurnHighlightOn()
   hi ColorColumn NONE
endfun

fun! TurnHighlightOff()
   hi ColorColumn ctermfg=white ctermbg=darkred
endfun

fun! ToggleOverLenghtHighlightPlx()
   if s:hilightws
      let s:hlLenghtyLines = 0
      call TurnHighlightOn()
   else
      let s:hlLenghtyLines = 1
      call TurnHighlightOff()
   endif
endfun

map <F12> :call ToggleOverLenghtHighlightPlx()<CR>
