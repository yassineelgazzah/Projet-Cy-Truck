#!/bin/bash
start_time=$(date +%s)

./trai-s> data.txt
gnuplot << EOF
set terminal pngcairo size 1200,600 enhanced font 'Arial,12'
set output 'histogramme_s.png'
set title 'Option -s = Distance = f(Route)'
set xlabel 'ID'
set ylabel 'Distance en km'
set yrange 
set xtics rotate by 45 right
set datafile separator ';'
plot 's.txt' using 2:xtic(1) title '"Dist Max/Min', \
'' using 3:xtic(1) title '"Dist moyenne"

EOF


end_time=$(date +%s)

execution_time=$((end_time - start_time))

echo "Le graphique a été généré avec succès (histogramme_s.png) en ${execution_time} secondes."

