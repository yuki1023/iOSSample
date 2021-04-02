set terminal pngcairo # 出力形式
set output "programing1.png" # 出力ファイル名
set xrange [0:50]     # x 軸の範囲
set yrange [0:0.14]     # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "P(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
set xtics 10           # x目盛りの間隔の設定
set ytics 0.02         # y目盛りの間隔の設定

plot "poisson.dat" using 1:2 with lines linecolor rgbcolor "purple" linewidth 2 title "m=10", "poisson20.dat" using 1:2 with lines linecolor rgbcolor "green" linewidth 2 dashtype 2 title "m=20", "poisson30.dat" using 1:2 with lines linecolor rgbcolor "blue" linewidth 2 title "m=30", "poisson40.dat" using 1:2 with lines linecolor rgbcolor "yellow" linewidth 2 title "m=40",
