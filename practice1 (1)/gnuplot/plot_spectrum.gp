set terminal pngcairo # 出力形式
set output "plot_spectrum.png" # 出力ファイル名
#set xrange [0:10] # x 軸の範囲
#set yrange [0:10] # y 軸の範囲
set xlabel "Wavelength ({/Symbol m}m)" # x 軸のラベル
set ylabel "Reflectance" # y 軸のラベル
set key right bottom # 凡例の位置の指定（グラフの右下）

#plot "11351Leucus_spectrum.dat" using 1:2 with lines title "Leucus"  # エラーバーなし
plot "11351Leucus_spectrum.dat" using 1:2:3 with yerrorbars title "Leucus" # エラーバーあり