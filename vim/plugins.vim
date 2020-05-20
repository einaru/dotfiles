"
" Vim Plug configuration
"
" Author: Einar Uvsløkk <einar.uvslokk@gmail.com>
" Source: https://github.com/einaru/dotfiles

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" General:
Plug 'scrooloose/nerdtree'
let NERDTreeRespectWildIgnore=1
noremap <f9> :NERDTreeToggle<cr>

Plug 'octref/RootIgnore'
let g:RootIgnoreUseHome = 1
let g:RootIgnoreAgignore = 1

" Writing:
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<cr>
Plug 'lervag/vimtex', { 'for': 'tex' }

" Cosmetics:
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
set updatetime=200

" MarkupLanguages:
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }

" Development:
Plug 'editorconfig/editorconfig-vim'
Plug 'mesonbuild/meson', {'rtp': 'data/syntax-highlighting/vim'}
Plug 'sbdchd/neoformat'
nmap <f6> :Neoformat<cr>

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'psf/black', {'for': 'python'}

" Go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Javascript
Plug 'posva/vim-vue'
let g:vue_pre_processors = ['scss']

" HTML
" CSS/SCSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_triple_quoting_style="double"
let g:ultisnips_python_style="google"

" Put local plugin configurations in this file
let $localfile=expand('~/.config/vim/plugins.vim')
if filereadable($localfile)
	source $localfile
endif

call plug#end()
