#!/bin/bash
sudo apt-get remove -y docker docker-engine
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
if ! sudo apt-key fingerprint 0EBFCD88 | tr -d '[[:space:]]'| grep -q "9DC858229FC7DD38854AE2D88D81803C0EBFCD88"
then
  echo "Apt key fingerprint not verified! Exiting!"
  exit 1
fi
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
exit 0

