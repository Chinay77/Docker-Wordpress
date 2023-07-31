# Docker-Wordpress on AWS EC2 Instance

![Docker-Wordpress](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/fbf75d79-4870-4d29-b693-0bfa3bee7357)

This repository contains instructions to set up WordPress on an AWS EC2 instance using Docker.

## Prerequisites
- Ensure that Docker and Docker Compose are installed on the system. If not present, install the missing packages.

## Step 1: Install Docker
Install Docker on the AWS EC2 instance by following the steps below:

![Install Docker](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/574a2df7-1f70-4d11-986c-f16c71515e47)

1. Set up the repository:
```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=\"$(dpkg --print-architecture)\" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo \"$VERSION_CODENAME\") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

2. Install Docker Engine:
```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
```

## Step 3: Install Docker Compose
Install Docker Compose on the AWS EC2 instance with the following commands:

![Install Docker Compose](https://github.com/Chinay77/Docker-Wordpress/assets/105514247/3d6e802f-73a0-4f8d-be8f-7160b6b5a48e)

```bash
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## Step 4: Clone the repository and setup WordPress
1. Clone this repository and navigate to the downloaded directory:

```bash
git clone https://github.com/Chinay77/Docker-Wordpress.git
cd Docker-Wordpress
```

2. Create a new directory and open the docker-compose.yml file for editing:

```bash
mkdir dc
cd dc
sudo nano docker-compose.yml
```

3. Paste the contents of the docker-compose.yml file into the editor, then press `Ctrl+X`, `Y`, and `Enter` to save and exit.

## Step 5: Manage WordPress with Bash Script
1. Create and edit a bash script for managing WordPress:

```bash
touch manage_wordpress.sh
sudo nano manage_wordpress.sh
```

2. Paste the following script into the editor, then press `Ctrl+X`, `Y`, and `Enter` to save and exit.

```bash
#!/bin/bash

case "$1" in
  "enable")
    docker-compose up -d
    sudo systemctl start docker
    sudo usermod -aG docker $USER
    newgrp docker
    docker-compose up -d
    ;;
  "disable")
    docker-compose down
    ;;
  "delete")
    docker-compose down --volumes
    ;;
  *)
    echo "Usage: $0 {enable|disable|delete}"
    exit 1
esac
```

3. Make the script executable:

```bash
chmod +x manage_wordpress.sh
```

## Step 6: Enable WordPress and Access Site
1. Add an entry to the `/etc/hosts` file to map your site name:

```bash
sudo bash -c 'echo "127.0.0.1 Site_name.com" >> /etc/hosts'
```

2. Enable WordPress using the bash script:

```bash
./manage_wordpress.sh enable
```

3. Open a web browser and enter the URL to access your WordPress site.

## Step 7: Disable and Delete WordPress
To disable the WordPress site and stop the containers:

```bash
./manage_wordpress.sh disable
```

To delete the WordPress site, stopping and removing containers as well as local volumes:

```bash
./manage_wordpress.sh delete
```

Thank you for using Docker-Wordpress on AWS!
