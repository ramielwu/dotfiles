# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -- Explanation of This zshrc file --
# Explanation of Categories: '# -- name --' used for main categories e.g. '# -- Config & Dotfiles --'.
# Main categories can have smaller categories, e.g. '# -- Config & Dotfiles --', there is sub-category named '# Vim'.
# Almost everything on zshrc has its own category, some of them have explanation when needed. 
# Assumation: if you use that zshrc file, you atleast know basic terminal usage and zsh-scripting basics.
# I tried to make this zshrc file clear as possible without making it hard to use.
# When creating function sub-category inside of a main category, i used this format: '# Functions of <main category name>'

# -- Required packages --
# lsd
# ranger
# zsh
# vim
# nvim 
# gcc
# python3
# arduino-cli
# Docker: Docker version 29.1.3, build 29.1.3-0ubuntu3~24.04.2
# ani-cli

# Media
alias ani="ani-cli"
alias webinvidious="nohup vieb "https://inv.nadeko.net" >/dev/null 2>&1 &"

# -- Hosting --
#alias upsearx="cd ~/searxng && docker-compose up -d"
#alias downsearx="cd ~/searxng && docker-compose down"

#alias upindivious="cd ~/indivious && docker-compose up -d"
#alias downindivious="cd ~/indivious && docker-compose down"

# Searxng
alias upsearx="cd ~/hosting/searxng/ && (echo -e '\n\n\n--- Searxng started: $(date) ---' && docker-compose up -d) &>> ~/hosting/searxng/logs.txt"
alias downsearx="cd ~/hosting/searxng/ && (echo -e '\n\n\n--- Searxng Stopped: $(date) ---' && docker-compose down) &>> ~/hosting/searxng/logs.txt"

# -- System -- 
alias l="lsd -Ath --blocks name,size,date"
alias lc="lsd -Ath --blocks name,size,permission"
alias lcl="lsd -Ath --blocks name,permission"
alias lclc="lsd -Ath --blocks name,size,date,permission"
alias cl="clear"
alias ran="ranger"
alias cdb="cd .."
alias xdgopen="xdg-open"
alias reload-zsh="source ~/dotfiles/zsh/.zshrc"
alias cpuschedutil="sudo cpupower frequency-set -g schedutil"
alias cpuperformance="sudo cpupower frequency-set -g performance"
alias cpupowersave="sudo cpupower frequency-seet -g powersave"
alias bat="batcat"

# Linux packages

# Functions
sedc() {
  sed -i "s/$1/$2/g" "$3"
}


# -- Config & Dotfiles --
# Vim
alias vzshrc="vi ~/dotfiles/zsh/.zshrc"
alias vi3config="vi ~/.config/i3/config"
alias vconfig="vi ~/dotfiles/vim/.vimrc"
alias vpicomconfig="vi ~/dotfiles/picom/.config/picom/picom.conf"
alias vpolybarconfig="vi ~/dotfiles/polybar/.config/polybar/config.ini"
alias vroficonfig="vi ~/dotfiles/rofi/.config/rofi/config.rasi"
alias vtmuxconfig="vi ~/dotfiles/tmux/tmux.conf"
alias vxprofileconfig="vi ~/dotfiles/x11/.xprofile"
alias vxresourcesconfig="vi ~/dotfiles/x11/.Xresources"
alias valacrittyconfig="vi ~/dotfiles/alacritty/.config/alacritty/alacritty.toml"
alias vviebconfig="vi ~/dotfiles/vieb/.viebrc"
alias vnvinitluaconfig="vi ~/dotfiles/nvim/.config/nvim/init.lua"

# Neovim
alias nvzshrc="nvim ~/dotfiles/zsh/.zshrc"
alias nvi3config="nvim ~/.config/i3/config"
alias nvpicomconfig="nvim ~/dotfiles/picom/.config/picom/picom.conf"
alias nvpolybarconfig="nvim ~/dotfiles/polybar/.config/polybar/config.ini"
alias nvroficonfig="nvim ~/dotfiles/rofi/.config/rofi/config.rasi"
alias nvtmuxconfig="nvim ~/dotfiles/tmux/tmux.conf"
alias nvxprofileconfig="nvim ~/dotfiles/x11/.xprofile"
alias nvxresourcesconfig="nvim ~/dotfiles/x11/.Xresources"
alias nvalacrittyconfig="nvim ~/dotfiles/alacritty/.config/alacritty/alacritty.toml"
alias nvviebconfig="nvim ~/dotfiles/vieb/.viebrc"
alias nvnvinitluaconfig="nvim ~/dotfiles/nvim/.config/nvim/init.lua"



# Cd shortcuts
alias dotfiles-external="cd ~/dotfiles/external && lsd -A"
alias cdnvconfig="cd ~/dotfiles/nvim/.config/nvim && lsd -A" 
alias dotfiles="cd ~/dotfiles && lsd -A"
alias tmp="cd ~/tmp"

# Function of Config & Dotfiles
dotfilescd() {
    
    cd ~/dotfiles/$1

}



# -- Arduino & Code Folders --
alias arduino="cd ~/Arduino"
alias arduino-base="cd ~/Arduino/base" 
alias arduino-projects="cd ~/Arduino/projects"
alias code="cd ~/Code"
alias code-sandbox="cd ~/Code/sandbox"

# -- Python --
alias pyrun="python3 -u"

# -- Home/ folders --
alias note="cd ~/Notes"
alias digint="cd ~/Digital-inking"
alias digint-notes="cd ~/Digital-inking/notes"
alias digint-drawing="cd ~/Digital-inking/drawing"
alias note-general="cd ~/Notes/general"
alias note-math="cd ~/Notes/math"
alias download="cd ~/Downloads"
alias pictures="cd ~/Pictures"
alias searxng="cd ~/hosting/searxng"
alias hosting="cd ~/hosting"


# -- Tor & Developer tools --
alias checktor="ss -tlnp | grep 9050"
alias checktorific="torsocks curl https://check.torproject.org/api/ip"
alias uptor="sudo systemctl start tor"
alias downtor="sudo systemctl stop tor"

# -- Editor aliases -- 
alias nv="nvim"
alias v="vi"

# -- Commands -- 
# X11 changing cursor speed
x11cursor-speed() {
  local help_menu="Usage: x11cursor-speed <device_id> <cursor speed(-1.0 to 1.0)>\nExample: x11cursor-speed 7 -0.3"

  # Check if 0 arguments are passed, or if the first argument is --help
  if [ $# -eq 0 ] || ["$1" = "--help"]; then
    echo -e "$help_menu"
    return 0
  fi

  # Check if we have at least 2 arguments
  if [$# -lt 2 ]; then
    echo "Error: Missing arguments."
    echo -e "$help_menu"
    return 1
  fi

  local device_id="$1"
  local cursor_speed="$2"
  xinput set-prop $device_id "libinput Accel Speed" $cursor_speed
  echo "Applied '$cursor_speed' cursor speed for '$device_id'"
}

# -- Functions --

# C/C++ Compiling 
c-runclang() {
  if [[ -z "$1" ]]; then
    echo "Usage: c-run <filename> [extension]"
    return 1

  fi

  local ONE="$1"
  local TWO="${2:-c} 

	clang -Wall -Wextra -02 -std=c17 "$ONE.TWO -o "$ONE" -lm && ./"$ONE"

}

cfull() {
  if [[ -z "$1" ]]; then
    echo "Usage: c-run <filename> "
    return 1
  fi
  
  local ONE="$1"

  gcc -Wall -Wextra -O2 -std=c17 "$ONE.c" -o "program$ONE" -lm 
  ./"program$ONE" "${@:2}"
}

# Compiles the code
cone() {

  if [[ -z "$1" ]]; then 
    echo "Usage: c-compile <filename>"
    return 1
  fi
  
  local ONE="$1"
  local TWO="${2:-c}"

  gcc -Wall -Wextra -O2 -std=c17 "$ONE.$TWO" -o "program$ONE" -lm
}

cppone() {
  if [[ -z "$1" ]]; then 
    echo "Usage: cppone <filename>"
    return 1
  fi
  
  local ONE="$1"
  local TWO="${2:-cpp}"

  g++ -Wall -Wextra -O2 -std=c++17 "$ONE.$TWO" -o "program$ONE" -lm
}


# Runs the code
ctwo() {
  ./program$1 "${@:2}"
}

# Arduino compiling etc.
ardup() {
    local sketch="${1:-.}"
    arduino-cli compile --upload -p /dev/ttyACM0 --fqbn arduino:avr:uno "$sketch"
}

ardcom() {
    local sketch="${1:-.}"
    arduino-cli compile --fqbn arduino:avr:uno "$sketch"
}

# Text editor shortcuts

nvc() {
  nvim $1.c
}

nvt() {
  nvim $1.txt
}

nvp() {
    nvim $1.py
}

nvcpp() {

    nvim $1.cpp
}

nvd() {

    nvim .$1
}
vc() {

  vi $1.c
}



vt() {

  vi $1.txt
}

vp() {

    vi $1.py
}

# Other
source ~/dotfiles/external/powerlevel10k/powerlevel10k.zsh-theme

source ~/dotfiles/external/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/dotfiles/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$PATH:/opt/nvim/bin"

export TERM=xterm-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export PATH="$HOME/.cargo/bin:$PATH"




# Created by `pipx` on 2026-11-12 14:19:26
export PATH="$PATH:/home/emre/.local/bin"
