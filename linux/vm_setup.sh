# VM Setup

# Use SSH agent‐forwarding from your local machine
ssh -A root@ip.address
# Ensure your local SSH agent is running and has your key loaded
# The VM will forward the request to your local agent, which will sign it with your Bitwarden-managed key

# Update & install core tools
apt update && apt upgrade -y
apt install -y fail2ban ufw unattended-upgrades git curl

# Set timezone
timedatectl set-timezone Europe/London

# Create a non-root user
adduser username
usermod -aG sudo username

# Disable root SSH login
nano /etc/ssh/sshd_config
# PermitRootLogin no
# PasswordAuthentication no
systemctl reload sshd

# Enable UFW firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow OpenSSH
ufw enable
ufw status

# Create a small swapfile if <2GB:
fallocate -l 2G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Configure unattended upgrades
dpkg-reconfigure --priority=low unattended-upgrades

# Copy your SSH key to the new user
mkdir -p /home/username/.ssh
nano /home/username/.ssh/authorized_keys
chown -R username:username /home/username/.ssh
chmod 700 /home/username/.ssh
chmod 600 /home/username/.ssh/authorized_keys

# Switch to your user
su - username
cd ~

# It's nice to add a shortcut in C:\Users\username\.ssh\config:
# Host alias
#     HostName ip.address
#     User username
#	  ForwardAgent yes

# You can then SSH in like this
ssh alias
