# Git Setup

# Clone repo to /home/username/repo-name
git clone git@github.com:git-username/repo-name.git
cd repo-name

# Set environment variables
cd ~/repo-name
nano .env
chmod 600 .env
chown username:username .env

# Deploy new changes
git pull origin main
source venv/bin/activate
pip install -r requirements.txt
deactivate
