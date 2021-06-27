# initialize NVIDIA DRIVERS + CONFIGURE Xorg + REBOOT

# DriverInstallation 
NVIDIA_DRIVER=384.183

set -e

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

# Prepare for NVidia drivers install
sudo apt-get install -y gcc make pkg-config xserver-xorg-dev linux-headers-$(uname -r) xterm mesa-utils
# xterm needed 

# disable Nouveau
#sudo echo 'blacklist nouveau'  | sudo tee -a /etc/modprobe.d/blacklist.conf
#sudo echo 'options nouveau modeset=0'  | sudo tee -a /etc/modprobe.d/blacklist.conf
#sudo echo options nouveau modeset=0 | sudo tee -a /etc/modprobe.d/nouveau-kms.conf
#sudo update-initramfs -u
#sudo reboot now

# Install Lubuntu/Xubuntu/anything
sudo apt-get install -y lubuntu-desktop

curl -O http://us.download.nvidia.com/XFree86/Linux-x86_64/${NVIDIA_DRIVER}/NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run

chmod +x NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run

sudo ./NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run --no-questions --accept-license --no-precompiled-interface --ui=none



rm NVIDIA-Linux-x86_64-${NVIDIA_DRIVER}.run

sudo nvidia-xconfig -a --use-display-device=None --virtual=1280x1024


echo "#############################################"
echo "*  warning might be displalyed:                                           "
echo "* This is fine, we can ignore the warning.    "
echo "#############################################"                                                              



# sudo vi /etc/X11/xorg.conf
# add under  "Screen" section:
# Option        "UseDisplayDevice" "none"
# And under the "Device" section:
# BusID         "0:3:0"

sudo reboot

