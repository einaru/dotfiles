"
" Vim Plugin configuration
"
" Author: Einar Uvsløkk <einar.uvslokk@gmail.com>
" Source: https://github.com/einaru/dotfiles
"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

if count(g:enabled_plugins, 'general')
	Plugin 'scrooloose/nerdtree'
	let NERDTreeRespectWildIgnore=1
	Plugin 'octref/RootIgnore'
	let g:RootIgnoreUseHome = 1
	let g:RootIgnoreAgignore = 1
	Plugin 'editorconfig/editorconfig-vim'
endif

if count(g:enabled_plugins, 'cosmetics')
	Plugin 'NLKNguyen/papercolor-theme'
endif

if count(g:enabled_plugins, 'git')
	Plugin 'airblade/vim-gitgutter'
endif

if count(g:enabled_plugins, 'writing')
	Plugin 'lervag/vimtex'
	Plugin 'tpope/vim-markdown'
endif

if count(g:enabled_plugins, 'programming')
	" Build system
	Plugin 'mesonbuild/meson', {'rtp': 'syntax-highlighting/vim'}
	" Snippets
	Plugin 'SirVer/ultisnips'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="horizontal"
	Plugin 'honza/vim-snippets'
	let g:ultisnips_python_quoting_style="single"
	let g:ultisnips_python_triple_quoting_style="double"
	let g:ultisnips_python_style="google"

	" Python
	Plugin 'hynek/vim-python-pep8-indent'
	Plugin 'nvie/vim-flake8'

	" Web
	Plugin 'othree/html5.vim'
	Plugin 'pangloss/vim-javascript'
	Plugin 'mxw/vim-jsx'
	let g:jsx_ext_required = 0  " Allow JSX in normal JS files
endif

" Put local plugin configurations in this file
let $localfile=expand('~/.config/vim/plugins.vim')
if filereadable($localfile)
	source $localfile
endif

call vundle#end()

filetype plugin indent on
