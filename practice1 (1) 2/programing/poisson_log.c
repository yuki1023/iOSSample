#include <stdio.h>// 標準入力ライブラリ
#include <math.h>// 数学関数ライブラリ

int main(void){
/*local variables*/
  float fmean, lmean, logn, p, logp, fn; // 変数型定義（浮動小数点数型, 4byte)
  int n, mean, nmax;// 変数型定義（整数型, 4byte)
/* main prigram */
  scanf("%d", &mean);  // 標準入力から m の値を取得し、meanに代入
  nmax = 4 * mean;  // 平均の４倍まで出力

  fmean = mean;  // int を float に
  lmean = log(fmean); // log m
  logn = 0.; // 初期化
  for (n = 0; n <= nmax; n++){
    fn=n; // int を float に
    if (n == 0) fn = 1.;
    logn += log(fn); // logn = logn + fn と同じ
    logp = fn * lmean - logn - fmean; // logp の計算
    if (logp > -50.) {  // 小さい logp は出力しない。
      p = exp(logp); // p に戻す
      printf("%d %f\n", n, p); // 標準出力に出力
    }

  }

  return 0;
}
