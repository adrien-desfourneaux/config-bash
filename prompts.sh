black=`tput -Txterm setaf 0`
red=`tput -Txterm setaf 1`
green=`tput -Txterm setaf 2`
yellow=`tput -Txterm setaf 3`
dk_blue=`tput -Txterm setaf 4`
pink=`tput -Txterm setaf 5`
lt_blue=`tput -Txterm setaf 6`

bold=`tput -Txterm bold`
reset=`tput -Txterm sgr0`

# uses:
# apps/git.sh#__vcs_name
# apps/vagrant.sh#vagrant_status
export PS1='\n\[$bold\]\[$dk_blue\]\@ \[$green\]\u\[$yellow\]@\[$green\]\h\[$black\] \[$pink\]\w\[$black\] \[$reset\]\[$yellow\]$(__vcs_name)\[$lt_blue\]$(vagrant_status)\[\033[0;33m\]\[$reset\]\n\[$reset\]\$ '
