#!/usr/bin/env bash

# GS see: https://github.com/junegunn/fzf/blob/master/ADVANCED.md#switching-between-ripgrep-mode-and-fzf-mode

# Switch between Ripgrep launcher mode (CTRL-R) and fzf filtering mode (CTRL-F)
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"

# Special options used below (added by GS):
# 
# --no-clear
#   Don't clear the screen after fzf exits.
#   This is an undocumented option. 
#   See: https://github.com/junegunn/fzf/blob/master/src/options.go#L2975-L2976
#   NB: to manually clear the screen when `fzf` exits, you can type the `clear` command.
# --layout=reverse-list
#   Order line numbers in matches in files from top to bottom, instead of the default bottom to top.
# --height=99%
#   Allows you to still scroll up and down in the terminal when fzf exits. If you allow the 
#   default height of 100%, then when exiting fzf with the `--no-clear` option, trying to scroll
#   up and down in the terminal with the arrow keys or mouse scroll wheel will scroll through 
#   the command history instead of scrolling the terminal up and down, which is pretty irritating. 
#   NB: to manually clear the screen when `fzf` exits, you can type the `clear` command.
#   - UPDATE: use `tput rmcup` or `printf '\033[?1049l'` at the end instead, to exit the alternate
#     screen buffer mode. 
#   - Update2: nevermind; that breaks the `--no-clear` option. Use the `--height=99%` option
#     instead.
#
IFS=: read -ra selected < <(
    FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$INITIAL_QUERY")" \
    fzf --ansi \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --disabled --query "$INITIAL_QUERY" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+clear-query+rebind(ctrl-r)" \
        --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($RG_PREFIX {q} || true)+rebind(change,ctrl-f)" \
        --prompt '1. Ripgrep> ' \
        --delimiter : \
        --header '╱ CTRL-R (Ripgrep mode) ╱ CTRL-F (fzf mode) ╱' \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --layout=reverse-list
        # --no-clear \
        # --height=99%
)

# Same as `printf '\033[?1049l'`; Exit the alternate screen buffer mode which captures the mouse
# scroll wheel and causes it to scroll through the command history instead of scrolling up and down
# in the terminal.
#
# tput rmcup
# tput rmcup; printf "\n"
# printf '\033[?1049l'

# [ -n "${selected[0]}" ] && vim "${selected[0]}" "+${selected[1]}"
# [ -n "${selected[0]}" ] && subl "${selected[0]}" #"+${selected[1]}"

# See my answer: https://stackoverflow.com/a/75891597/4561887
print_array() {
    # declare a local **reference variable** (hence `-n`) named `array_ref`
    # which is a reference to the first parameter passed in
    local -n array_ref="$1"

    for element in "${array_ref[@]}"; do
        printf "    %s\n" "$element"
    done
}

print_array_with_colon_separator() {
    # declare a local **reference variable** (hence `-n`) named `array_ref`
    # which is a reference to the first parameter passed in
    local -n array_ref="$1"

    i=0
    printf "  "
    for element in "${array_ref[@]}"; do
        if [ $i -ne 0 ]; then
            printf ":"
        fi

        printf "%s" "$element"
        
        i=$((i + 1))
    done
    printf "\n"
}

# Choose a text editor in which to open the selected file when you press Enter.
# editor="subl" # Sublime Text
# editor="vim"
# editor="micro"
editor="code" # Visual Studio Code

if [ -n "${selected[0]}" ]; then
    # Debugging: 
    # echo "selected array:"
    # print_array "selected"

    file="${selected[0]}"
    line="${selected[1]}"
    
    echo "Opening the following file and line in editor '$editor':"
    print_array_with_colon_separator "selected"
    
    # Open the selected file in the chosen editor
    if [ "$editor" = "code" ]; then
        # VS Code requires the --goto option to open a specific line
        echo "$editor --goto \"$file:$line\""
        $editor --goto "$file:$line"
    else
        # Other editors like vim, subl, etc. can just open the file and line directly
        echo "$editor \"$file\" +\"$line\""
        $editor "$file" +"$line"
    fi
fi

######### GS changed bat to cat above
      # --preview 'bat --color=always {1} --highlight-line {2}' \

      # --preview 'cat {1} {2}' \
