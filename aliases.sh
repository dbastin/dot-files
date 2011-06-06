alias ls='ls -G'
alias ll='ls -lh'
alias lla='ls -lah'
alias ..='cd ..;'
alias ...='.. ..'
alias ducks='du -cks * | sort -rn|head -11' # Lists the size of all the folders$
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'

alias intellij='open -b com.jetbrains.intellij'
alias rubymine='open -b com.jetbrains.rubymine'

alias h='hoogle -n 20 --colour'
alias hdoc_index=''

function hdoc() {
  if [ $1 ]
  then
    shopt -s nocaseglob
    DOCS=`find ~/Library/Haskell/ghc-*/lib/${1}*/doc/html/index.html 2> /dev/null`
    shopt -u nocaseglob
    if [ -z $DOCS ]
    then
      echo "no docs"
    else
      open $DOCS
    fi
  else
    open ~/Library/Haskell/doc/index.html
  fi
}


# useful command to find what you should be aliasing:
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

alias pp="cd '/Users/nkpart/Library/MobileDevice/Provisioning Profiles'"

alias r='rake'

alias mogen='ssh nick@mogeneration.com'

alias sql="echo Okay idjit, it goes like this:
echo CREATE TABLE tablename \(id INTEGER, name VARCHAR\)
echo SELECT row FROM tablename WHERE condition
echo INSERT INTO tablename \(column1, column2\) VALUES \(value1, value2\)
echo UPDATE tablename SET column1 = value1 WHERE condition
"

alias foo="echo \$2 \$1"

 
alias report_success="if [$? -eq 0]; then say \"cool cool cool\"; else say \"oh dear\"; fi"

function to_ipod() {
   VAL="HandBrakeCLI -i ${1} -o ${1}.mp4 --preset=\"iPhone & iPod Touch\""
   echo $VAL
   sh -c $VAL
}


alias gl='git pull'

alias gst='git status -sb'
alias glr='git pull --rebase'
# alias glg='git log --oneline --decorate'
alias glg='git lg'
alias gsu='git submodule update'

alias gp='git push'
alias gpa='git push-all' # see [alias] in ~/.gitconfig
alias ga='git add'
alias gaa='git add -A'
alias gc='git commit -v'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'

alias gitx="open -b nl.frim.GitX"
alias gm='git merge --no-ff'
alias gfo='git fetch origin'
alias gdi='git diff --staged'
alias gd='git diff'

alias gsp='git smart-pull'

alias greview='git log --reverse -p production..master -- app db'

alias m=mvim

alias ox="open *.xcodeproj || open iPhone/*.xcodeproj || open iPadPrototype/*.xcodeproj"
alias ea='mvim -f ~/p/dot-files/aliases.sh && source ~/p/dot-files/aliases.sh'
alias deps='mate ~/.babushka/deps'

alias gist="open http://gist.github.com"

alias days="git log --since='2 month ago' --author=nkpart | grep Date | awk '{print \$2, \$3, \$4}' | uniq"

alias my_work="git log --since='2 month ago' --date=short --author=nkpart --pretty=format:\"%ad\" | uniq"

function go () {
  PROJECT_DIRS="$HOME/p/mogen/projects $HOME/p/mogen/projects/oomph-clients $HOME/railscamp $HOME/p/mogen/kits $HOME/p"
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

alias make_six='sed -i "" "s,<integer>5</integer>,<integer>6</integer>," Resources/Info.plist'
alias make_six_qa='sed -i "" "s,<integer>5</integer>,<integer>6</integer>," Resources/Info-QA.plist'

# Rails aliases
alias sc=script/console
alias sg=script/generate
alias sd=script/destroy
alias ss=script/server
alias sgns="script/generate nifty_scaffold --rspec --haml"
alias sdns="script/destroy nifty_scaffold --rspec --haml"
alias db='mysql -u root oompf_development'
 
alias hdocs="open ~/Library/Haskell/doc/index.html"

alias gok='pushd ~/.kit && git pull && popd'
alias goku='gok && git pull && kit update'

alias sr='screen -r'
