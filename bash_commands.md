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
	`A | B`		//each commands read s previous command's output

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

##### Wildcard matching
	```
	* 		--> All filenames
	g*		--> files that begins with 'g'
	b*.txt	--> files that begins with "b" and ends with ".txt"
	Data???	--> files that begins with "Data" followed by exactly 3 more char
	[abc]* 	--> files that begins with 'a' or 'b' or 'c' followed by any chars
	[[:upper:]]*	--> files that begins with an uppercase letter
	backup.[[:digit]][[:digit]]	--> file that begins with 'backup' followed by exactly 2 numerals
	*![[:lower]]	--> file that does not end with lowercase letter
	```
	[characters] are:
		[:alnum:]	--> alphanumeric characters
		[:alpha:]	--> alphabetic characters
		[:digit:]	--> numerals
		[:upper:]	--> uppercase alphabetic
		[:lower:]	--> lowercase alphabetic

##### working with commands
	type	--> display information about command type
	which 	--> locate a command; only works for executables, not builtin nor aliases
	help	--> display reference page for shell builtin

	Note: while getting the help docs for shell, if a square brackets appear in the
	description of a command syntax, it means optional items and vertical bar char
	indicates mutually exclusive items. in case of cd [-L|-P] [dir] means that cd may
	be followed optionally by either a "-L" or "-P" and optionally followed by "dir"
	some commands support --help option

	man		--> display an on-line command reference

##### I/O Redirection
	ls > file_list.txt	--> file_list is overwritten with output of ls
	ls >> file_list.txt	--> output will be appended to the file
	sort < file_list.txt--> sort prcess the content of file_list
	sort < file_list.txt > sorted_file_list.txt 	--> it will redirect the
	final output to the sorted_file_list

##### filters
	sort	--> sort standard input and output the result to standard o/p

	uniq	--> given a sorted stream of data from standard input, it
	removes duplicate lines of data

	grep	--> examine each line of data it receive from standard input
	and output every line that contains a specified pattern of character

##### Expansion
	echo *	--> instead of outputing * it will return names of the files/folder
	in the current directory; shell always expands the qualifying commands before
	the command is carried out, so the echo never saw "*". only its expanded result.

	echo ~	--> will result in home path
	echo $((2 + 2))	--> will output 4; arithmetic expansion uses the form $((expression))
	arithmetic expression does not support digit

	brace expansion
		echo Front-{A,B,C}-Back --> will output: Front-A-Back Front-B-Back Front-C-Back
		echo Number_{1..5}		--> output: Number_1 Number_2 Number_3 Number_4 Number_5
		echo {Z..A}				--> output: Z Y X ...............C B A
		echo a{A{1,2},B{3,4}}	--> output: aA1b aA2b aB3b aB4b

	command substitution
		echo $(ls)		--> result ls
		ls -l $(which cp)--> getting the listing of cp program without knowing the path

