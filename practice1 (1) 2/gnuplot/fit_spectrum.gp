set terminal pngcairo # 出力形式
set output "fit_spectrum.png" # 出力ファイル名
set xrange [*:*] # x 軸の範囲
set yrange [*:*] # y 軸の範囲
set xlabel "Wavelength ({/Symbol m}m)" # x 軸のラベル
set ylabel "Reflectance" # y 軸のラベル
set key right bottom # 凡例の位置の指定（グラフの右下）

f(x) = a * x + b  # 関数の定義
a = 0.01 # 初期値の設定
b = 1 # 初期値の設定

fit f(x) "11351Leucus_spectrum.dat" using ($1/1e4):2 via a, b  #フィッティング実行

plot "11351Leucus_spectrum.dat" using ($1/1e4):2 with lines title "Leucus", f(x) with lines title sprintf("a=%f, b=%f", a, b) # フィッティング結果を重ねてプロット

# フィッティング結果を標準出力に表示
set print "-"  # デフォルトでは標準エラー出力に出力されるので、標準出力に変更してる。これでリダイレクト (>) でファイルに保存できる。
print a
print b
