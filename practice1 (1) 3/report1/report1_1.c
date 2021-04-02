#include <stdio.h>
#include <math.h>

int main(void){

  double fmean, lmean, logn, p, logp, fn; 
  int n, mean, nmax;
  scanf("%d", &mean);  
  nmax = 4 * mean;  

  fmean = mean;  
  lmean = log(fmean); 
  logn = 0.;
  for (n = 0; n <= nmax; n++){
    fn=n; 
    if (n == 0) fn = 1.;
    logn += log(fn); 
    logp = fn * lmean - logn - fmean; 
    if (logp > -50.) {  
      p = exp(logp); 
      printf("%d %f\n", n, p); 

  }

  return 0;
}
