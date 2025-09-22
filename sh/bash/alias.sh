alias cs=clear
alias bt='batcat'
alias n='nvim'

alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias amend_push='git add --all && git commit --amend --no-edit && git push -f'

alias dfrmt='dart format .'
alias get_build='flutter pub get && dart run build_runner build --delete-conflicting-outputs'
