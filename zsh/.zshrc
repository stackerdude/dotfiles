export DISABLE_AUTO_TITLE='true'

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="robbyrussell"

export NVM_LAZY_LOAD=false
export NVM_COMPLETION=false
plugins=(zsh-nvm git)
source $ZSH/oh-my-zsh.sh

# Custom scipts
export PATH=~/.local/scripts:$PATH

# Alias
alias gpra="git pull --rebase --autostash"
alias vim=nvim
alias ts=tmux-sessionizer
# Helper Fucntions
pyclean() {
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}

# Terminal startup time
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

assume_role_by_name() {
  export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
    $(aws sts assume-role \
      --role-arn arn:aws:iam::722179877101:role/ci_runner \
      --role-session-name MySessionName \
      --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
      --output text))
}
# Source file if it exists
include() {
  [[ -f "$1" ]] && source "$1"
}

# Machine specifc config
include ".zshrc_specific"
