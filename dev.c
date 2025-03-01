#include <stdio.h> 
#include <string.h> 
#include <errno.h> 
#include <unistd.h> 
#define chardev_BYTES 256     
// max number of characters to read from /dev/chardev 
/* This code uses the character device driver /dev/chardev. The code reads the default 
* message from the driver and then prints it. After this the code changes the message in 
* a loop by writing to the driver, and prints each new message */ 
int main(int argc, char *argv[]) 
{ 
FILE *chardev_fp;                       
// file pointer 
char chardev_buffer[chardev_BYTES];     
// buffer for chardev character data 
char new_msg[128];                      
// space for the new message that we generate 
int i; 
if ((chardev_fp = fopen("/dev/chardev", "r+")) == NULL) 
{ 
fprintf(stderr, "Error opening /dev/chardev: %s\n", strerror(errno)); 
return -1; 
} 
for(i = 0; i < 5; i++) 
{ 
while (fgets (chardev_buffer, chardev_BYTES, chardev_fp) != NULL); 
printf ("%s", chardev_buffer); 
sprintf (new_msg, "New message %d\n", i); 
fputs (new_msg, chardev_fp); 
fflush (chardev_fp); 
sleep (1); 
} 
fclose (chardev_fp); 
return 0; 
} 