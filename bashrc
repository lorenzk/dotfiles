##### PROMPT #######################################################
if [ "$USER" == "root" ]; then
  PS1='\[\033[01;31m\]\Ah \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\[\033[01;32m\]\Ah \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

##### BASH #########################################################
alias be="bundle exec"
alias ducks="du -cks * | sort -nr | grep -v total | head -n 10"
alias ff="find . -name"
alias g=git
alias gb="git branch"
alias gd="git diff"
alias grep="grep --color=auto"
alias gs="git st"
alias hgrep="history | grep"
alias l="ls -lF --color=auto"
alias la="l -a"
alias less="less -R" # -R for colors
alias myip="curl icanhazip.com"
alias o=open
alias p=ping
alias psg="ps ax | grep -v grep | grep"
alias pw="ping web.de"
alias vim='mvim -v'

set -o vi

export EDITOR=vi
export HISTFILESIZE=10000
export PROMPT_COMMAND="history -a; history -n;${PROMPT_COMMAND}"
shopt -s histappend
export SPRING_TMP_PATH=/tmp


##### MAC ONLY #####################################################
if [ `uname` == "Darwin" ]; then
  alias l="ls -lFG"

  # bash completion
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  # path setup
  export PATH=./bin:~/bin:/usr/local/bin:$PATH:/usr/local/sbin
  CDPATH=".:~:~/Projekte"

  # rbenv
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

  # MacVim
  mvim() { (unset GEM_PATH GEM_HOME; command mvim "$@") }

  # Amazon EC2
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
  export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

  export EDITOR="mvim -f"
  export LEDGER=~/Projekte/dkb2ledger/private.ledger
fi