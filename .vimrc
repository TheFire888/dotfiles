filetype on
filetype plugin on
set encoding=utf8
filetype indent on

syntax on

colorscheme luan
set number
set relativenumber

set shiftwidth=4
set tabstop=4
set expandtab

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" ------------------ PLUGINS ----------------------
call plug#begin('~/.vim/plugged')

    Plug 'dense-analysis/ale'
    Plug 'SirVer/ultisnips'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-dispatch'

call plug#end()

" ----------------- MAP KEYS ----------------------
let mapleader = '\'
nnoremap <space> :
nnoremap nd :NERDTreeToggle<cr>
noremap <leader>m <Cmd>Make<CR>
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
xnoremap <leader>y y:call system("wl-copy", @")<cr>
nnoremap <leader>+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap <leader>*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" ----------------- STATUS LINE -------------------

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=row:\ %l\ col:\ %c\ \ 

" Show the status on the second to last line.
set laststatus=2

" ---------------- VIMTEX -------------------------
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = "latex"

