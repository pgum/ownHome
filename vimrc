set nocompatible

"Source all vimrc.<module> in .Vimrc directory
for AdditionalVimrc in split(globpath("~/.Vimrc/", "[0-9]*"), '\n')
  execute('source '.AdditionalVimrc)
endfor

filetype plugin on
set modeline

syntax on
colorscheme desert "molokai
set showcmd
set number

set autoindent
set smartindent

set smarttab
set shiftwidth=2
set softtabstop=3
set tabstop=2       "tab step size
set expandtab
set list listchars=tab:\.\ ,trail:>

set showmatch       " matching brackets
set ruler           "show the cursor position
set laststatus=2    " zawsze pokazuj linie statusu
set notagbsearch    " dodaje mozliwosc logow bez szukania /dzieki temu nie ma errora: E432: Tags file not sorted: tags ani E257

set switchbuf=usetab
set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase
set colorcolumn=120

" zaznacz biale znaki na koncach linii
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red

" szukaj lokalnego pliku vimrc w katalogu otwieranego pliku
autocmd BufReadPre *.[ch]pp call SearchForLocalVimrc()
  " Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
