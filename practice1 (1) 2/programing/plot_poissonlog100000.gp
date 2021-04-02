set terminal pngcairo # 出力形式
set output "programing2-2.png" # 出力ファイル名
set xrange [104000:106000]     # x 軸の範囲
set yrange [0:3.5*10**25]     # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "P(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
set xtics 1000           # x目盛りの間隔の設定
set ytics 5*10**24         # y目盛りの間隔の設定

plot "poissonlog100000.dat" using 1:2 with linespoints linecolor rgbcolor "purple" title "m=100000", 
