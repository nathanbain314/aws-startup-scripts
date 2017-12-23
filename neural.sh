#!/bin/bash

# Install git and library for neural-style
yum -y install git protobuf-devel

# Install torch and loadcaffe
git clone https://github.com/torch/distro.git /home/ec2-user/torch --recursive
cd /home/ec2-user/torch; bash install-deps;
./install.sh
source ~/.bashrc
./install/bin/luarocks install loadcaffe
ln -s /home/ec2-user/torch/install/bin/th /usr/bin/th

# Build neural-style
git clone https://github.com/jcjohnson/neural-style.git /home/ec2-user/neural-style
cd /home/ec2-user/neural-style/
sh models/download_models.sh
sudo chown -R ec2-user:ec2-user /home/ec2-user/neural-style/

# Install task-spooler
cd /home/ec2-user/
wget http://viric.name/soft/ts/ts-1.0.tar.gz
tar -xvzf ts-1.0.tar.gz
cd ts-1.0 && make
ln -s /home/ec2-user/ts-1.0/ts /usr/bin/tsp