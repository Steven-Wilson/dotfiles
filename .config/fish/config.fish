#source ~/venv/bin/activate.fish
set -g fish_greeting

function fish_prompt -d "write out the prompt"
    printf '%s%s%s > ' \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

source ~/venv/bin/activate.fish

set PATH "$PATH:$HOME/.emacs.d/bin"

alias d4="roll d4"
alias d6="roll d6"
alias d8="roll d8"
alias d10="roll d10"
alias d12="roll d12"
alias d20="roll d20"

alias 2d4="roll 2d4"
alias 2d6="roll 2d6"
alias 2d8="roll 2d8"
alias 2d10="roll 2d10"
alias 2d12="roll 2d12"
alias 2d20="roll 2d20"

alias 3d4="roll 3d4"
alias 3d6="roll 3d6"
alias 3d8="roll 3d8"
alias 3d10="roll 3d10"
alias 3d12="roll 3d12"
alias 3d20="roll 3d20"

alias 4d4="roll 4d4"
alias 4d6="roll 4d6"
alias 4d8="roll 4d8"
alias 4d10="roll 4d10"
alias 4d12="roll 4d12"
alias 4d20="roll 4d20"

alias 5d4="roll 5d4"
alias 5d6="roll 5d6"
alias 5d8="roll 5d8"
alias 5d10="roll 5d10"
alias 5d12="roll 5d12"
alias 5d20="roll 5d20"

alias 6d4="roll 6d4"
alias 6d6="roll 6d6"
alias 6d8="roll 6d8"
alias 6d10="roll 6d10"
alias 6d12="roll 6d12"
alias 6d20="roll 6d20"

alias 7d4="roll 7d4"
alias 7d6="roll 7d6"
alias 7d8="roll 7d8"
alias 7d10="roll 7d10"
alias 7d12="roll 7d12"
alias 7d20="roll 7d20"

alias 8d4="roll 8d4"
alias 8d6="roll 8d6"
alias 8d8="roll 8d8"
alias 8d10="roll 8d10"
alias 8d12="roll 8d12"
alias 8d20="roll 8d20"

alias 9d4="roll 9d4"
alias 9d6="roll 9d6"
alias 9d8="roll 9d8"
alias 9d10="roll 9d10"
alias 9d12="roll 9d12"
alias 9d20="roll 9d20"

alias 10d4="roll 10d4"
alias 10d6="roll 10d6"
alias 10d8="roll 10d8"
alias 10d10="roll 10d10"
alias 10d12="roll 10d12"
alias 10d20="roll 10d20"

alias vim="nvim"
alias vi="nvim"


