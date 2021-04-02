#include <stdio.h>
#include <math.h>

int main(void) {
  double X,I,dX,S,dx;
  dx=119.0;
  S=0;
  dX=0.0; 

  while(!feof(stdin)) { 
    scanf("%lf,%lf",&X,&I);
    dX=X-dx;
    S+=I*dX; 
    dx=dx+dX;
    if(I<0) { 
      fprintf(stderr,"negative value !\n"); 
      I=0.;
    }
    
  }
printf("%8.2f",S); 
}
