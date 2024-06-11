if status is-interactive
    set fish_greeting

    alias ls 'ls --color=auto'
    alias grep 'grep --color=auto'

    alias l 'ls -Flahg'

    # I don't (can't) even use Spotify-tui but this is for when I can
    alias spt '~/bin/launchspt' 

    # View images in the terminal
    alias icat 'kitty +kitten icat'

    # The better ssh experience
    alias ssh 'kitty +kitten ssh'

    # we want to run the light command without sudo
    alias light-passwdless '/usr/sbin/light'

    # Spice up the sl command a bit
    alias sl "sl -acdGw15"

    alias loc "cloc *"

    # Add the ~/bin folder to the path so we can execute user-made scripts
    set -x PATH "/home/magic/bin:$PATH"
    set -x PATH "$JAVA_HOME/bin:$PATH"
    set -x LD_LIBRARY_PATH "/usr/local/lib:$LD_LIBRARY_PATH"

    # Make the cow recite a random Will Wood quote when we open the terminal
    # icat --align=left ~/Downloads/output_180x180.png
    # Random-Will-Wood-Quote | cowsay | lolcat

    # Someone said this would be funny
    alias pls "sudo"

    alias zbr "zig build run"
    alias zbt "zig build test"

    set -x CFLAGS "-Wall -Wextra -g -pedantic -fsanitize=address"
    set -x CC "gcc"

    set -gx EDITOR nvim
    set -gx TERM xterm-kitty
    set -gx JAVA_HOME "/usr/lib/jvm/default/"

    fish_config theme choose Base16\ Default\ Dark

    export DEBUGINFOD_URLS="https://debuginfod.archlinux.org" 
    export LANG=en_US.UTF-8
end

fish_add_path /home/magic/.spicetify

# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx -- vt1 &> /dev/null
