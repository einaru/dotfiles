"
" Nvim configuration file
"
" Author: Einar Uvsløkk <einar.uvslokk@gmail.com>
" Source: https://github.com/einaru/dotfiles
"
if !exists('g:vscode')
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vim/vimrc
endif
