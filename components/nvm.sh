#!/bin/bash

source $APPINST_BASEDIR/components/helpers/colors.sh
source $APPINST_BASEDIR/components/helpers/profile.sh

echo -e "$green Installing required components! $close_color" &&
sudo apt install build-essential checkinstall libssl-dev -y &&

echo -e "$green Downloading installer $close_color" &&
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&

echo -e "$green Updating system variables! $close_color" &&
echo "export NVM_DIR='$HOME/.nvm'
[ -s '$NVM_DIR/nvm.sh' ] && \. '$NVM_DIR/nvm.sh'
[ -s '$NVM_DIR/bash_completion' ] && \. '$NVM_DIR/bash_completion'" >> $MY_PROFILE &&

source $MY_PROFILE &&
command -v nvm &&

echo -e "$green NVM successfully installed on version: $close_color" &&
nvm --version

echo -e "$green You need to reboot the system to complete instalation! $close_color"

echo -ne "$blue Do you want to reboot now? [y:n] $close_color"
read reboot_now

# if user press Yes
if [ "$reboot_now" = 'y' ]; then
  systemctl reboot
fi
