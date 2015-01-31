set nocompatible
set number
cmap <F4> :set rnu<CR>
cmap <F3> :set number<CR>
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set hlsearch
set ignorecase
set smartcase
map <F5> :so %<CR>

