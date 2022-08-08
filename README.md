[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FElectricRCAircraftGuy%2Fripgrep_replace&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=views+%28today+%2F+total%29&edge_flat=false)](https://hits.seeyoufarm.com)

[>> Become my 1st Sponsor on GitHub <<](https://github.com/sponsors/ElectricRCAircraftGuy)


# Table of Contents
<details>
<summary><b>(click to expand)</b></summary>
<!-- MarkdownTOC -->

1. [Help needed](#help-needed)
1. [ripgrep_replace \(`rgr`\)](#ripgrep_replace-rgr)
1. [ripgrep_fuzzyfinder \(`rgf`\)](#ripgrep_fuzzyfinder-rgf)
1. [Other, very-useful repos:](#other-very-useful-repos)
1. [Status](#status)
1. [Installation](#installation)
1. [How to clone this repo and all git submodules](#how-to-clone-this-repo-and-all-git-submodules)

<!-- /MarkdownTOC -->
</details>


<a id="help-needed"></a>
# Help needed

I need some testers on Mac and Windows! If you have those operating systems, please get this script running and document how you did it in a new Issue on this repo. I can then add your instructions to the "Installation" section in this readme, below.

- [x] test on Linux Ubuntu
- [ ] test on MacOS
- [ ] test on Windows


<a id="ripgrep_replace-rgr"></a>
# ripgrep_replace (`rgr`)

ripgrep_replace, or `rgr`, is a light-weight wrapper around [ripgrep](https://github.com/BurntSushi/ripgrep) (`rg`), supporting 100% of ripgrep's features + adding `-R` to enable on-disk find-and-replace!

Finally, we can use ripgrep, the world's fastest grep (regular expression search) tool to do rapid code refactoring via find-and-replace name changes from the command-line!

The Ripgrep author [says here](https://github.com/BurntSushi/ripgrep/issues/74#issuecomment-1191336022):

> I am _never_ going to add this [replace in files] to ripgrep. It isn't happening.
> 
> Normally I would lock this issue. But folks are still posting helpful content about other approaches. So I'm going to leave this open, but I'm going to mark comments asking for this to be in ripgrep as off topic.
> 
> There is no hope. It will never happen. Final decision.

Ripgrep_replace's primary purpose, therefore, is to add "replace in files" to ripgrep via the `-R` option. See `rgr -h` for details.


<a id="ripgrep_fuzzyfinder-rgf"></a>
# ripgrep_fuzzyfinder (`rgf`)

todo


<a id="other-very-useful-repos"></a>
# Other, very-useful repos:
1. My [eRCaGuy_dotfiles](https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles) repo.
1. My [eRCaGuy_hello_world](https://github.com/ElectricRCAircraftGuy/eRCaGuy_hello_world) repo.


<a id="status"></a>
# Status

Both `rgr` and `rgf` are done and fully implemented and work well. 


<a id="installation"></a>
# Installation

todo


<a id="how-to-clone-this-repo-and-all-git-submodules"></a>
# How to clone this repo and all git submodules

This repo contains [Git Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules), which simply means that this is a git repo which contains other git repos. 

So, **to clone this repo plus all sub-repos (git submodules)**, you must do the following:
```bash
# Clone this repo
git clone https://github.com/ElectricRCAircraftGuy/ripgrep_replace.git
# Recursively clone and update all subrepos (git submodules) it may contain
git submodule update --init --recursive
```

**To update this repo:**
```bash
# Update the main repo by pulling the latest from upstream
git pull
# Recursively update all git submodules (use the same cmd as previously above)
git submodule update --init --recursive
```

Note: if you ever need **to add a repo as a submodule inside another repo:**
```bash
# General format
git submodule add URL_to_repo

# Ex:
git submodule add https://github.com/ElectricRCAircraftGuy/ripgrep_replace.git
```

For more on git submodules, see the `= git submodules: =` section of my "git & Linux cmds doc" notes in my [eRCaGuy_dotfiles](https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles) repo here: [eRCaGuy_dotfiles/git & Linux cmds, help, tips & tricks - Gabriel.txt](https://github.com/ElectricRCAircraftGuy/eRCaGuy_dotfiles/blob/master/git%20%26%20Linux%20cmds%2C%20help%2C%20tips%20%26%20tricks%20-%20Gabriel.txt).


