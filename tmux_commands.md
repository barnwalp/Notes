### Tmux commands

##### Tmux Windows
	1. All Commands in tumux is invoked throug ctrl+b
	2. new windows => ctrl+b and then c
	3. switching between windows => ctrl+b and then p/n
	4. List windows => ctrl+b and then w

##### Tmux Panes
	1. Ctrl+b % --> split vertically
	2. Ctrl+b : --> enter command line
	3. :split-window --> split horizontally
	4. ctrl+d   --> exit the current pane, you can also type exit
	5. ctrl+b " --> split horizontally

#### Tmux Sessions
	1. tmux new -s session_name --> starting a new session
	2. ctrl+b d --> detach from the tmux session
	3. tmux attach-session --> t session_name - re-attach to the session
	4. tmux ls --> show currently running sessions

#### Tmux Navigation
	1. ctrl+b arrow key --> switch panes
	2. ctrl+b arrow key(pressed) --> resize pane
	3. ctrl+b Pgup/down --> to navigate the bash pane, q to quit navigation mode
