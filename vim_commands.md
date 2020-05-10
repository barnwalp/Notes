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
	e  --- to get to the end of the current word
	$  --- to get to the end of the line, including the last character
	2w --- to move the curser two words forward
	2e --- to move the curser to the end of the third word forward
	0  --- to move to the start of the current line
	ctrl + G --- show your location in the file and the file status
	ctrl + O --- to go back to where you came from
	ctrl + I --- Repeat to go further
	%  ---  place the cursor on any (, [, { to find the matching ), ], }
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
