set PATH ~/bin $PATH

# autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

alias grep "grep --color=auto"
alias l "ls -oF"
alias la "l -a"
alias vi nvim

abbr be bundle exec
abbr ga git add
abbr gap git add -p
abbr gb git branch
abbr gc git commit
abbr gca git commit -a
abbr gcaa git commit -a --amend
abbr gcam git commit -am
abbr gcm git commit -m
abbr gco git checkout
abbr gcom git checkout master
abbr gcop git checkout -p
abbr gcp git cherry-pick
abbr gd git diff
abbr gdc git diff --cached
abbr glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr gmm git merge master
abbr gmt git mergetool
abbr gpl git pull
abbr gplr git pull --rebase
abbr gps git push
abbr gpsr git push redesign redesign:master
abbr gr git revert
abbr grpo git remote prune origin
abbr gs git status -sb
abbr gsh git stash
abbr gshp git stash pop
abbr gst git status -sb
abbr hpr hub pull-request
abbr rdm bin/rails db:migrate
abbr rdr bin/rails db:rollback

set -x EDITOR nvim
set -x MAKE "make --jobs 4"
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
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
fish_add_path /opt/homebrew/opt/openjdk/bin

source /opt/homebrew/opt/asdf/libexec/asdf.fish
fish_add_path /opt/homebrew/bin

direnv hook fish | source
