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

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToogle' }
let NERDTreeRespectWildIgnore=1

Plug 'octref/RootIgnore'
let g:RootIgnoreUseHome = 1
let g:RootIgnoreAgignore = 1

Plug 'editorconfig/editorconfig-vim'

" Cosmetics:

Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'

" Writing:

Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1

" Programming:

" Build systems
Plug 'mesonbuild/meson', {'rtp': 'syntax-highlighting/vim'}

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_triple_quoting_style="double"
let g:ultisnips_python_style="google"

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }

" Web
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  " Allow JSX in normal JS files

" Qt
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

" Put local plugin configurations in this file
let $localfile=expand('~/.config/vim/plugins.vim')
if filereadable($localfile)
	source $localfile
endif

call plug#end()
