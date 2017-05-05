# Don't read .bashrc for non-interactive sessions
[ -z "$PS1" ] && return

#######################
# X Server Auto Start #
#######################

# Immediately start the X server if logging in from tty1.
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi

#######################
# Shell Configuration #
#######################

# Powerline config
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

# Auto complete for sudo
complete -cf sudo
eval `dircolors -b`

# Always open files with vim
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR

# Stop git from asking me to enter a merge commit message
export GIT_MERGE_AUTOEDIT=no

# Auto complete for Go commands
# See https://github.com/skelterjohn/go-pkg-complete
source ~/.go-pkg-complete.bash.inc

# Import standard VTE configuration
# Not sure if necessary
. /etc/profile.d/vte.sh

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
alias vi='vim'
alias ga='git add '
alias gc='git commit -S -m '
alias gt='git status'
alias gp='git push'
alias gl='git pull'


#############
# Functions #
#############

# Read a manpage as PDF
manpdf(){
  man -t "$1" | ps2pdf - /tmp/"$1.pdf"
  evince /tmp/"$1.pdf" &
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
