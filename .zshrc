if [[ -f /etc/zsh/zshrc.default.inc.zsh ]]; then
  . /etc/zsh/zshrc.default.inc.zsh
  . ./.zshrc_spin
elif [[ "$SPIN" == "1" ]]; then
  . ./.zshrc_spin_legacy
else
  . ./.zshrc_local
fi

alias vin='f() { vi $(find node_modules/$1 -name $2*) };f'

alias gdc='git diff --cached'
alias grab='git rebase --abort'
alias grim='git rebase -i origin/master'
alias grc='git rebase --continue'
alias gs='git status'
alias gsh='git show HEAD'
alias gss='f() { git stash show stash@{$1} }; f'
alias gbranches='git branch --sort=committerdate'
alias lint="node_modules/.bin/eslint --format codeframe --no-cache"
alias reset-yarn-lock='git reset yarn.lock && git co yarn.lock && yarn && git add yarn.lock'
