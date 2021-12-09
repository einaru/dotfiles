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
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!
let g:goyo_linenr = 1
nmap <leader>g :Goyo<cr>
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:vimtex_fold_enabled = 0
let g:vimtex_complete_bib_simple = 1
Plug 'preservim/vim-wordy'
Plug 'junegunn/vim-easy-align'

" Cosmetics:
Plug 'NLKNguyen/papercolor-theme'
Plug 'connorholyday/vim-snazzy'
Plug 'airblade/vim-gitgutter'
set updatetime=200

" Markup Languages:
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_folding_disabled = 1
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
Plug 'aklt/plantuml-syntax'
Plug 'alvan/vim-closetag'
let g:closetag_filetype = 'xml,html'

" Development:
Plug 'editorconfig/editorconfig-vim'
Plug 'mesonbuild/meson', {'rtp': 'data/syntax-highlighting/vim'}
Plug 'sbdchd/neoformat'
let g:neoformat_run_all_formatters = 1
let g:neoformat_enabled_python = ['black', 'isort']
nmap <f6> :Neoformat<cr>

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'psf/black', {'for': 'python'}

" Go
"Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Kotlin
Plug 'udalov/kotlin-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'posva/vim-vue'
let g:vue_pre_processors = ['scss']

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" HTML and CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'

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
