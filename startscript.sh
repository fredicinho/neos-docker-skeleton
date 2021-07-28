#!/bin/bash
# Set your Github api token
GITHUB_API_TOKEN=YOUR_GITHUB_API_TOKEN
# Set your Project Name
PROJECT_NAME=YOUR_PROJECT_NAME

# Install Dependencies
sudo apt-get update
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common \
  git \
  jq

# Install Docker CE
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update && sudo apt install docker-ce -y

# Install Docker-Compose
sudo add-apt-repository universe
sudo apt update
sudo apt install docker-compose -y

# Clone Repo and start containers
git clone https://$GITHUB_API_TOKEN@github.com/fredicinho/chinapolis.git ~/$PROJECT_NAME
cd ~/$PROJECT_NAME && docker-compose up -d
