#!/bin/bash

mkdir ~/Workspace_files
cp Files/CMakeLists.txt ~/Workspace_files
chmod 700 ~/Workspace_files/CMakeLists.txt 
cp Files/set_w_space.sh ~/Workspace_files
echo "alias setwspace='~/Workspace_files/./set_w_space.sh'" >> ~/.bashrc

echo "All is set up, make sure, that you have alias to Visual Studio Code called: 'code', otherwise this won't work "
echo "Works only with polish language, otherwise you need to change names of directiories e.g Pobrane to Downloads to make it work"
echo "Tested on Ubuntu 18.04"
echo "Thanks for using"
echo 
echo "All files created by Hubert Mazur"
