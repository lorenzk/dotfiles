source /usr/local/Cellar/fzf/(fzf --version | cut -f 1 -d ' ')/shell/key-bindings.fish

function fish_user_key_bindings
	fzf_key_bindings
end
