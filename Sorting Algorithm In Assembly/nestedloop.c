#include<stdio.h>
 
int main() {
    int width = 15;
    int outsides = width / 2;
    int insides = -1;
    int i = 0;

    //outerLoop
    while(outsides > 0)
    {
      i = 0;

      //outerLoopLeft
      while(i < outsides)
      {
        printf(" ");
        i++;
      }

      //innerLoop
      if(insides != -1)
      {
        printf("*");
        for(i = 0; i < insides; i++)
        {
          printf(" ");
        }
        printf("*");
      } else
      {
        printf("*");
      }

      //outerLoopRight
      for(i = 0; i < outsides; i++)
      {
        printf(" ");
      }

      outsides--;
      insides += 2;
      printf("\n");
      //return to outerLoop
    }
    
    for(i = 0; i < width; i++)
    {
      printf("*");
    }
    return 0;
}