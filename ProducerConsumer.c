//Producer Consumer problem

#include<stdio.h>
#include<unistd.h>
#include<pthread.h>
#include<semaphore.h>

sem_t empty,full,mutex1;
int buffer[6];
int in=0,out=0,item1=0,item2=0;

void *producer(void *a){
  while(1){
    sem_wait(&empty);
    sem_wait(&mutex1);
    item1++;
    printf( "Producer %d Produced Item %d\n",*(int*)a,item1);
    buffer[in]=item1;
    in = (in+1)%6;
    sem_post(&mutex1);
    sem_post(&full);
    sleep(1);
  }
}

void *consumer(void *a){
  while(1){
    sem_wait(&full);
    sem_wait(&mutex1);
    item2 = buffer[out];
    printf("Consumer %d Consumed Item %d\n",*(int*)a,item2);
    out = (out+1)%6;
    sem_post(&mutex1);
    sem_post(&empty);
    sleep(1);
  }
}

int main(){
  int i,c,p;
  printf("Enter the number of Producers: ");
  scanf("%d",&p);
  printf("Enter the number of Consumers: ");
  scanf("%d",&c);
  sem_init(&empty,0,6);
  sem_init( &full,0,0);
  sem_init(&mutex1,0,1);

  pthread_t th1[10],th2[10];

  for(int i=0;i<p;i++){
    pthread_create(&th1[i],NULL,&producer,(int*)&i);
  }
  for(int i=0;i<c;i++){
    pthread_create(&th2[i],NULL,&consumer,(int*)&i);
  }
  for(int i=0;i<p;i++){
    pthread_join(th1[i],NULL);
  }
  for(int i=0;i<c;i++){
    pthread_join(th2[i],NULL);
  }
  return 0;
}