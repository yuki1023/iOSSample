//漸化式
#include <stdio.h> 
#include <math.h> 

int main(void){

  double fmean, fn, p; 
  int n, mean, nmax; 
  scanf("%d", &mean);  
  nmax = 4 * mean;  
  fmean = mean; 
  p=exp(-fmean); 
  for (n = 0; n <= nmax; n++){ 
    fn = n; 
 if (n == 0) fn = 1.;
    p = fmean*p/fn; 
    printf("%d %f\n", n, p); 
  }

  return 0;
}