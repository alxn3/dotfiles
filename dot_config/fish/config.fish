set -g fish_greeting

fish_add_path -m ~/.local/bin

if status is-interactive
    if type -q starship
        set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
        starship init fish | source
    else
        echo "starship not found!"
    end
    type -q zoxide; and zoxide init fish | source; or echo "zoxide not found!"
    if type -q eza
        alias ls="eza --icons always"
    end
end
