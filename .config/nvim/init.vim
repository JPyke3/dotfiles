

if has ('nvim-0.5')
	source $HOME/.config/nvim/nightly/nightly.vim
else
	source $HOME/.config/nvim/plugs/plugins.vim
	source $HOME/.config/nvim/modules/coc.vim
	source $HOME/.config/nvim/themes/theme.vim
	source $HOME/.config/nvim/modules/nerdtree.vim
	source $HOME/.config/nvim/modules/ranger.vim
	source $HOME/.config/nvim/modules/fzf.vim
	source $HOME/.config/nvim/modules/powerline.vim
:endif
