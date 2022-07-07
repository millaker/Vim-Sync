"PlugIn
call plug#begin()
Plug 'preservim/NERDTree'
"Plug 'millaker/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"Basic settings
filetype on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
colorscheme codedark
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
set tags=./tags,tags;$HOME

set statusline=
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

"---------------------Keymappings -- InsertMode------------------------------
inoremap jj <esc>
imap <C-v> jj"+p

"---------------------Keymappings -- Normal Mode------------------------------
"Paste text in buffer
nnoremap <C-v> "+p      

"Open fuzzy finder
nnoremap <C-p> :Files<CR>

"Close current tab
nnoremap <C-c> :tabclose<CR>

"Navigating in normal mode ( HEAD and LAST)
nnoremap H 0
nnoremap L $

"Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"Source my .vimrc
nnoremap smv :w<Enter>:source $MYVIMRC<Enter>

"Open terminal 
nnoremap <C-j> :bo term<CR>

"---------------------Keymappings -- VisualMode-------------------------------
vnoremap H 0
vnoremap L $
vmap <C-c> "+y

"---------------------Keymappings -- Terminal-JobMode-------------------------
"Enter terminal normal mode and scroll
tmap <C-e> <C-w>N<C-e>
tmap <C-y> <C-w>N<C-y>
tmap <C-j> <C-d>

"Autocmd
augroup vimrc_make
    au!
    au Filetype makefile set expandtab!
augroup end

"NERDTree setup
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close current tab if NERDTree is the only windo remaining
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | tabclose | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"
"Change vim MatchParen settings to show cursor
hi MatchParen ctermfg=Yellow ctermbg=Green

"Coc settings
"Coc <tab> completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Coc update time
set updatetime=300

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Cycle through diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"Use ctrl space to trigger suggestions
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"Merge signcolumn with line numbers
set signcolumn=number

" Use K to show documentation in preview window.
nnoremap <silent> <C-k> :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map enter to indent correctly
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

