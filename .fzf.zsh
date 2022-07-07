export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--height 40% --reverse --tac --multi"
export FZF_COMPLETION_TRIGGER="'"

# use ag
_fzf_compgen_path() {
  ag -g "" "$1"
}

# exclude node_modules、bower_components
_fzf_compgen_dir() {
  command find -L "$1" \
  -name .git -prune -o -name .svn -prune \
  -o -path '*/node_modules' -prune \
  -o -path '*/bower_components' -prune \
  -o -type d \
  -a -not -path "$1" -print 2> /dev/null | sed 's@^\./@@'
}

# fim - open files with vim
fim() {
  local IFS=$'\n'
  local files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  local len=${#files[@]}
  [[ len -ge 3 ]] && len=3
  [[ -n "$files" ]] && vim -o"$len" "${files[@]}"
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -path '*/node_modules' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
