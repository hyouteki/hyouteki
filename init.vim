:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set shell=C:/ProgramData/chocolatey/bin/nu.exe

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/mg979/vim-visual-multi'
Plug 'https://github.com/EtiamNullam/deferred-clipboard.nvim'

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>
