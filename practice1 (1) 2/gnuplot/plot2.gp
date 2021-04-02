set terminal pngcairo # 出力形式
set output "programing1.png" # 出力ファイル名
set xrange [0:10]     # x 軸の範囲
set yrange [0:0.14]     # y 軸の範囲
set xlabel "N"  # x 軸のラベル
set ylabel "P(N)"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
set xtics 30           # x目盛りの間隔の設定
set ytics 0.5          # y目盛りの間隔の設定

plot sin(x*pi/180) with lines linecolor rgbcolor "red" linewidth 2 title "sin", cos(x*pi/180) with lines linecolor rgbcolor "blue" linewidth 2 dashtype 2 title "cos",tan(x*pi/180) with lines linecolor "green" linewidth 2 dashtype 4 title "tan"
