#STEPS

##### AS ROOOT  ######
su -

#install code-server
curl -fsSL https://code-server.dev/install.sh | sh

# create service file
touch /etc/systemd/system/code-server.service

#create code-server service
cat <<EOF | sudo tee /etc/systemd/system/code-server.service 
[Service]
Type=simple
Restart=always
RestartSec=1
User=ansible
ExecStart=code-server --auth password --bind-addr 0.0.0.0:9080 

[Install]
WantedBy=multi-user.target
EOF


##### SU to ANSIBLE  ######
su - ansible

# daemon reload
sudo systemctl daemon-reload

# resttart code-server service
sudo systemctl restart code-server

# enable code-server service
sudo systemctl enable code-server

# replace file in config to change bind-addr: 127.0.0.1:9080
sed -i 's/8080/9080/' /home/ansible/.config/code-server/config.yaml 

##### add cloudflare tunnel
########### ADD CONNECTOR CODE HERE  ##############
########### ADD CONNECTOR CODE HERE  ##############
########### ADD CONNECTOR CODE HERE  ##############

#make ansible user own of /etc/ansible
sudo chown -R ansible:ansible /etc/ansible

#switch back to roor
su - 

#require password for admin users
#%admins ALL=(ALL:ALL) NOPASSWD: SETENV: ALL
sed -i "s/NOPASSWD: / /" /etc/sudoers.d/admins

#retrieve password  ==> 
    #generated automatically in ~/.config/code-server/config.yaml