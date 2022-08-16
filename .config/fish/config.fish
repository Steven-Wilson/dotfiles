set fish_greeting
set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'


if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx fish_greeting
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    alias pw='pass show -c'
    alias ls='ls -lh'
end


function fish_prompt
    set_color blue
    printf "👤 %s " "$USER"
    set_color purple
    printf "💻 %s " "$HOSTNAME"
    set_color green
    printf "📂 %s " (prompt_pwd)
    echo ""
    set_color white
    set GIT_RESPONSE (git branch 2> /dev/null | grep "\*" | cut -b 3-)
    if test "$GIT_RESPONSE" = ""
        printf " ┗━┥ "
    else
        printf " ┣━┥⎇  %s" "$GIT_RESPONSE"
        echo ""
        printf " ┗━┥ "
    end
end


if test -f $HOME/.config/fish/local.fish
    source $HOME/.config/fish/local.fish
end

