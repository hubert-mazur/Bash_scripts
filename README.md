# Bash_scripts

#### This repository contain some bash scripts, that I have already written. Tested on Ubuntu 18.04.

#### More detailed description of scripts:

1. Set up Workspace folder- useful for C, C++ programming:

--> `ReadMe.txt` provides usage information

--> `install.sh` installation script

--> `CmakeLists.txt` Cmake file, each time copied to current script run localization

--> `set_w_space.sh` Most important part, creates whole working space with necessary directories. 

After installation process is completed, it is possible to create workspace at any location. Typing `./setwspace` with no arguments is possible, but it will be necessary to  type folder name. Script runned with one argument creates folder with given name. 

-- Compiling -- 
Compiling is possible only from child's folder in regard to `CMakeLists.txt` file e.g from `Build` folder running cmake .. .
Available options:
`make` - builds project
`make run` - runs project
`make memcheck` - runs valgrind over project
`make pack` - creates tar.gz archive with project
`make backup` - creates backup of project
`make restore` - restores from backup
`make suicide` - clear everything in Build directory


2. .shp file creator:

--> `File_creator.sh` creates .txt files with the same names as .shp files.
Runs with no arguments.

3. Compressing script

--> `Packer.sh` is a funny script, that allows to compress given file as many times as your machine can stand!

One Argument is obligatory. Represents name of file that has to be compressed. Second argument is optional, represents how many times file will be compressed.
