//Find the process id of parent process and child process.

#include<stdio.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<unistd.h>

int main(){
  pid_t pid;
  pid = fork();
  if(pid == 0){
    printf("Child process id: %d\n",getpid());
    printf("Parent process id: %d\n",getppid());
  }
  else{
    wait(NULL);
    printf("Child process id: %d\n",getpid());
    printf("Parent process id: %d\n",getppid());
  }
}