set terminal pngcairo # 出力形式
set output "programing2.png" # 出力ファイル名
set xrange [0:80]     # x 軸の範囲
set yrange [0:0.07]     # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "P(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
set xtics 10           # x目盛りの間隔の設定
set ytics 0.01         # y目盛りの間隔の設定

plot "poisson40.dat" using 1:2 with linespoints linecolor rgbcolor "purple" linewidth 2 title "m=40", "poissonlog40.dat" using 1:2 with linespoints linecolor rgbcolor "green" linewidth 2 dashtype 2 title "m=40(log)" 
