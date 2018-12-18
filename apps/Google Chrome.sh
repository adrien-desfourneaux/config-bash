chrome_app() {
  open -na Google\ Chrome --args --user-data-dir=$1 --app=$2 > /dev/null 2>&1
}
