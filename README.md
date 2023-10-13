- [Ansible Arch Linux Setup Project](#ansible-arch-linux-setup-project)
  - [Quick Start](#quick-start)
    - [Step 1: Install yay](#step-1-install-yay)
    - [Step 2: Install Ansible](#step-2-install-ansible)
    - [Step 3: Update your system (optional)](#step-3-update-your-system-optional)
    - [Step 4: Update the username variable (critical)](#step-4-update-the-username-variable-critical)
    - [Step 5: Run the Playbook](#step-5-run-the-playbook)
    - [Step 6: Reboot](#step-6-reboot)


# Ansible Arch Linux Setup Project 
The Ansible Arch setup project aims to make your life easier when setting up a new environment with Arch Linux by automating a number of configurations and installations. Additionally, the project can assist in keeping your existing environment consistent and updated the way you like it!

You can run the playbook as often or as many times as you'd like to keep your desktop environment(s) sync'd and configured the way you want. Ansible is *idempotent*, so it's built for re-running without breaking anything.

*Pro Tip: if you want those lovely cows instead of the boring standard Ansible output, install cowsay before running the playbook*

## Quick Start

I highly recommend you continue reading the sections below before proceeding with the quick start, but if you just want to get up and running, below are the **minimum** steps required.

It's assumed the first time you run the playbook you're doing it on a fairly minimal Arch installation, though it's certainly not required. The project has been tested thoroughly on a minimal Manjaro XFCE installation as well as ArcoLinux, but should work fine on any Arch or Arch based distro.

### Step 1: Install yay

### Step 2: Install Ansible
```
sudo pacman -Sy ansible
```

### Step 3: Update your system (optional)
```
sudo pacman -Syu
```

If you are running this project on a brand new, fresh Arch install, you can go ahead and update your system via pacman prior to running the playbook. You don't have to, but expect that the playbook will take a little longer when running for the first time since it will do the updates.

### Step 4: Update the username variable (critical)

Open up `roles/common/vars/main.yml` and change the `username` value to the appropriate user name for your system.

You absolutely should review all of the vars config file and modify it to your liking, however changing the `username` variable to match the username you are running this project for is the minimum you need to do.

If you want to use your own dotfiles, change the `dotfiles.url` value in the same config file to point to a git repo of your choosing.

### Step 5: Run the Playbook
While in the `roles` directory, execute:

`ansible-playbook -K main.yml`

The `-K` parameter is equivalent to `--ask-become-pass` and is used to collect your password for items requiring `become` permissions. 

The playbook can take anywhere from 1 to 10 minutes or so depending on the speed of your machine and whether you chose to follow **Step 3**. It won't get stuck forever; be patient and wait for it to finish.

**Pro Tip:** *While you're waiting for the playbook to finish, think of all the things you **did not** have to do and praise yourself for using Linux. Maybe go grab a beer or something to celebrate your awesomeness.*


##### Dotfiles
Your dotfiles can be pulled each time you run the ansible playbook by simply pointing the `dotfiles.url` key to a valid git URL.

Dotfiles are synced / managed using [rcm](https://github.com/thoughtbot/rcm) which comes from the AUR. If you disable AUR in the vars file  (`use_aur`)  you cannot pull your dotfiles without tweaking the `dotfiles.yml` file to exclude rcm.

#### 2. YML Files

Most yml files that customize app configuration can be found in `roles/common/tasks`. You can edit any existing yml file, or add your own and include it in the `main.yml` playbook.


#### How do I include my own dotfiles?
It's so easy! Open up `/roles/common/vars/main.yml` and look for the `dotfiles:` section. Change the `url` to point to your own git repository. It doesn't have to be on Github, just publicly accessible.
