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

KERBEROS="jrestivo"

# double sided
function scp_mit {
  ssh -f -N -l $KERBEROS athena.dialup.mit.edu
  ssh $KERBEROS@athena.dialup.mit.edu "mkdir printer_files"
  cmd=""
  for var in "$@"
  do
      #cmd+="lpr -P mitprint -U graceyin -o sides=two-sided-long-edge ~/printer_files/"
      cmd+="lpr -P mitprint -o sides=two-sided-long-edge ~/printer_files/"
      cmd+=$(basename $var)
      cmd+="; "
  done
	scp $@ $KERBEROS@athena.dialup.mit.edu:/mit/$KERBEROS/printer_files/
	ssh $KERBEROS@athena.dialup.mit.edu $cmd " rm -dr printer_files"
}

# single sided (for musics)
function scp_mit_single {
    ssh -f -N -l $KERBEROS athena.dialup.mit.edu
    ssh $KERBEROS@athena.dialup.mit.edu "mkdir printer_files"
    cmd=""
    for var in "$@"
    do
        cmd+="lpr -P mitprint ~/printer_files/"
        cmd+=$(basename $var)
        cmd+="; "
    done
	  scp $@ $KERBEROS@athena.dialup.mit.edu:/mit/$KERBEROS/printer_files/
	  ssh $KERBEROS@athena.dialup.mit.edu $cmd " rm -dr printer_files"
}

function print_cwd {
    scp_mit $(ls)
}

# connect to input wifi
function cw {
    # if no args
    if [ $# -eq 0 ]
    then
        sudo nmcli device wifi connect "MIT"
    else
        sudo nmcli device wifi connect $1
    fi
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
#alias remacs='systemctl --user restart emacs.service'
alias remacs='pkill emacs && emacs --daemon'
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
GOPATH=~/go:~/school/6.824/lab1:~/school/6.858/DuckDuckGo && export GOPATH
alias config='/usr/bin/git --git-dir=/home/dieraca/.cfg/ --work-tree=/home/dieraca'
alias ram2app=' ps aux  | awk `{print $6/1024 " MB\t\t" $11}`  | sort -n'
alias allfx=' gcc alienfx.c -ggdb `pkg-config --libs --cflags libusb-1.0`'
alias compdwm='sudo make clean && sudo make ALIENX=1 && sudo make ALIENFX=1 install'
alias fixnw='sudo nmcli device wifi connect MIT'
alias fixtime='sudo rc-service ntp-client start'
alias update_that_shit='sudo emerge --ask --update --changed-use --deep @world'
# note that in dwm the bindings are mod + (<>) to switch between monitors and mod + shift + (<>) to move currently selected app between monitors
alias add_second_monitor='xrandr --auto --output HDMI-0 --mode 1920x1080 --right-of eDP-1-1'
alias remove_second_monitor='xrandr --output HDMI-0 --off'
alias pepe="xwinwrap -ni -fdt -sh rectangle -un -b -nf -ov -fs -- mpv --wid WID --no-config --keepaspect=no --loop \
	--no-border --vd-lavc-fast --x11-bypass-compositor=no \
    	--gapless-audio=yes --vo=xv --hwdec=auto --really-quiet \
	--name=mpvbg ~/Downloads/20859764_507377299610658_150461942853533696_n.gif"
alias m="mupdf-x11"
source ~/.cargo/env
