# Prompt
PS1="\w$ "  
function _update_ps1() {
       export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# Ssh Private Key Add
ssh-add

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$PATH:/usr/local/lib/node_modules/bin
export PATH=$PATH:/Users/iparipsa/.lein

GPG_TTY=`tty`
export GPG_TTY

# commonly used dirs
alias rea='cd ~/BOK/Work/Projects/REA'
alias proj='cd ~/BOK/Work/Projects'
alias condor='cd ~/BOK/Work/Projects/REA/condor'
alias aca='cd ~/BOK/Work/Projects/REA/accepted-contracts-adapter'

# git
alias g='git status'
alias gd='git diff'
alias gp='git pull --rebase'

# ruby
alias b='bundle'
alias be='bundle exec'

# chruby
source /usr/local/share/chruby/chruby.sh
chruby 2.0.0-p353
source '/usr/local/share/chruby/auto.sh'

# rea-ec2
alias rssh=rea-ec2-ssh
alias rli=rea-ec2-list-instances

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home" 
export PATH=$JAVA_HOME/bin:$PATH 

# z
. `brew --prefix`/Cellar/z/1.8/etc/profile.d/z.sh

