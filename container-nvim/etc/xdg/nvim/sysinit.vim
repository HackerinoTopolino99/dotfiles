source /usr/share/nvim/archlinux.lua
let mapleader = " "

"Navigation Mappings
inoremap <C-right> <cmd>tabnext<CR>
nnoremap <C-right> <cmd>tabnext<CR>
vnoremap <C-right> <cmd>tabnext<CR>
nnoremap <C-Left> <cmd>tabprevious<CR>
inoremap <C-Left> <cmd>tabprevious<CR>
vnoremap <C-Left> <cmd>tabprevious<CR>
nnoremap <C-d> <C-d>zz
inoremap <C-d> <C-d>zz
vnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
inoremap <C-u> <C-u>zz
vnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

"System clipboard interaction
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

"Usefull keybindings
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <leader>x <cmd>!chmod +x %<CR>

"Misc options
set number
set mouse=a
set title

"Split options
set splitright
set splitbelow

"Indentation options
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

"Swapfile options
set noswapfile
set nobackup
set nowritebackup

"Search navigation options
set hlsearch
set incsearch

"Aspect options
set termguicolors

syntax on
filetype plugin on
filetype indent on
