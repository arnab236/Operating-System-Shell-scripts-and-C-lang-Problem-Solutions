//Dining Philosopher Problem
#include<stdio.h>
#include<pthread.h>
#include<unistd.h>
#include<semaphore.h>

sem_t chopstick[5];
int i=0,p;
void *philosopher(void *a){
  while(1){
    i = *(int*)a;
    sem_wait(&chopstick[i]);
    sem_wait(&chopstick[(i+1)%p]);
    printf("Philosopher %d is holding chopstick %d & %d \n",*(int*)a,i,(i+1)%5);
    printf("Philosopher %d is eating \n",*(int*)a);
    sleep(1);
    sem_post(&chopstick[i]);
    sem_post(&chopstick[(i+1)%p]);
    printf("Philosopher %d is thinking \n",*(int*)a);
  }
}
int main(){
  printf("Enter the number of Philosophers: ");
  scanf("%d",&p);
  pthread_t th[p];
  for(int j=0;j<p;j++){
    sem_init(&chopstick[i],0,1);
  }
  pthread_t th1[10];

  for(int j=0;j<p;j++){
    pthread_create(&th1[j],NULL,&philosopher,(int*)&j);
  }

  for(int j=0;j<p;j++){
    pthread_join(th1[j],NULL);
  }
  return 0;
}