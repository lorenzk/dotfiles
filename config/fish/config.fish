set PATH $PATH (yarn global bin)
# rbenv
status --is-interactive; and source (rbenv init -|psub)

# autojump
test -f /usr/local/share/autojump/autojump.fish; and . /usr/local/share/autojump/autojump.fish

alias grep "grep --color=auto"
alias l "ls -oF"
alias la "l -a"
alias vi nvim

abbr be bundle exec
abbr gb git branch
abbr gco git checkout
abbr gd git diff
abbr gpl git pull
abbr gps git push
abbr gs git st

set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set fish_greeting
set fish_color_autosuggestion 586e75
set fish_color_command 93a1a1
set fish_color_comment 586e75
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end 268bd2
set fish_color_error dc322f
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host \x2do\x1ecyan
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 839496
set fish_color_quote 657b83
set fish_color_redirection 6c71c4
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_selection \x2d\x2dbackground\x3dpurple
set fish_color_status red
set fish_color_user \x2do\x1egreen
set fish_color_valid_path \x2d\x2dunderline
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
