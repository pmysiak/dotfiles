#!/usr/bin/zsh

#
# To get app_id, class or instance name of window run
#
# swaymsg -t get_tree
#



get_output_model() {
    echo `swaymsg -t get_outputs | jq -r '.[] | select(.focused == true) | .model'`
}

setup_home() {
    # Workspace 1
    swaymsg "workspace 1; layout stacking"
    
    ~/.config/sway/sway-toolwait --waitfor Alacritty -- alacritty -e zsh -ic "vpn; exec zsh"
    
    sleep 5
    
    ~/.config/sway/sway-toolwait --waitfor geany -- geany
    ~/.config/sway/sway-toolwait --waitfor firefox -- firefox
    ~/.config/sway/sway-toolwait --waitfor Slack -- slack

    sleep 3

    # Workspace 2
    swaymsg "workspace 2"
    
    ~/.config/sway/sway-toolwait --waitfor Google-chrome -- google-chrome

    sleep 3

    # Workspace 3
    swaymsg "workspace 3; layout tabbed"

    ~/.config/sway/sway-toolwait --waitfor jetbrains-phpstorm --count 2 -- phpstorm ~/projects/diggysadventure
    ~/.config/sway/sway-toolwait --waitfor Alacritty -- alacritty -e zsh -ic "j di; exec zsh"
    ~/.config/sway/sway-toolwait --waitfor Postman -- postman
}

setup_office() {
    # Workspace 1
    swaymsg "workspace 1; layout stacking"
    
    ~/.config/sway/sway-toolwait --nocheck --waitfor Alacritty -- alacritty -e zsh -ic "vpn; exec zsh"
    sleep 3
    
    ~/.config/sway/sway-toolwait --nocheck --waitfor geany -- geany
    ~/.config/sway/sway-toolwait --nocheck --waitfor Slack -- slack

    ~/.config/sway/sway-toolwait --nocheck --waitfor firefox -- firefox
    swaymsg '[app_id="firefox"] move left'
    
    sleep 1
    
    # Workspace 2
    swaymsg "workspace 2"
    
    ~/.config/sway/sway-toolwait --nocheck --waitfor Google-chrome -- google-chrome

    sleep 1

    # Workspace 3
    swaymsg "workspace 3"

    ~/.config/sway/sway-toolwait --nocheck --waitfor Alacritty -- alacritty -e zsh -ic "j di; exec zsh"
    ~/.config/sway/sway-toolwait --waitfor jetbrains-phpstorm --count 2 -- phpstorm ~/projects/diggysadventure
    ~/.config/sway/sway-toolwait --nocheck --waitfor Postman -- postman
}

model=$(get_output_model)

if [[ "$model" == "DELL U2415" ]]; then
    setup_home
else 
    setup_office
fi
