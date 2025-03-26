# Don't read .bashrc for non-interactive sessions
[ -z "$PS1" ] && return

#######################
# X Server Auto Start #
#######################

# Immediately start the X server if logging in from tty1.
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

nvidia-settings -a '[gpu:0]/GPUPowerMizerMode=1' > /dev/null 2>&1

#######################
# Shell Configuration #
#######################

# Powerline config
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.13/site-packages/powerline/bindings/bash/powerline.sh

# Auto complete for sudo
complete -cf sudo

# Auto complete for kubectl alias
complete -o default -F __start_kubectl k

# Colors for ls
eval `dircolors -b`

# Always open files with vim
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

# Ignore duplicates and commands starting with spaces from history
export HISTCONTROL=ignoreboth

# Stop git from asking me to enter a merge commit message
export GIT_MERGE_AUTOEDIT=no

# Auto complete for Go commands
# See https://github.com/skelterjohn/go-pkg-complete
source ~/.go-pkg-complete.bash.inc

# Auto complete for kubectl
source ~/.kube/completion.bash.inc

# kubectl plugins via krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Set KUBECONFIG
export KUBECONFIG=$(find ~/.kube \( -name '*.yaml' -o -name '*.yml' \) -print0 | xargs -0 echo | tr ' ' ':')

# Auto complete for flux
source ~/.kube/flux.bash.inc

# Set TTY for GPG signing
# See https://unix.stackexchange.com/a/257065
export GPG_TTY=$(tty)

# Use NVM for Node
source /usr/share/nvm/init-nvm.sh

# Import standard VTE configuration
# Not sure if necessary
. /etc/profile.d/vte.sh

# Language specific binaries
export PATH=$HOME/.bin:$HOME/.cargo/bin:$HOME/.npm-packages/bin:$HOME/go/bin:$PATH

# Force npm global install to use $HOME
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

###########
# Aliases #
###########
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias rm='rm -i'
alias nocomment='egrep -v "^\s*(#|$)"'
alias systemctl='sudo systemctl'
alias pacman='sudo pacman --color auto'
alias mksrcinfo='makepkg --printsrcinfo' # pkgbuild-introspection is dead, long live makepkg
alias vi='vim'
alias ga='git add '
alias gc='git commit -S -m '
alias gt='git status'
alias gp='git push'
alias gl='git pull'
alias k='kubectl'
alias gte='gnome-text-editor'

#############
# Functions #
#############


# Download a source archive from AUR, extract the archive and cd to the directory.
aurfetch(){
    if [ -z "$1" ]; then
        echo "Need package name"
        return 1
    fi

    curl https://aur.archlinux.org/cgit/aur.git/snapshot/"$1".tar.gz > ~/builds/"$1".tar.gz
    cd ~/builds
    rm -rf ~/builds/"$1"
    tar -xzvf "$1".tar.gz
    cd "$1"
}

# Display and compare terminal colors in a grid.
# See README for a screenshot.
colors(){
FGNAMES=(' black ' '  red  ' ' green ' ' yellow' '  blue ' 'magenta' '  cyan ' ' white ')
BGNAMES=('DFT' 'BLK' 'RED' 'GRN' 'YEL' 'BLU' 'MAG' 'CYN' 'WHT')

echo "     ┌──────────────────────────────────────────────────────────────────────────┐"
for b in {0..8}; do
  ((b>0)) && bg=$((b+39))

  echo -en "\033[0m ${BGNAMES[b]} │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[$((f+30))m ${FGNAMES[f]} "
  done
  
  echo -en "\033[0m │"
  echo -en "\033[0m\n\033[0m     │ "
  
  for f in {0..7}; do
    echo -en "\033[${bg}m\033[1;$((f+30))m ${FGNAMES[f]} "
  done

  echo -en "\033[0m │"
  echo -e "\033[0m"

  ((b<8)) &&
  echo "     ├──────────────────────────────────────────────────────────────────────────┤"
done
echo "     └──────────────────────────────────────────────────────────────────────────┘"
}

