function updateForceCLIUsername() {
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

chrome_app() {
    open -na Google\ Chrome --args --user-data-dir=$1 --app=$2 > /dev/null 2>&1
}

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
