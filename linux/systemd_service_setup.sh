# systemd Service Setup

# Create systemd service file
sudo nano /etc/systemd/system/service-name.service
# [Unit]
# Description=Service Name Service
# After=network.target
# 
# [Service]
# User=username
# WorkingDirectory=/home/username/repo-name
# EnvironmentFile=/home/username/repo-name/.env
# ExecStart=/home/username/repo-name/venv/bin/python package_name
# Restart=always
# RestartSec=5
# CPUQuota=50%
# 
# [Install]
# WantedBy=multi-user.target

# Start the service
sudo systemctl daemon-reload
sudo systemctl enable service-name
sudo systemctl start service-name

# Monitoring
sudo systemctl status service-name

# Live logs
sudo journalctl -u service-name -f

# Past logs
sudo journalctl -u service-name -n 100
sudo journalctl -u service-name --since today

# Resource usage
systemd-cgtop --depth=1
htop

# Stop or restart
sudo systemctl stop service-name
sudo systemctl restart repo-name
