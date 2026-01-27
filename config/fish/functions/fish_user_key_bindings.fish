function fish_user_key_bindings
    # Try common FZF paths: Homebrew (macOS), then Linux locations
    for fzf_path in /opt/homebrew/opt/fzf/shell/key-bindings.fish \
                    /usr/share/fzf/key-bindings.fish \
                    /usr/share/doc/fzf/examples/key-bindings.fish
        if test -f $fzf_path
            source $fzf_path
            fzf_key_bindings
            return
        end
    end
end
