# exec bash

alias ls='ls -F'
alias sgpt='/Applications/snap/bin/gpt'
# alias python='/usr/local/Caskroom/miniforge/base/bin/python'
# alias pip='pip3'

PATH="$PATH:/Applications/snap/bin"
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# disable creation of __pycache__
export PYTHONDONTWRITEBYTECODE=1

# Colored prompt
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
    }
COLOR_DEF='%f'
COLOR_USR='%F{14}'
COLOR_DIR='%F{123}'
COLOR_GIT='%F{14}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
# export PROMPT='${COLOR_USR}%n@${COLOR_DIR}%d ${COLOR_GIT}$(git_branch)${COLOR_DEF}${NEWLINE}%% '
export PROMPT='${COLOR_DEF}%d ${COLOR_DEF}$(git_branch)${COLOR_DEF}${NEWLINE}%% '

# Set fzf -> ripgrep (include dotfiles but exclude .git)
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden -g !.git/'
  # export FZF_DEFAULT_OPTS='-m --height 80% --border'
fi

# Call fzf -> dirs -> tmux session
bindkey -s ^f 'tmux-sessionizer^M'

# Call fzf -> files -> vim
# source:https://stackoverflow.com/a/65375231/2571881
# ~/.dotfiles/zsh/autoload/vif
function vif() {
    local fname
    local current_dir=$PWD
    # cd ~/dotfiles
    fname=$(fzf) || return
    vim "$fname"
    cd $current_dir
}
# https://jdhao.github.io/2019/06/13/zsh_bind_keys/
bindkey -s '^o' 'vif^M'

# ===== CONDA STUFF ===== #

# source '/Users/fspaolo/anaconda3/etc/profile.d/conda.sh'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fspaolo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fspaolo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fspaolo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fspaolo/google-cloud-sdk/completion.zsh.inc'; fi

# ========== #

# So tmux carries over all environment-specific paths
[[ -z $TMUX ]] || conda deactivate; conda activate base
