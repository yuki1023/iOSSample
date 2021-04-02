#include <stdio.h> 
#include <math.h> 
#define PI 3.14159265359

int main(void){

  float fmean, lmean, logn, logp, kaijo, fn, a, b, P, loga, logb ;  
  int n, mean, nmax; 

  scanf("%d", &mean); 
  nmax = 4 * mean; 
  fmean = mean; 
  kaijo = 1.;  
 lmean=log(fmean);
 logn=0;
  for (n = 0; n <= nmax; n++){
    
    fn = n; 
    
if (n == 0) fn = 1.
    logn += log(fn); 
    loga = fn * lmean - logn - fmean; 
    if (loga > -50.)  
      a = exp(loga); 

    b= (1.0 / sqrt(2.0 * PI * mean) )* exp(-(mean - n)*(mean - n) / (2.0 * mean)); 
    P=a-b;

    printf("%d %f\n", n, P); 
  }

  return 0;
}
