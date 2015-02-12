set nocompatible
filetype plugin on
set modeline

source ~/.vimrc.func

syntax on
colorscheme desert  "Sets defaut color scheme

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

set wildmode=list:longest
set wildmenu                "enable ct\l-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildchar=<TAB> wildmenu wildmode=full
set wildcharm=<C-Z>

set hlsearch
set ignorecase
set smartcase
set colorcolumn =120

nnoremap <TAB> :b <C-Z>
map <F4> :so %<CR>
map <F12> :call ToggleColorColumn()<CR>
map <F9> :call NumberToggle()<CR>

" zaznacz biale znaki na koncach linii
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red

command! Mm call s:ExecuteInShell('./m','')
