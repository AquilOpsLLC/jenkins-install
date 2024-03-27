#!/bin/bash

# Update the apt package index
sudo apt update

# Install Java Development Kit (JDK)
sudo apt install -y default-jdk

# Add the Jenkins repository key to the system
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# Add the Jenkins repository to the system's sources list
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the apt package index again
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
sudo systemctl enable jenkins

# Print initial administrator password to access Jenkins
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Optionally, you may want to open the firewall to allow access to Jenkins
# sudo ufw allow 8080

# Print Jenkins status
sudo systemctl status jenkins