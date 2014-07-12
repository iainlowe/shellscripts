alias add='git add'
alias st='git status'
alias ci='git commit -m'
alias di='git diff'
alias log='git log'
alias push='git push'
alias pull='git pull'
alias tip='git log -n1 --oneline | cut -d" " -f1'

function _git_unload() {
	unalias add st ci di log push pull
}