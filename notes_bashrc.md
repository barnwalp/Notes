## How to customize bash terminal

1. to customize terminal, both .bashrc and .bash_profile files are to be modified, you can create it in $HOME directory if it does not exist.
2. If you write something executable (like echo 'something') in .bash_profile, it will run when terminal is opened as bash_profile file is run when login shell is started.
3. .bashrc file is run when non-login or sub shell is started, like when we run bash in command line.
4. To ensure that same setting is applied to all login and non-login shell type this in .bash_profile file
```bash
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
```
this will ensure that all customization can be done only in bashrc file and it will be applicable to all login and non-login shell 

#### Creating customized prompt 
Special Characters:
\h	the hostname up to the first .
\n	newline
\s	the name of the shell
\t	the current time in 24-hour format
\u 	the username of the current user
\w	the current working directory
\W	the basename of the current working directory

to create a custom prompt:
username@hostname directory ->  PS1="\u@\h \w -> ";

Running a command in bash
echo 'This is a directory' $(pwd)

similarly color can also be changed using tput
$(tput sgr0) will make sure that color will be changed till ->
166 ir RGB color code setaf means set forground color
```bash
PS1="$(tput setaf 166)\u@\h \w -> $(tput sgr0)";
export PS1
```

Changes will take affect after restarting the terminal. same can also be done by entering `source .bashrc`

