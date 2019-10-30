.data #Declaring data
userInput .space 10 #stores the user input(10 chars)

.text #Assembly language instruction

main:

	li $v0, 8 #gets user input  
	
	#tell the system this is the end of file
	li $v0, 10 
	syscall
