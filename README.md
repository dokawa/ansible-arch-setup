
# Ansible Arch Linux Setup Project 
The Ansible Arch setup project aims to make your life easier when setting up a new environment with Arch Linux by automating a number of configurations and installations. Additionally, the project can assist in keeping your existing environment consistent and updated the way you like it!

## Quick Start

I highly recommend you continue reading the sections below before proceeding with the quick start, but if you just want to get up and running, below are the **minimum** steps required.

It's assumed the first time you run the playbook you're doing it on a fairly minimal Arch installation, though it's certainly not required. The project has been tested on a XFCE installation

### Step 1: Install yay

### Step 2: Install Ansible
```
sudo pacman -Sy ansible
```

### Step 3: Update your system (optional)
```
sudo pacman -Syu
```


### Step 4: Update the username variable (critical)

Open up `roles/common/vars/main.yml` and change the `username` value to the appropriate user name for your system.

You absolutely should review all of the vars config file and modify it to your liking, however changing the `username` variable to match the username you are running this project for is the minimum you need to do.


### Step 5: Install aur collection:

```# Create the user custom module directory
mkdir -p ~/.ansible/plugins/modules

# Install the aur module into the user custom module directory
curl -o ~/.ansible/plugins/modules/aur.py https://raw.githubusercontent.com/kewlfft/ansible-aur/master/plugins/modules/aur.py
```
### Step 6: Install roles
While in the root directory, execute:

`ansible-galaxy install -r requirements.yml`

### Step 7: Run the Playbook
While in the root directory, execute:

`ansible-playbook -K main.yml`

The `-K` parameter is equivalent to `--ask-become-pass` and is used to collect your password for items requiring `become` permissions. 

The playbook can take anywhere from 1 to 10 minutes or so depending on the speed of your machine and whether you chose to follow **Step 3**. It won't get stuck forever; be patient and wait for it to finish.

#### 2. YML Files

Most yml files that customize app configuration can be found in `roles/<role_name>/tasks`.

### Step 6: Reboot
