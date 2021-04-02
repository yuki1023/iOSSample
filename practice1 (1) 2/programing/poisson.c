#include <stdio.h> // 標準入力ライブラリ
#include <math.h> // 数学関数ライブラリ

int main(void){
/*local variables*/
  float kaijo, fmean, fn, p;  // 変数型定義（浮動小数点数型, 4byte)
  int n, mean, nmax; // 変数型定義（整数型, 4byte)
/* main program */
  scanf("%d", &mean);  // 標準入力から m の値を取得し、meanに代入
  nmax = 4 * mean;  // 平均の４倍まで出力
  fmean = mean; // int から float へ
  kaijo = 1.;  // 初期化
  for (n = 0; n <= nmax; n++){ // N=0~Nmaxループ
    // N! の計算
    fn = n; // int から float へ
    if (n>0) kaijo *= fn; // kaijo = kaijo * n と同じ

    p = pow(mean, n) / kaijo * exp(-mean); // ポアソン分布の計算
    printf("%d %f\n", n, p); // 標準出力に出力
  }

  return 0;
}