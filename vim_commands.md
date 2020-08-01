## VIM - Important command

### 1. copy and paste form inside and outside VIM
	y  --- to copy the highligted text in visual mode
	p  --- to paste the copied text from the next line
	yw --- to copy the word from the document
### 2. navigation command to traverse all through VIM documents
	gg --- to get to the top line of document
	G  --- to get to the last line of document
	2G --- to get to the second line of document
	w  --- to get to the start of the next word
	b  --- to get to the start of the previos word
	e  --- to get to the end of the current word
	$  --- to get to the end of the line, including the last character
	2w --- to move the curser two words forward
	2e --- to move the curser to the end of the third word forward
	0  --- to move to the start of the current line
	ctrl + G --- show your location in the file and the file status
	ctrl + O --- to go back to where you came from
	ctrl + I --- Repeat to go further
	%  ---  place the cursor on any (, [, { to find the matching ), ], }
	gT --- to go to the next tab
	gt --- to go to the previous tab
### 3. undo and redo in VIM
	u  --- undo the previous change
	ctrl+r --- redo the previous undo
### 4. cut and delete in VIM
	x --- delete one character
	dd --- delete complete line
	2dd --- delete 2 complete lines
	dw --- delete the current word upto start of next word
	d2w --- delete two consecutive words
	de --- delete upto the end of the current word
	d$ --- delete to the end of the line from current curser position
	p  --- to put previously deleted text after the cursor
### 5. Editing the existing document
	rx --- to replace the character at the cursor with x
	ce --- to change until the end of the word
	c$ --- to change until the end of the sentence
	:s/old/new --- change the first occurence of 'old' with 'new'
	:s/old/new/g --- change all occurence of 'old' with 'new' in the line
	:%s/old/new/g --- change all occurence in the whole file
	:%s/old/new/gc --- change all occurence in the whole file with a prompt


### 6. Search in the existing document
	/'search_value' --- put the cursor on the first letter of 'search_value'use n to go to next and N to go to the previous word
	?'search_value' --- same as / but find word in backward direction

### 7. Miscellaneous
	typing a bash command from the vim type, ! followed by the command in the noremal mode

### 8. Navigation in vim splits
   :vsp  --- open a new vertical splits
   :vsp file_name.py --- open a new file in vertical split with name file_name.py
   :sp   --- open a horizontal split
   ctrl+w hjkl --- to navigate among the vim splits
   :10sp --- provide the width of the new split
### 9. Mastering the VIM - Notes
   . - carry out the last executed operation. for eg. dw
   operations can be divided in two part verbs and noun. for eg
   		verbs are d-delete, c-change, >-indent, y-yank, v-visually select
		nouns are
			iw - inner word; diw will delete word from anywhere inside word
			it - inner tag; dit will delete contents inside of tag
			i" - inner quotes; di" will delete contents inside of quotes
			ip - inner paragraph; dip will delete contents inside of para
			i( - inner bracket; di( will delete contents inside of bracket
	patameterized text object
		f, F - "find" next character, it can be used with verbs, eg, ctL will changed everthing upto L
		t, T - similar to f, F, but cursor does not go upto the character
		./ word_name - it can be used with verbs as well, eg. c./verbs will change from current position to first occurence of verbs

### 10. Folding in VIM
	First select the para you want to fold, then use
	zf - to fold the para
	zo - to open the para
	zc - type anywhere in para to re-fold the para
	:mkview - to save the current view, it will save the current view in .vim/view folder
	:loadview - to reload the current saved view where folding has been saved

### 11. VIM Register - copy & paste
	"ay	- yank and keep in register a
	"by	- yank and keep in register b
	"ap - paste from register a
	"bp - paste from register b

	"ap - paste from register a
	"ap - paste from register a
	"ap - paste from register a

###################################################################################
################################VIM PLUGINS########################################
###################################################################################

1. install vimplug using following command:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	It creates a new directory 'autoload' in .vim directorty and store plug.vim


