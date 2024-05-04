# Funlab

#### Solutions for the below problem statements can be found inn the Solution folder.

### SQL Problem Statement
"PROBLEM STATEMENT: Given INPUT table provides login and logoff details of a Funlab web user.
Provide SQL query to generate the OUTPUT table to represents the different periods (in mins) when user was logged in."							
							
							
							
To create the INPUT table, necessary SQL commands have been provided; Please refer to Funlab_DE_SQL_Dataset to create the table and insert values;							
							
``` table				
INPUT			                    OUTPUT				
TIMES	STATUS		                LOG_ON     	 LOG_OFF	      DURATION		
10:00:00	on		        10:00:00	10:03:00		3		
10:01:00	on		        10:04:00	10:06:00		2		
10:02:00	on		        10:09:00	10:13:00		4		
10:03:00	off		        10:15:00	10:16:00		1		
10:04:00	on						
10:05:00	on						
10:06:00	off						
10:07:00	off						
10:08:00	off						
10:09:00	on						
10:10:00	on						
10:11:00	on						
10:12:00	on						
10:13:00	off						
10:14:00	off						
10:15:00	on						
10:16:00	off						
10:17:00	off						
```

### Python Problem Statement
"Given a string,  define a function that find the least repeating character in that string using Python. 
Also print out the count of each character. If there is multiple least repeating characters, print out any of one of them. "

Condtion:  Only using loop and python data type; No in-built / 3rd party module. 

Sample input:   "aaabbbcccdddeeefffg"

"Sample Output:  
{'a': 3, 'b': 3, 'c': 3, 'd': 3, 'e': 3, 'f': 3, 'g': 1}
g"


Sample input:   "aaabbbcccdddeeefffggg"
"Sample Output:  
 {'a': 3, 'b': 3, 'c': 3, 'd': 3, 'e': 3, 'f': 3, 'g': 3}   
a"