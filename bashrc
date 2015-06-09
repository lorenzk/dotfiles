##### PROMPT #######################################################
if [ "$USER" == "root" ]; then
  PS1='\[\033[01;31m\]\Ah \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\[\033[01;32m\]\Ah \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

if [ $(which nvim) ]; then
  export EDITOR=nvim
else
  export EDITOR=vi
fi

##### BASH #########################################################
alias RAD='RAILS_ENV=development'
alias RAP='RAILS_ENV=production'
alias RAS='RAILS_ENV=staging'
alias RAT='RAILS_ENV=test'
alias b2dinit='$(boot2docker shellinit)'
alias be='bundle exec'
alias dc='docker-compose'
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
alias p="ping -c 10 -i 0.1"
alias psg="ps ax | grep -v grep | grep"
alias pw="ping -c 10 -i 0.1 web.de"
alias s=spring
alias timer='echo Stop timer with CTRL-D && date && time cat && date'
alias vi=$EDITOR
alias wififix='sudo ifconfig en0 down && sleep 1 && sudo ifconfig en0 up'

export HISTFILESIZE=10000
shopt -s histappend
export SPRING_TMP_PATH=/tmp


##### MAC ONLY #####################################################
if [ `uname` == "Darwin" ]; then
  alias l="ls -lFG"
  alias bu='brew update; brew upgrade --all; brew cleanup';# brew doctor'

  # bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # path setup
  export PATH=~/bin:./node_modules/.bin:/usr/local/bin:$PATH:/usr/local/sbin
  CDPATH=".:~:~/Projekte"

  # Amazon EC2
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
  export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
  export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"

  export LEDGER=~/Projekte/dkb2ledger/private.ledger
fi
