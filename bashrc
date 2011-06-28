export PATH="/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin/:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=~/Library/Haskell/bin:$PATH
export PATH=~/.gem/ruby/1.8/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export APPENGINE_SDK_HOME=/opt/appengine-java-sdk-1.3.4

smiley_status() {
  j=`jobs`
  if [ -z "$j" ]; then
    export JOB_STATUS=" "
  else
    export JOB_STATUS="!"
  fi
  if [ $? = 0 ]; then
    export SMILEY="\001\033[0;32m\002⚡\001\033[0m\002"
  else
    export SMILEY="\001\033[31m\002☢\001\033[0m\002"
  fi
}

export PS1='\[\033[37m\]\w\[\033[1m\] ${JOB_STATUS} $(__git_ps1 " \[${COLOR_RED}\]%s$(evil_git_dirty)\[\033[1m\]")\n$(echo -ne $SMILEY) '
export LESS="-R"
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export EDITOR=vim
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR``
export JAVA_OPTS="-Dfile.encoding=UTF-8"
export RUBYOPT="rubygems"

verify_not_alias() {
	last=`history 1`
	aliases=`alias`
	ruby ~/p/dot-files/verify.rb "$aliases" "$last"
}

function evil_git_dirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo " *"
}

export PROMPT_COMMAND='smiley_status'

# readline settings
bind "set completion-ignore-case on" 
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

. /usr/local/git/contrib/completion/git-completion.bash 

# history (bigger size, no duplicates, always append):
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

