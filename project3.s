.data
    reply: .space 1000			#Space for 1000 characters has been allocated, and the main program has been started.
    not_valid: .asciiz "NaN"
.text
         main:
	    li $v0, 8			#Taking the user input for strings
            la $a0, reply
            li $a1, 1001
            syscall
	    la $s0, reply		#Loading the adress of input to the first permanent value storing register $s0 and to work through the string.
            li $s1, 0 			#start pointer to make sure that we collect only 4 characters and a comma.
            li $s2, 0			#end pointer to make sure what characters we have collected and read.
	list:
	    la $s1, ($s2)		#content of s2 has been passed as data of s1 to make sure iterate through the string, from start pointer to end pointer.
	sub_string:
	    add $t1, $s0, $s2 	        #iterator taking the start address and the endpointer's sum to make sure $t1 acts as the array pointer
            lb $t2, 0($t1) 		#loading the current character
	    beq $t2, 0, end_substring	#a few criteron to exit the loop while iterating through the substrings on space null and new line
            beq $t2, 10, end_substring
            beq $t2, 44, end_substring
 	    add $s2, $s2, 1     	#Increasing the count of the iterator pointer so that we move through the string to the next character.
            j sub_string
	end_substring:			#now we reach at the end of substring, it will contain subprogram calls and stack operation.      			
            la $a0, ($s1)		#loading arguments to make a subprogram_A call
            la $a1, ($s2)
	#calling subprogram_A after passing the contents from a0 and a1
            jal subprogram_A
	subprogram_A:
            la $s7, ($ra)		#loading the value from $ra to register $s7
            la $t9, ($a0)		#loading the value from $a0 to register $t9

            addi $t8, $a1, 0 		#storing the end address
            la $t7, reply  		#loading the first address of the user input