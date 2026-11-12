# Git & make aliases
alias gpn='git push --no-verify'
alias gpnf='git push --no-verify --force'
alias gchore='git add station && git commit -m "chore: update"'
alias fmt='make format && make mypy'
alias bump-migrations='make migrations && git add station && git commit -m "chore: bump migrations"'
