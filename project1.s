.data #Declaring data
userInput .space 10 #stores the user input(10 chars)

.text #Assembly language instruction

main:
	#tell the system this is the end of file
	li $v0, 10 
	syscall
