set terminal pngcairo # 出力形式
set output "programing3.png" # 出力ファイル名
set xrange [0:2500]     # x 軸の範囲
set yrange [0:140]     # y 軸の範囲
set xlabel "Energy(keV)"  # x 軸のラベル
set ylabel "Count"  # y 軸のラベル
set key right top  # 凡例の位置の指定（グラフの右下）, boxオプションで枠線で囲む
set grid x y          # x, y 方向にグリッドを描く
set xtics 500           # x目盛りの間隔の設定
set ytics 20         # y目盛りの間隔の設定

plot "gspec_analys.dat" using 1:2:3 with yerrorbars notitle
