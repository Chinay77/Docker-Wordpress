# Docker-Wordpress
AWS EC2 INSTANCE 

STEP 1:
Check if docker and docker-compose is installed on the system. If not present, install the missing packages.
![image](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/fbf75d79-4870-4d29-b693-0bfa3bee7357)

STEP 2: Installed Docker from https://docs.docker.com/engine/install/ubuntu/

# Set up the repository
Update the apt package index and install packages to allow apt to use a repository over HTTPS:

 sudo apt-get update
 sudo apt-get install ca-certificates curl gnupg
 
# Add Docker’s official GPG key:

 sudo install -m 0755 -d /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
 sudo chmod a+r /etc/apt/keyrings/docker.gpg
 
# Use the following command to set up the repository:

 echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

 # Install Docker Engine
sudo apt-get update 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

![image](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/574a2df7-1f70-4d11-986c-f16c71515e47)

STEP 3: install Docker Compose on your AWS EC2 instance

# Download the Docker Compose binary
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Create a symbolic link to make it accessible in the system path
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

![image](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/3d6e802f-73a0-4f8d-be8f-7160b6b5a48e)


sudo docker-compose up -d
sudo systemctl start docker
sudo usermod -aG docker $USER
newgrp docker
docker-compose up -d

STEP 4: Copy yml file from https://hub.docker.com/_/wordpress or download from my repo 

Then use this commands to make a new directory-
mkdir dc
cd dc
sudo nano docker-compose.yml

STEP 5: Paste the yml file and press ctrl+x - y - Enter.

STEP 6: Created Bash Script and added to dc dir

Touch manage_wordpress.sh
sudo nano manage_wordpress.sh

STEP 7: Paste the script and press ctrl+x - y - Enter.

STEP 8: Use the following Commands-

udo bash -c 'echo "127.0.0.1 Site_name.com" >> /etc/hosts'
./manage_wordpress.sh enable

![image](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/5e4092b8-c853-4d36-b4a5-5683a3f34989)

STEP 9: Paste the url in the web Browser 

![image](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/22d79536-a34d-4611-96de-22d425069dd4)

Wordpress on AWS using Docker is Running.

STEP 10: To disable the WordPress site (stop the containers):
./manage_wordpress.sh disable

To delete the WordPress site (stop and remove containers, as well as local volumes):
./manage_wordpress.sh delete


THANK YOU (:




