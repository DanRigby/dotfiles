autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

git_prompt_info () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(%{$fg[green]%}$(parse_git_dirty)%{$fg[blue]%})%{$reset_color%}"
}

parse_git_dirty() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $(git status -s --ignore-submodules=dirty 2> /dev/null) ]]; then
    echo "%{$fg[red]%}${ref#refs/heads/}"
  else
    echo "%{$fg[green]%}${ref#refs/heads/}"
  fi
}


# This keeps the number of todos always available the right hand side of my
# command line. I filter it to only count those tagged as "+next", so it's more
# of a motivation to clear out the list.
todo(){
  if $(which todo.sh &> /dev/null)
  then
    num=$(echo $(todo.sh ls +next | wc -l))
    let todos=num-2
    if [ $todos != 0 ]
    then
      echo "$todos ✭"
    else
      echo ""
    fi
  else
    echo ""
  fi
}

directory_name(){
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

export PROMPT=$'%{$fg_bold[red]%}%m %{$fg[cyan]%}%c $(git_prompt_info) '
set_prompt () {
  export RPROMPT="%{$reset_color%} %{$fg_bold[yellow]%}$(todo)%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
