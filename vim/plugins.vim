" ==== Plugins ============================================================== "

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
	" Python
	Plugin 'hynek/vim-python-pep8-indent'
	Plugin 'nvie/vim-flake8'

	" Web
	Plugin 'othree/html5.vim'
	Plugin 'pangloss/vim-javascript'
	Plugin 'mxw/vim-jsx'
	let g:jsx_ext_required = 0  " Allow JSX in normal JS files
endif

if count(g:enabled_plugins, 'local')
	Plugin 'file:///mnt/data/src/einaru/vim-gnome-dev/'
endif

call vundle#end()

filetype plugin indent on
