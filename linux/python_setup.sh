# Python Setup

# Install Python & venv
sudo apt install -y python3 python3-venv python3-pip
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

# Test locally
source venv/bin/activate
python3 package_name

# The python interpreter should live here /home/username/repo-name/venv/bin/python
