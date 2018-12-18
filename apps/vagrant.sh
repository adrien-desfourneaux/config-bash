function vagrant_status {
  local status=""
  if [ -f 'Vagrantfile' ]; then
    status="`vagrant status | sed -n 3p | awk -F" +" '{print $2}'`"
    status="`echo $status`"
  fi
  [ "$status" != "" ] && echo "[vm $status]"
}
