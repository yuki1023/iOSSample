#include <stdio.h>
#include <math.h>// 標準入力ライブラリ

int main(void) {
  double X,I,dX,S,dx;
  dx=119.0;
  S=0;
  dX=0.0; // // 変数型定義（整数型, 8byte)

/* 標準入力を使用してデータをインプットする場合 */
  while(!feof(stdin)) { // 標準入力がなくなるまで繰り返し
    scanf("%lf,%lf",&X,&I);
    dX=X-dx;
    S+=I*dX; 
    dx=dx+dX;// 標準入力から " " 内の書式に従って数字を代入
    if(I<0) { // y<0 の場合の処理
      fprintf(stderr,"negative value !\n"); // 標準エラー出力に出力
      I=0.;
    }
    // 標準出力に出力。
    // %8.2fは全部で8桁（スペース・小数点含む）で小数点以下を2桁にする。
    // (float) や (double) は変数型を int から変換している。
  }
printf("%8.2f",S); // 
}