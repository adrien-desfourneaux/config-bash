function updateForceCLIUsername() {
  # allows to use Force.com username on prompt, if used
  export ForceCLIUsername=$(
    var=$(
      force whoami 2> /dev/null | grep Username;
      if [ "$?" == 0 ]; then echo ""; fi
    )
    echo ${var//Username: /}
  )
}

updateForceCLIUsername

function force() {
  case $1 in
    login|logout ) command force $@ && updateForceCLIUsername ;;
    * ) command force $@ ;;
  esac
}
