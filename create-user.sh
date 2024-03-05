#! /bin/bash
sudo useradd hashicorp --create-home --shell /bin/bash
sudo mkdir /home/hashicorp/.ssh
sudo chmod 700 /home/hashicorp/.ssh
sudo cp /ubuntu/.ssh/authorized_keys /home/hashicorp/.ssh/authorized_keys
sudo chmod 600 /home/hashicorp/.ssh/authorized_keys
sudo chown -R hashicorp:hashicorp /home/hashicorp/.ssh