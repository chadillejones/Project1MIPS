.data #Declaring data
userInput: .space 10 #stores the user input(10 chars)

.text #Assembly language instruction

main:

	li $v0, 8 #gets user input 
	la $a0, userInput #sets it to the alloted variable
	li $a1, 11 #specify the length of the input
	syscall
	
	la $t0, userInput #loads the string address in $t0
	li $t1, 0 #initialized the sum of all the characters
	li $t2, 32 #initialized a space to check for spaces
	li $t6, 0x0A #initialized a new line to signal when the loop is complete
			 
loop: #to loop through the characters of the string
	lb $t2, 0($t0) #takes one character in the string
	
	beq $t2, $t6, end_loop #ends loop when all the characters are used
	
	#tell the system this is the end of file
	li $v0, 10 
	syscall
