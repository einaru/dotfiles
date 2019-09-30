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

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<cr>
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Programming:

" Build systems
Plug 'mesonbuild/meson', {'rtp': 'syntax-highlighting/vim'}

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]

let g:ultisnips_python_quoting_style="single"
let g:ultisnips_python_triple_quoting_style="double"
let g:ultisnips_python_style="google"

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'psf/black', {'for': 'python'}
nmap <f6> :Black<cr>

" Web
Plug 'Glench/Vim-Jinja2-Syntax'   " Jinja2 syntax
Plug 'othree/html5.vim'           " HTML5 omnicomplete and syntax
Plug 'cakebaker/scss-syntax.vim'  " SCSS syntax
Plug 'hail2u/vim-css3-syntax'     " CSS3 syntax
aug VimCSS3Syntax
	au!
	au BufRead,BufNewFile *.scss set ft=scss.css
	au FileType css,scss,scss.css setl iskeyword+=-
aug END
Plug 'pangloss/vim-javascript'    " Javascript indent and syntax
Plug 'posva/vim-vue', { 'for': 'vue' }
let g:vue_pre_processors = ['scss']
Plug 'mxw/vim-jsx'                " React JSX syntax and indent
let g:jsx_ext_required = 0        " allow JSX in normal JS files
Plug 'digitaltoad/vim-pug'        " Pug template engine syntax and indent

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
