# list git branches with their descriptions
function branches() {
  branch=""
  branches=`git branch --list`
  while read -r branch; do
    clean_branch_name=${branch//\*\ /}
    description=`git config branch.$clean_branch_name.description`
    printf "%-15s %s\n" "$branch" "$description"
  done <<< "$branches"
}

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
    echo "[svn]";
  elif __has_parent_dir ".git"; then
    echo "[`__git_ps1 'git %s'`]";
  elif __has_parent_dir ".hg"; then
    echo "[hg `hg branch`]"
  fi
}
