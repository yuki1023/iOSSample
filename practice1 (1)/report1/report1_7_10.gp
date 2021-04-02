#m=10の時の漸化式
set terminal pngcairo # 出力形式
set output "report1_7_10.png" # 出力ファイル名
 set xrange [*:*]# x 軸の範囲
set yrange [*:*]   # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "p(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
         # x目盛りの間隔の
               # y目盛りの間隔の設定

plot "report1_7_10.dat" using 1:2 title "m=10"