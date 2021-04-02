set datafile separator","
set terminal pngcairo # 出力形式
set output "fit2.png" # 出力ファイル名
set xrange [0:9] # x 軸の範囲
set yrange [-0.5:2.5] # y 軸の範囲
set xlabel "x" # x 軸のラベル
set ylabel "y" # y 軸のラベル
set key left top # 凡例の位置の指定（グラフの右下）

f(x) = (1.0/sqrt(2.0*pi*shiguma1**2))*exp(-(x-mu1)**2/(2*shiguma1**2)) # 関数の定義
shiguma1 = 1 # 初期値の設定
mu1 = 1 # 初期値の設定

fit [0:5] f(x) "gaussian_data.csv" using 1:2 via shiguma1, mu1  #フィッティング実行

g(x) =(1.0/sqrt(2.0*pi*shiguma2**2))*exp(-(x-mu2)**2/(2*shiguma2**2)) # 関数の定義
shiguma2 = 0.1 # 初期値の設定
mu2 = 6 # 初期値の設定

fit [5:10] g(x) "gaussian_data.csv" using 1:2 via shiguma2, mu2  #フィッティング実行

plot "gaussian_data.csv" using 1:2:3 with yerrorbars pointtype 6 pointsize 1.5 linecolor rgbcolor "black" title "data", f(x) with lines linewidth 3 linecolor rgbcolor "red"  title sprintf("mu=%.2f, shiguma=%2f", mu1, abs(shiguma1)), g(x) with lines linewidth 3 linecolor rgbcolor "blue" title sprintf("mu = %.2f, shiguma =%.2f", mu2, abs(shiguma2)) # フィッティング結果を重ねてプロット


# フィッティング結果を標準出力に表示
set print "-"  # デフォルトでは標準エラー出力に出力されるので、標準出力に変更してる。これでリダイレクト (>) でファイルに保存できる。
print shiguma1
print mu1
print shiguma1
print shiguma2
