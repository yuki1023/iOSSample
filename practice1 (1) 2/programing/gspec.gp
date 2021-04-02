set terminal pngcairo
set output "gspec.png"

set xlabel "Energy (keV)"
set ylabel "Count"

plot "gspec_analys.dat" using 1:2 :3 with yerrorbars notitle