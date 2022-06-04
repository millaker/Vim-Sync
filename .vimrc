"Use za to expand/fold

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'jiangmiao/auto-pairs'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
"Basic settings -------{{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set t_Co=256
colorscheme PaperColor
set background=dark
set number
set mouse=a
set so=15 "scrolloff
set path+=**
syntax on
set autoindent
set showcmd
set showmode
set relativenumber
let mapleader = " "
set laststatus=2
set clipboard=unnamed
set statusline=%f%=\Char:\ %c,\Current:\ %l,\ Total:\ %L
"}}}

"Keymappings -- InsertMode------{{{
inoremap jj <esc>
"Brackects autocomplete
"}}}
"Keymappings -- NormalMode ------------{{{
"Makes enter in normal mode add a newline but wont go in to insert mode
nnoremap <Enter> o<esc>
nnoremap <leader><Enter> O<esc>
"Append to the last in brackets or quotes
nnoremap <leader>" vi"<esc>a
nnoremap <leader>( vi(<esc>a
nnoremap <leader>{ vi{<esc>a
nnoremap <leader>[ vi[<esc>a
"Navigating in normal mode ( HEAD and LAST)
nnoremap H 0
nnoremap L $
"Toggle NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"Delete to the end of line
nnoremap <leader>d v$hd
"Source my .vimrc
nnoremap smv :w<Enter>:source $MYVIMRC<Enter>
"}}}

"keymappings -- VisualMode-----------{{{
"Auto Surround brackets
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap H 0
vnoremap L $
"}}}

"Autocmd----------------{{{
au FileType make set expandtab!
"NERDTree setup
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"}}}

"Vimscript file settings ----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"Change vim MatchParen settings to show cursor
hi MatchParen ctermfg=208 ctermbg=bg
