alias hire='cd ~/Work/hire'
alias ls='ls -G'
alias ll='ls -lh'
alias lla='ls -lah'
alias ..='cd ..;'
alias ...='.. ..'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders$
alias top='top -o cpu'
alias vimrc="vim ~/.vimrc"

alias intellij='open -b com.jetbrains.intellij'
alias rubymine='open -b com.jetbrains.rubymine'

alias h='hoogle -n 20 --colour'

# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias r='rake'

alias gl='git pull'
alias gs='git status -sb'
alias glr='git pull --rebase'
alias glg='git lg'
alias gp='git push'
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -v'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gfo='git fetch origin'
alias gdi='git diff --staged'
alias gd='git diff'
alias gsp='git smart-pull' # From the git-smart gem, $ gem install git-smart
alias gsm='git smart-merge'
alias gsl='git smart-log'
alias gra='git reset; git clean -f; git checkout .'

alias days="git log --since='2 month ago' --author=damien | grep Date | awk '{print \$2, \$3, \$4}' | uniq"
alias my_work="git log --since='2 month ago' --date=short --author=damien --pretty=format:\"%ad\" | uniq"

alias ox="open *.xcodeproj || open iPhone/*.xcodeproj || open iPadPrototype/*.xcodeproj"
alias ea='vim ~/.aliases.sh && source ~/.aliases.sh'

function go () {
  PROJECT_DIRS="$HOME/p/mogen/projects $HOME/p/mogen/projects/oomph-build/mags $HOME/railscamp $HOME/p/mogen/kits $HOME/p"
  TEST1=`find $PROJECT_DIRS -maxdepth 1 | grep \/$1 | head -n 1`
  TEST2=`find $PROJECT_DIRS -maxdepth 1 | grep \/[^\/]*$1[^\/]* | head -n 1`
  if [ ! -n $TEST1 ]
  then
    cd $TEST1
  else
    cd $TEST2
  fi
}

function bo () {
  STARTS=`git branch | sed s/\*/\ / | sed s/^\ \ // | grep ^$1 | head -n 1`
  CONTAINS=`git branch | sed s/\*/\ / | sed s/^\ \ // | grep $1 | head -n 1`
  if [ ! -z $STARTS ]
  then
    git checkout $STARTS
  else 
    if [ ! -z $CONTAINS ]
    then
      git checkout $CONTAINS
    else
      echo "No branch found matching $1"
    fi
  fi
}

alias now='TZ=US/Pacific date && TZ=UTC date && TZ=Australia/Sydney date'

# Rails aliases
alias sc=script/console
alias sg=script/generate
alias sd=script/destroy
alias ss=script/server
 
alias hdocs="open ~/Library/Haskell/doc/index.html"

# Tmuxing
alias tmux="TERM=screen-256color-bce tmux"

