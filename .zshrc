ZSH_THEME="agnoster"

# NB: find /usr/share/terminfo -type f -name "*256color"
# export TERM=screen.putty-256color
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

alias gjj="printf '\nBranches:\n' && git --no-pager branch -vv && printf '\nWorktrees:\n' && git --no-pager worktree list && printf '\n'"
alias gnp="git --no-pager"
# git config --global rerere.enabled true
alias grd="git rerere diff"
# alias kb="kubectl"

# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro

declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  spd-say "'$val' session done"
  fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"
