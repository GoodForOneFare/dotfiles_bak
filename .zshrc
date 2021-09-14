# Prompt

if [[ -f /etc/zsh/zshrc.default.inc.zsh ]]; then
  . /etc/zsh/zshrc.default.inc.zsh
  . ./.zshrc_spin
elif [[ "$SPIN" == "1" ]]; then
  . ./.zshrc_spin_legacy
  export X_SPIN_HOST="$(echo $HOSTNAME | sed -r 's/-[0-9]*$//')"
  PROMPT='$X_SPIN_HOST %(?.%F{green}√.%F{red}?%?)%f %B%c%b $vcs_info_msg_0_ $ '
else
  . ./.zshrc_local
fi

alias vin='f() { vi $(find node_modules/$1 -name $2*) };f'

alias install_go='f() { wget https://golang.org/dl/go1.16.3.linux-amd64.tar.gz; rm -rf /usr/local/go; sudo tar -C /usr/local -xzf go1.16.3.linux-amd64.tar.gz; echo ''Add Go to your path: export PATH=\$PATH:/usr/local/go/bin'' };f'
alias clone_esbuild='f() { cd /src/github.com/shopify/web; git clone https://github.com/GoodForOneFare/esbuild.git; };f'
alias make_esbuild='f() { pkill -9 -f runner.ts; make; make platform-neutral; cp esbuild /src/github.com/shopify/web/spinx/node_modules/esbuild/bin/esbuild && cp npm/esbuild/lib/main.* /src/github.com/shopify/web/spinx/node_modules/esbuild/lib/; };f'

alias gs='git status'
alias gsh='git show HEAD'
alias grab='git rebase --abort'
alias grim='git rebase -i origin/master'
alias grc='git rebase --continue'
alias gdc='git diff --cached'
alias gss='f() { git stash show stash@{$1} }; f'
alias gbranches='git branch --sort=committerdate'
alias reset-yarn-lock='git reset yarn.lock && git co yarn.lock && yarn && git add yarn.lock'
alias lint="node_modules/.bin/eslint --format codeframe --no-cache"

export HISTFILE=/home/spin/.zsh_history
export HISTSIZE=1000
export SAVEHIST=5000

setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY