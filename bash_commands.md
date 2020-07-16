### All Bash Terminal Commands goes here

##### How to get the location of packages installed via pip
	```bash
	pip3 show package_name
	pip3 show flake8
	```
##### How to append to $PATH Variable
	new path should be appended at the end of the $PATH variable unless it needs to take precedence.
	```bash
	PATH=$PATH:/some/dir
	```
##### How to add new path in the beginning of $PATH variable, which will ensure that this binary will be checked before usr local binary etc
	```bash
	PATH =/root:$PATH
	```
	Now bash will execute the command it find in the first path set here.

##### How to execute multiple commands in one line; commands are A & B
	`A; B`		//Run A and then B, regardless of success of A
	`A && B`	//Run B if and only if A succeeded
	`A || B`	//Run B if and only if A failed
	`A &`		//Run A in background

##### How to check current os version
	`lsb_release -a`

##### How to check architecture (32 bit or 64 bit)
	`uname -m

##### how to find files and directory
	```bash
	Find .		//find all files in current directory
	Find folder_name	//find the file in given folder
	Find . -type d 		//find only directories
	Find . -type f		//find only files
	Find . -type f -name "test.txt"	//find test.txt
	Find . -type f -name "test*"	//file that starts with test
	Find . -type f -name "*.py"		//.py files in current directory
	Find . -type f -mmin -10	//file modified in less than 10 minutes
	Find . -type f -mmin +1 -mmin -5// more than a minute and less than 5 minute
	Find . -type f -mtime -20	//file less than 20 days ago
	Find . -size +5M	//file larger than 5 MB (5G, 5K)
	Find . -empty		//return empty files
	Find . -perm 777	//files with permission of 777
	// exec will execute the following command on the returned directory,
	// {} is a placeholder and + sign will end the command
	Find folder_name -type d -exec chmod 755 {} +
	Find . -type f -name "*.jpg" -maxdepth 1 //will search only current directory
	// delete all the jpeg files in the current directory
	Find . -type f -name "*.jpg" -maxdepth 1 -exec rm {} +
	```

##### How to find total size of the folder
	it summarize disk usage of each file, recursively for directories
	```
	du -sh /path_to_directory
	du -sh * 	//returns disk storage for all foldersA
	```

##### How to find disk usage of hard drive
	df -h

##### How to unzip file
	unzip file.zip -d destination_folder
