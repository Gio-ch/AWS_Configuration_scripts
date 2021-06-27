
sudo service lightdm stop

# Install VirtualGL
wget https://sourceforge.net/projects/virtualgl/files/2.5.2/virtualgl_2.5.2_amd64.deb/download -O virtualgl_2.5.2_amd64.deb
sudo dpkg -i virtualgl*.deb
rm virtualgl*.deb

# Install noVNC
sudo git clone https://github.com/novnc/noVNC /opt/noVNC && \
sudo git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# Install TurboVNC
wget https://sourceforge.net/projects/turbovnc/files/2.1.1/turbovnc_2.1.1_amd64.deb/download -O turbovnc_2.1.1_amd64.deb
sudo dpkg -i turbovnc*.deb
rm turbovnc*.deb

# Configure VirtualGL
sudo service lightdm stop
sudo /opt/VirtualGL/bin/vglserver_config -config +s +f -t



echo "######################"
echo " Reboot required"
echo "######################"

sudo reboot

