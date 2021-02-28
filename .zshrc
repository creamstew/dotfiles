# zsh補完機能
autoload -Uz compinit
compinit -u

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # 前と重複する行は記録しな
setopt share_history # 同時に起動したzshの間でヒストリを共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
setopt HIST_IGNORE_SPACE # 行頭がスペースのコマンドは記録しない
setopt HIST_IGNORE_ALL_DUPS # 履歴中の重複行をファイル記録前に無くす
setopt HIST_FIND_NO_DUPS # 履歴検索中、(連続してなくとも)重複を飛ばす

# マッチしたコマンドの履歴を表示
autoload history-search-end

zstyle ':completion:*:default' menu select=2 # 補完候補を ←↓↑→ でも選択出来るようにする
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # 補完候補がなければより曖昧に候補を探す。

setopt auto_cd # 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_pushd # cd -の後にタブ補完で下記のようにサジェストされる
setopt correct # コマンドのスペルチェックをする
setopt list_packed # 補完候補を詰めて表示
setopt nolistbeep # 補完候補表示時にビープ音を鳴らさない
setopt noautoremoveslash # ディレクトリ選択時、最後の/を残す
setopt hist_verify # 履歴を呼び出してから実行する間に一旦編集できる状態になる

typeset -U path cdpath fpath manpath # 重複パスを登録しない

# ##### ##### ##### ##### #####
# PATH
export PATH=$PATH:~/bin

# ##### ##### ##### ##### #####

export EDITOR="vim"

# ##### ##### ##### ##### #####
# Alias
setopt complete_aliases # aliasでも補完できるようにする

alias chrome="open -a /Applications/Google\ Chrome.app"

# ssh-agentをプロセス管理して自動立ち上げ
# シェル立ち上げ時にプロセスがなければ立ち上げる
# 立ち上げたプロセスの情報を ~/.ssh-agent ファイルに保存
# プロセスがあればそれを再利用
# ##### ##### ##### ##### #####
# ssh-agent
# eval `ssh-agent`
SSH_KEY_LIFE_TIME_SEC=3600 # 有効時間
SSH_AGENT_FILE=$HOME/.ssh-agent
test -f $SSH_AGENT_FILE && source $SSH_AGENT_FILE > /dev/null 2>&1
if [ $( ps -ef | grep ssh-agent | grep -v grep | wc -l ) -eq 0 ]; then
    ssh-agent -t $SSH_KEY_LIFE_TIME_SEC > $SSH_AGENT_FILE
    source $SSH_AGENT_FILE > /dev/null 2>&1
fi

# starship
eval "$(starship init zsh)"

# ruby
export RUBOCOP_OPTS='-D -E -S'
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
