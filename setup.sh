#!/bin/bash

vagrant up --provision
vagrant ssh -c "sudo reboot"
# add devbox to ssh config
grep devbox ~/.ssh/config || vagrant ssh-config | sed -e "s/default/devbox/" >> ~/.ssh/config 
# copy your git settings to devbox
scp ~/.gitconfig devbox: 
