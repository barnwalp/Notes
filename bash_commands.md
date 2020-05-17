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


