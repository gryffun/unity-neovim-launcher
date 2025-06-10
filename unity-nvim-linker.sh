#!/bin/sh

SCRIPT="$1"
LINE="$2"

SERVER="/tmp/nvim-pipe"  # Unix-style pipe path for Neovim

if [ -e "$SERVER" ]; then
    nvim --server "$SERVER" --remote-send "<Cmd>tabnew $SCRIPT | $LINE<CR>"
else
    # Start a new instance if no server is found
    # Replace konsole with your preferred CLI
    konsole --hold -e bash -c "nvim --listen $SERVER '$SCRIPT' +$LINE"

fi
