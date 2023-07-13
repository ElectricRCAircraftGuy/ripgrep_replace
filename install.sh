#!/usr/bin/env bash

# This file is part of ElectricRCAircraftGuy/ripgrep_replace:
# https://github.com/ElectricRCAircraftGuy/ripgrep_replace

# ==================================================================================================
# User parameters
# vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv START vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

# I use my initials here so I can run `rgr`, for instance, as either `rgr` *or* `gs_rgr`.
# Prefixing commands with my initials allows me to type my initials and then hit Tab twice
# to see all of my custom commands at once!
USER_PREFIX="gs_"

# Required dependencies
RG_DESIRED_VERSION="13.0.0"  # use latest from here: https://github.com/BurntSushi/ripgrep/releases
FZF_DESIRED_VERSION="0.38.0" # use latest from here: https://github.com/junegunn/fzf/releases
BAT_DESIRED_VERSION="0.22.1" # use latest from here: https://github.com/sharkdp/bat/releases

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ END ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



RETURN_CODE_SUCCESS=0
RETURN_CODE_ERROR=1

VERSION="0.1.0"
AUTHOR="Gabriel Staples"

# See my answer: https://stackoverflow.com/a/60157372/4561887
FULL_PATH_TO_SCRIPT="$(realpath "${BASH_SOURCE[-1]}")"
SCRIPT_DIRECTORY="$(dirname "$FULL_PATH_TO_SCRIPT")"
SCRIPT_FILENAME="$(basename "$FULL_PATH_TO_SCRIPT")"


cd "$SCRIPT_DIRECTORY"
mkdir -p ~/bin

rg_version="$(rg --version | head -n 1 | awk '{print $2}')"
if [  ]
echo "Installing 'rg' (ripgrep)..."
# See: https://github.com/BurntSushi/ripgrep#installation
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

echo "Installing 'rgf'..."


echo "Installing 'rgf2'..."
echo "Installing 'rgr'..."


. ~/.profile

echo "Done"


######## version sorting!: https://stackoverflow.com/a/4024263/4561887
