# Prompt

# Keep it simple when Emacs is connecting

if [[ "$TERM" == "dumb" ]]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  if whence -w precmd >/dev/null; then
      unfunction precmd
  fi
  if whence -w preexec >/dev/null; then
      unfunction preexec
  fi
  PS1='$ '
  return
fi

# Interactive prompt

autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{200}[%b%u%c]%f'
zstyle ':vcs_info:*' enable git

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
alias nginx-update="erb fqdn="${SPIN_INSTANCE_FQDN}" ssl_certificate='/etc/nginx/ssl/tls.crt' ssl_certificate_key='/etc/nginx/ssl/tls.key' access_log='/dev/stdout' error_log='/dev/stderr' .spin/nginx.conf.erb > /etc/nginx/conf.d/nginx.conf"
alias find-tsserver-logs="find /home/spin/.vscode-server/data/logs/ |grep /tsserver\\\.log"
alias lint="node_modules/.bin/eslint --format codeframe --no-cache"
alias pr_url='echo "https://$(git config --get remote.origin.url | sed ''s/.\*github.com/github.com/'')/compare/$(git branch --show-current)?expand=1"'

export X_SPIN_HOST="$(echo $HOSTNAME | sed -r 's/-[0-9]*$//')"

PROMPT='$X_SPIN_HOST %(?.%F{green}√.%F{red}?%?)%f %B%c%b $vcs_info_msg_0_ $ '

export SAVEHIST=5000
export HISTSIZE=1000
export HISTFILE=/home/spin/.zsh_history
