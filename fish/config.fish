# rbenv
status --is-interactive; and . (rbenv init -|psub)

# autojump
test -f /usr/local/share/autojump/autojump.fish; and . /usr/local/share/autojump/autojump.fish

alias vi nvim
alias l "ls -lF"
alias la "l -a"
alias grep "grep --color=auto"

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
