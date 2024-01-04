#!/bin/bash
sudo apt-get update
sudo apt-get install apt-file
sudo apt-file update
sudo apt-file search linux-headers-4.19.0-17-amd64
reboot