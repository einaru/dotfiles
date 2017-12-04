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

if count(g:enabled_plugins, 'general')
	Plug 'scrooloose/nerdtree'
	let NERDTreeRespectWildIgnore=1
	Plug 'octref/RootIgnore'
	let g:RootIgnoreUseHome = 1
	let g:RootIgnoreAgignore = 1
	Plug 'editorconfig/editorconfig-vim'
endif

if count(g:enabled_plugins, 'cosmetics')
	Plug 'NLKNguyen/papercolor-theme'
endif

if count(g:enabled_plugins, 'git')
	Plug 'airblade/vim-gitgutter'
endif

if count(g:enabled_plugins, 'writing')
	Plug 'lervag/vimtex'
	Plug 'tpope/vim-markdown'
endif

if count(g:enabled_plugins, 'programming')
	" Build system
	Plug 'mesonbuild/meson', {'rtp': 'syntax-highlighting/vim'}
	" Snippets
	Plug 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="horizontal"
	let g:UltiSnipsSnippetDirectories=["UltiSnips", "snips"]
	Plug 'honza/vim-snippets'
	let g:ultisnips_python_quoting_style="single"
	let g:ultisnips_python_triple_quoting_style="double"
	let g:ultisnips_python_style="google"

	" Python
	Plug 'hynek/vim-python-pep8-indent'
	Plug 'nvie/vim-flake8'

	" Web
	Plug 'Glench/Vim-Jinja2-Syntax'
	Plug 'othree/html5.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'mxw/vim-jsx'
	let g:jsx_ext_required = 0  " Allow JSX in normal JS files
	Plug 'hail2u/vim-css3-syntax'
	Plug 'cakebaker/scss-syntax.vim'

	" Qt
	Plug 'peterhoeg/vim-qml'
endif

" Put local plugin configurations in this file
let $localfile=expand('~/.config/vim/plugins.vim')
if filereadable($localfile)
	source $localfile
endif

call plug#end()
