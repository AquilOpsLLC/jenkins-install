#!/bin/bash

# Update the system
sudo yum update -y

# Install Java Development Kit (JDK)
sudo yum install -y java-1.8.0-openjdk-devel

# Import the Jenkins repository key
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key

# Add the Jenkins repository to the system's repository list
sudo sh -c 'echo -e "[jenkins]\nname=Jenkins\nbaseurl=https://pkg.jenkins.io/redhat-stable\nenabled=1\ngpgcheck=1" > /etc/yum.repos.d/jenkins.repo'

# Install Jenkins
sudo yum install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
sudo systemctl enable jenkins

# Print initial administrator password to access Jenkins
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Optionally, you may want to open the firewall to allow access to Jenkins
# sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
# sudo firewall-cmd --reload

# Print Jenkins status
sudo systemctl status jenkins
