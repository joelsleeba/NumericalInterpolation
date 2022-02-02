A = [1 2 3; 2 2 2; -1 2 1];
B = [1 0 0; 1 1 0; 1 1 1];
C = [1 1; 2 1; 1 2];

A+B
A*B
A+C %error because different no. of columns
B*A
B-A 
A*C
C-B %error because diff no. of columns
C*A %error because no. of columns in C not equal to the no. of rows of A