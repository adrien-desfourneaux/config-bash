alias ls='ls -FG' 
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias git-review='for hash in $(git log HEAD..FETCH_HEAD --reverse --pretty=%H); do git show $hash --pretty=medium --color=always | less -R; done'
eval "$(hub alias -s)"
