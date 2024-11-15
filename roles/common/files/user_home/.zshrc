# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/asdf-vm/asdf.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/.local/bin:/opt/cuda/bin:$PATH

export EDITOR=nvim

# File where history is saved
HISTFILE=~/.zsh_history
# Number of commands to save in the history file
HISTSIZE=10000
SAVEHIST=10000

# Move to the beginning of the line
bindkey "\e[H" beginning-of-line

# Move to the end of the line
bindkey "\e[F" end-of-line

bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# Enable keybinding for DEL to delete the character under the cursor
bindkey '\e[3~' delete-char
