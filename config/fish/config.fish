set PATH ~/bin $PATH

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
abbr gcom git checkout main
abbr gcop git checkout -p
abbr gcp git cherry-pick
abbr gd git diff
abbr gdc git diff --cached
abbr gdm git diff main
abbr gdt git difftool
abbr glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr gmm git merge main
abbr gmt git mergetool
abbr gpl git pull
abbr gplr git pull --rebase
abbr gps git push
abbr gr git revert
abbr grpo git remote prune origin
abbr gs git status -sb
abbr gsh git stash
abbr gshp git stash pop
abbr gst git status -sb
abbr gsw git switch
abbr hpr hub pull-request
abbr rdm bin/rails db:migrate
abbr rdr bin/rails db:rollback
abbr rt "bin/rails test; beep"

set -x EDITOR nvim
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

# ===== Cross-platform tool initialization =====
fish_add_path /Users/lorenz/.local/bin

if type -q direnv
    direnv hook fish | source
end

if type -q zoxide
    zoxide init fish | source
end

if status is-interactive
    if type -q atuin
        atuin init fish --disable-up-arrow | source
    end
end

# ===== macOS-specific settings =====
if test (uname) = "Darwin"
    # iTerm2 integration
    test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

    # Homebrew paths
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/openjdk/bin
    fish_add_path /opt/homebrew/opt/postgresql@16/bin
    fish_add_path (brew --prefix python)/libexec/bin

    # Bun (desktop dev only)
    set -gx BUN_INSTALL "$HOME/.bun"
    fish_add_path $BUN_INSTALL/bin

    # Added by Antigravity
    fish_add_path /Users/lorenz/.antigravity/antigravity/bin

    # Claude Code Orchestrator
    alias wt='~/.claude/scripts/wt.sh'
    alias workers='~/.claude/scripts/orchestrator.sh'
    alias orchestrator-start='~/.claude/scripts/orchestrator-loop.sh &'
    alias orchestrator-stop='~/.claude/scripts/orchestrator-stop.sh'
    alias orchestrator-status='~/.claude/scripts/orchestrator-status.sh'
    alias claude-orchestrator='~/.claude/scripts/claude-orchestrator'
end

