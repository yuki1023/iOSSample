#include <stdio.h>
#include <math.h>

int main(void){

  float fmean, flmean, logfn, fp, logfp, ffn ;
  double dmean, dlmean, logdn, dp, logdp, dfn, P ; 
  int n, mean, nmax;

  scanf("%d", &mean);  
  nmax = 4 * mean;  

  fmean = mean;  
  flmean = log(fmean); 
  logfn = 0.; 
  dmean = mean;  
  dlmean = log(dmean); 
  logdn = 0.; 
  for (n = 0; n <= nmax; n++){
    ffn=n; 
    if (n == 0) ffn = 1.;
    logfn += log(ffn);
    logfp = ffn * flmean - logfn - fmean; 
    dfn=n; 
    if (n == 0) dfn = 1.;
    logdn += log(dfn);
    logdp = dfn * dlmean - logdn - dmean; 
    if (logfp, logdp > -50.) {  
      fp = exp(logfp); 
      dp = exp(logdp);
      P=dp-fp ;
      printf("%d %f\n", n, P); 

  }

  return 0;
}
