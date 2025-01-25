//Matrix sum using thread

#include<stdio.h>
#include<pthread.h>
#include<unistd.h>

pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;

int a[2][2],b[2][2];

void *func1(){
  pthread_mutex_lock(&mutex1);
  printf("Enter the elements of matrix A: \n");
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      scanf("%d",&a[i][j]);
    }
  }

  printf("Enter the elements of matrix B: \n");
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      scanf("%d",&b[i][j]);
    }
  }

  pthread_mutex_unlock(&mutex1);
  
}

void *func2(){
  pthread_mutex_lock(&mutex1);
  int s[2][2];

  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      s[i][j] = a[i][j] + b[i][j];
    }
  }
  printf("The sum of the matrices is: \n");
  for(int i=0;i<2;i++){
    for(int j=0;j<2;j++){
      printf("%d ",s[i][j]);
    }
    printf("\n");
  }
  pthread_mutex_unlock(&mutex1);
}

int main(){
  pthread_t t1,t2;

  pthread_create(&t1,NULL,&func1,NULL);
  pthread_create(&t2,NULL,&func2,NULL);

  pthread_join(t1,NULL);
  pthread_join(t2,NULL);

  return 0;
}