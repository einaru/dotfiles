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
noremap <f4> :NERDTreeToogle<cr>

Plug 'octref/RootIgnore'
let g:RootIgnoreUseHome = 1
let g:RootIgnoreAgignore = 1

Plug 'editorconfig/editorconfig-vim'

" Cosmetics:

Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
set updatetime=200

" Writing:

Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'godlygeek/tabular'
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
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
aug VimCSS3Syntax
	au!
	au BufRead,BufNewFile *.scss set ft=scss.css
	au FileType css,scss,scss.css setl iskeyword+=-
aug END
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0  " Allow JSX in normal JS files
Plug 'digitaltoad/vim-pug'

" Qt
Plug 'peterhoeg/vim-qml', { 'for': 'qml' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Put local plugin configurations in this file
let $localfile=expand('~/.config/vim/plugins.vim')
if filereadable($localfile)
	source $localfile
endif

call plug#end()
