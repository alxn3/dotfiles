set -g fish_greeting

fish_add_path -m ~/.local/bin

if test (uname) = Darwin; and not ssh-add -l >/dev/null
    ssh-add --apple-load-keychain
end

if test -d /opt/homebrew
    /opt/homebrew/bin/brew shellenv | source
end

if status is-interactive
    function test_bin -a name
        if not type -q $name
            echo "$name not found!"
        end
        return $status
    end

    if test_bin starship
        set -gx STARSHIP_CONFIG $HOME/.config/starship/starship.toml
        starship init fish | source
    end
    test_bin zoxide; and zoxide init fish | source
    test_bin eza; and alias ls="eza --icons always"

    functions -e test_bin
end
