#!/bin/bash
# File  : .bashrc
# Author: Amsid S <amsit14@gmail.com>
# Date  : 04.06.2020
# File  : .bashrc
# Date  : 21.12.2019
# Last Modified Date  : 21.12.2019
if [ -r /proc/meminfo ]; then
   echo -e "\033[36m"
   egrep 'Mem|Cac|Swa' /proc/meminfo
   echo -e "\033[0m"
fi
INC="${HOME}/.dotfiles/bash-powerline.sh"
test -f "$INC" && \
   source $INC
unset INC
test -f ~/.dotfiles/aliases && \
   source ~/.dotfiles/aliases

LAUNCH_APP_FILE=${EXTERNAL_STORAGE}/termuxlauncher/.apps-launcher
test -f $LAUNCH_APP_FILE && \
   source $LAUNCH_APP_FILE;

register_local_path() {
   if [ -d "${HOME}/.local/bin" ];then
      p=${HOME}/.local/bin
      PATH=${PATH//${p//\//\\\/}/}:$p
      PATH=${PATH//::/:}
      export PATH=${PATH/}:${HOME}/.local/bin
   fi
}

register_local_path


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/data/data/com.termux/files/home/.sdkman"
[[ -s "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh" ]] && source "/data/data/com.termux/files/home/.sdkman/bin/sdkman-init.sh"

# [ set defaut editor ]
EDITOR=${HOME}/bin/termux-file-editor
test -f $EDITOR && source $EDITOR
