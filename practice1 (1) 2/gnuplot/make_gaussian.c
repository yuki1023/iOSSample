#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {

  double mu1 = 2.5; //(double)rand()/RAND_MAX + 1.5;   // 1.5~2.5 の乱数
  double sigma1 = 0.5; //(double)rand()/RAND_MAX/2.0;  // 0~0.5の乱数
  double mu2 = 6.5; //(double)rand()/RAND_MAX + 1.5;   // 1.5~2.5 の乱数
  double sigma2 = 0.2; //(double)rand()/RAND_MAX/2.0;  // 0~0.5の乱数
  int i;
  double f1, f2, x;
  double r;

  //  printf("#mu=%.3f\n#sigma=%.3f\n", mu1, sigma1);
  srand(time(NULL));

  x = 0;
  while (x < 10) {

    
    f1 = (1.0 / sqrt(2.0 * 3.14 * sigma1 * sigma1)) * exp(-(x - mu1) * (x - mu1) / (2.0 * sigma1 * sigma1));
    f2 = (1.0 / sqrt(2.0 * 3.14 * sigma2 * sigma2)) * exp(-(x - mu2) * (x - mu2) / (2.0 * sigma2 * sigma2));

    r = (double)rand()/RAND_MAX - 0.5; // -0.5 ~ 0.5 の乱数
    
    printf("%.2f,%f,%f\n", x, f1 + f2 + r/3, 0.1);
    x += 0.1;
  }
  

  return 0;
}
