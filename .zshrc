export ZSH=/home/dieraca/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  lol
)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:/usr/sbin:~/go/bin:/opt/cuda/bin/

function scp_mit {
	for var in "$@"
	do
		scp $var jrestivo@athena.dialup.mit.edu:/mit/jrestivo
		ssh jrestivo@athena.dialup.mit.edu "source .bashrc && print_thing " $var
	done
}

 alias asdf="ls"
 # for 6.858
 alias start_vm="cd ~/school/6.858/vm_image_thing/ && sudo qemu-system-x86_64 -enable-kvm -m 512 -net nic -net user,hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:8080-:8080 vm-6858.vmdk"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
  fi

bindkey -v
alias show='ls -a'
alias ff='firefox'
alias sp='sconsify'
alias qt='qutebrowser'
alias pm='pusemixer'
alias bt='systemctl start bluetooth.service'
alias showlog='journalctl -n 20'
alias h='cd $HOME'
alias u='cd ..'
alias datboi='pkill emacs ; pkill emacs'
alias dewd='xrandr --output eDP-1 --mode 1920x1080_60.00'
alias vimm='vim -M'
alias remacs='systemctl --user restart emacs.service'
alias omacs='emacsclient -nw'
alias python="/usr/bin/python2.7"
alias vg="valgrind --tool=cachegrind --branch=sim=yes "
alias sesh="ssh jrestivo@mint-square.mit.edu"
alias proj="xrandr --output HDMI-2 --auto"
alias glog="git log --graph --pretty=format:'%h - %d %s (%cr) <%an>' | vim -R -c 'set filetype=git nowrap' -"
alias pblue="sudo hciconfig hci0 up && sudo rfkill unblock bluetooth && bluetoothctl"
eval "$(fasd --init auto)"
alias spoon="echo ursad"
#alias fuck="rm bruh.txt && go test -run TestBasic3A >> bruh.txt && vim bruh.txt"
GOPATH=~/school/6.824/lab1 && export GOPATH
alias config='/usr/bin/git --git-dir=/home/dieraca/.cfg/ --work-tree=/home/dieraca'
alias ram2app=' ps aux  | awk `{print $6/1024 " MB\t\t" $11}`  | sort -n'
alias allfx=' gcc alienfx.c -ggdb `pkg-config --libs --cflags libusb-1.0`'
alias compdwm='sudo make clean && sudo make ALIENX=1 && sudo make ALIENFX=1 install'
