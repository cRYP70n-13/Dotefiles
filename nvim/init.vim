call plug#begin('~/.vim/plugged')
" Tools
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'stsewd/fzf-checkout.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-rooter'
	Plug 'tibabit/vim-templates'
	let g:rooter_patterns = ['.git']
	Plug 'mhinz/vim-startify'
	Plug 'preservim/nerdtree'
	Plug 'fatih/vim-go'
	Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
	Plug 'pbrisbin/vim-mkdir'
	Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
	Plug 'wakatime/vim-wakatime'
	Plug 'preservim/nerdcommenter'
" Syntax
	Plug 'sheerun/vim-polyglot' 
	Plug 'sainnhe/sonokai'
	Plug 'rust-lang/rust.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary' " gc to comment out
	Plug 'tpope/vim-fugitive'
	Plug 'jiangmiao/auto-pairs'
	Plug 'RRethy/vim-illuminate'
" Appearance
	Plug 'chriskempson/base16-vim'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

" Configuration
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'border': 'sharp' } }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:webdevicons_enable_startify = 1
let g:ranger_map_keys = 0
map <leader><leader>m :Ranger<CR>

" Autoimport for golang
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Using the vim wiki to take notes
let g:vimwiki_list = [{ 'path': '~/Documents/notes/',
	\ 'syntax': 'markdown', 'ext': '.md' }]
autocmd FileType vimwiki set ft=markdown
nnoremap <Leader>ww :e ~/Documents/notes/index.md<cr>

" - - - - - - - - - - General - - - - - - - - - -  
" Essentials
set shell=/bin/zsh
set nocompatible
set ttyfast
set lazyredraw
set encoding=UTF-8
set clipboard+=unnamedplus " Use system clipboard
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread
set wildmenu
set wildmode=longest:full,full
set spell spelllang=en_us
let $FZF_DEFAULT_COMMAND = 'rg --hidden -l ""'
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 noexpandtab
set splitbelow splitright 
set nobackup nowritebackup
set noswapfile
set number relativenumber
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when search query contains a capital letter
set autoread        " Auto load files if they change on disc

" Appearance
colorscheme base16-gruvbox-dark-hard
" colorscheme sonokai
set background=dark termguicolors
let g:airline_theme='base16'
" let g:airline_theme='sonokai'
set colorcolumn=82
let g:netrw_banner = 0
set listchars=tab:‣\ ,extends:›,precedes:‹,nbsp:·,trail:␣
set list
set guifont=DroidSansMono_Nerd_Font:h11

" - - - - - - - - - - Mappings- - - - - - - - - -  

" General
let g:mapleader = " " " Set leader to spacebar
inoremap jj <ESC>:w<CR>
map <C-n> :noh<cr>
map <Leader>w :w<CR>
map <leader><leader>q :bdelete<CR>

" Tabs navigations
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Splits
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" FZF Navigation
nmap <leader><leader>f :Files<CR>
nmap <leader><leader>b :Buffers<CR>
nmap <leader><leader>w :Windows<CR>
nmap <leader><leader>e :CocCommand explorer<CR>
nnoremap <C-p> :GFiles<CR>

" Git Navigation
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nnoremap <leader>gc :GCheckout<CR>

" - - - - - - - - - - Conquer of Completion -  -  -  -  -  -  -  -  -  -
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Extensions
let g:coc_global_extensions = [
			\'coc-markdownlint',
			\'coc-css',
			\'coc-clangd',
			\'coc-rls',
			\'coc-rust-analyzer',
			\'coc-solargraph',
			\'coc-python',
			\'coc-prettier',
			\'coc-tsserver',
			\'coc-highlight',
			\'coc-explorer',
			\'coc-json', 
			\'coc-git'
			\]

