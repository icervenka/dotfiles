# ==============================================================================
# ZSH CONFIG 
# ==============================================================================

# Setup config dirs ------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_CACHE="$HOME/.cache"

# Source other related files ---------------------------------------------------
[ -f  $XDG_CONFIG_HOME/zsh/aliases ] && source $XDG_CONFIG_HOME/zsh/aliases
[ -f  $XDG_CONFIG_HOME/zsh/exports ] && source $XDG_CONFIG_HOME/zsh/exports 
[ -f  $XDG_CONFIG_HOME/zsh/functions ] && source $XDG_CONFIG_HOME/zsh/functions 

# p10k setup -------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh options ------------------------------------------------------------------
HISTFILE=~/.zsh_history

setopt extendedglob autocd 
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# add brew to path -------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)" 

# zsh plugins ------------------------------------------------------------------
# Load antigen plugin
source $XDG_CONFIG_HOME/zsh/plugins/antigen.zsh

# Bundles from the default repo 
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle ael-code/zsh-colored-man-pages

# Themes
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# Configure plugins
# zsh-autosuggestions
bindkey ';2C' forward-word # shift + right arrow

# Load other plugins
source $XDG_CONFIG_HOME/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# FZF --------------------------------------------------------------------------
# source <(fzf --zsh)
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Zoxide -----------------------------------------------------------------------
eval "$(zoxide init zsh)"
alias cd="z"

# End of basic setup -----------------------------------------------------------
# Lines after this point are added by programs installed later

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

