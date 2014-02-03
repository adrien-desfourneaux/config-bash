source "$HOME/.bash/git-prompt.sh" 

__has_parent_dir () {
    # Utility function so we can test for things like .git/.hg without firing
    # up a separate process
    test -d "$1" && return 0;

    current="."
    while [ ! "$current" -ef "$current/.." ]; do
        if [ -d "$current/$1" ]; then
            return 0;
        fi
        current="$current/..";
    done

    return 1;
}

__vcs_name() {
  if [ -d .svn ]; then
    echo "-[svn]";
  elif __has_parent_dir ".git"; then
    echo "-[$(__git_ps1 'git %s')]";
  elif __has_parent_dir ".hg"; then
    echo "-[hg $(hg branch)]"
  fi
}


function vagrant_status {
  local status=""
  if [ -f 'Vagrantfile' ]; then
    status="$(vagrant status | sed -n 3p | awk -F" +" '{print $2}')"
    status="$(echo $status)"
  fi
  [ "$status" != "" ] && echo "[vm $status]"
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

export PS1='\n\[$bold\]\[$black\][\[$dk_blue\]\@\[$black\]]-[\[$green\]\u\[$yellow\]@\[$green\]\h\[$black\]]-[\[$pink\]\w\[$black\]]\[\033[0;33m\]$(__vcs_name)\[\033[00m\]\[$lt_blue\]$(vagrant_status)\[$reset\]\n\[$reset\]\$ '
