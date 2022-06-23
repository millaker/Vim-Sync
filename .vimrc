"PlugIn
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'millaker/auto-pairs'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim'
call plug#end()

"Basic settings
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
set statusline=%f%=\Char:\ %c,\Current:\ %l,\ Total:\ %L
set tags=./tags,tags;$HOME

"Keymappings -- InsertMode
inoremap jj <esc>
imap <C-v> jj"+p

"Keymappings -- NormalMode
nnoremap <C-v> "+p

"Navigating in normal mode ( HEAD and LAST)
nnoremap H 0
nnoremap L $
"Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
"Source my .vimrc
nnoremap smv :w<Enter>:source $MYVIMRC<Enter>

"keymappings -- VisualMode
vnoremap H 0
vnoremap L $

"Autocmd
au FileType make set expandtab!
"NERDTree setup
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
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
