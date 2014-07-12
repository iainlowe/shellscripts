alias add='git add'
alias st='git status'
alias ci='git commit -m'
alias diff='git diff'
alias d='git diff'
alias log='git log'
alias push='git push'
alias pull='git pull'

function _git_unload() {
	unalias add st ci diff d log push pull
}