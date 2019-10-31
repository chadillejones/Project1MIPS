#Howard ID is @02856918. 
#2856918%11=9
#26+9=Base35 numbers
#0-y; 0-Y
.data #Declaring data
userInput: .space 10 #stores the user input(10 chars)

.text #Assembly language instruction

main:

	li $v0, 8 #gets user input 
	la $a0, userInput #sets it to the alloted variable
	li $a1, 12 #specify the length of the input #changed so the person can enter 10 characters and then enter button
	syscall
	
	la $t0, userInput #loads the string address in $t0
	li $t1, 0 #initialized the sum of all the characters
	li $t3, 32 #initialized a space to check for spaces 
	li $t4, 48 #initialized a register to be equal to 0 #changed it from null to zero
	li $t5, 65 #lowest ascii capital letter (a)
	li $t7, 89 #highest ascii capital letter (y)
	li $t6, 0x0A #initialized a new line to signal when the loop is complete		
			  
loop: #to loop through the characters of the string

	lb $t2, 0($t0) #takes one character in the string
	
	beq $t2, $t6, end_loop #ends loop when all the characters are used
	
	beq $t2, $t3, skip_char #skips the current character if it is a space
	
	beq $t2, $t4, skip_char #skip the current character if it is a 0
	
	li $t8, 0 #initialized this to 0 #move its initialization before branch
	
	blt $t2, $t5  not_capital_letter #checking if it is a capital letter within the range Base35
	
	bgt $t2, $t7 not_capital_letter 
	
	addi $t8, $t2, -55 #to calculate the decimal based on the capital letter
	add $t1, $t1, $t8 #add the decimal value to the total
	addi $t0, $t0, 1 #to shift the address after the summation of capital letters is complete 
	j loop #returns the loop
		
	
	
	
end_loop: #should reach here after everything has been summed in $t1

	li $v0, 1
	move $a0, $t1
	syscall #prints the result of the sum of the characters
	
	#tell the system this is the end of file
	li $v0, 10 
	syscall
	
	
skip_char: #moves the character without summation

	addi $t0, $t0, 1
	j loop #returns to the loop
	
not_capital_letter:

	li $s0, 97 #initialized the smallest lower case character(a)
	li $s1, 121 #initialized the largest lower case character (y)
	
	blt $t2, $s0, not_an_acceptable_letter #branch if not within the range for common letters
	
	bgt $t2, $s1, not_an_acceptable_letter #same as previous comment
	
	addi $t8, $t2, -87 #calculate the decimal for common letters
	add $t1, $t1, $t8 #adding it to the sum variable
	addi $t0, $t0, 1 #moving the address by 1
	j loop #jumping back to the loop
	
not_an_acceptable_letter:

	li $s3, 49 #initialized the smallest digit other than 0 (1)
	li $s4, 57 #initialized the largest digit (9)
	
	blt $t2, $s3, skip_char #branch if a not a digit. Therefore it is a 0 number. Therefore skip character
	
	bgt $t2, $s4, skip_char #same as previous
	
	addi $t8, $t2, -48 #calculate the decimal value
	add $t1, $t1, $t8 #add it to the sum variable
	addi $t0, $t0, 1 #moving the address by 1
	j loop #jumping back to the loop
	
	
