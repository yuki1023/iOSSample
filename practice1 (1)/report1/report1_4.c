#include <stdio.h> 
#include <math.h> 
#define PI 3.14159265359

int main(void){

  float kaijo, fmean, fn, p;  
  int n, mean, nmax; 

  scanf("%d", &mean); 
  nmax = 4 * mean; 
  fmean = mean; 
  kaijo = 1.;  
  for (n = 0; n <= nmax; n++){ 
    fn = n; 
    
    p = (1.0 / sqrt(2.0 * PI * mean) )* exp(-(mean - n)*(mean - n) / (2.0 * mean)); 
    printf("%d %f\n", n, p); 
  }

  return 0;
}
