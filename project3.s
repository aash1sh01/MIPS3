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