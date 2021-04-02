set terminal pngcairo # 出力形式
set output "report1_3awk.png" # 出力ファイル名
 set xrange [9000:11000]# x 軸の範囲
set yrange [0:0.0045]   # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "P(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
         # x目盛りの間隔の
               # y目盛りの間隔の設定

plot "awk1_2.dat" using 1:2 with linespoints linecolor rgbcolor "green" title "awk", "repoisson_log10000.dat" using 1:2 with lines linecolor rgbcolor "red" title "float", "report1_1_10000.dat" using 1:2 with lines linecolor rgbcolor "blue" title "double"