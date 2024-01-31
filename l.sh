#!/bin/bash

start_time=$(date +%s)

sorted_data=$(awk -F';' '{total[$1]+=$5; count[$1]++} END {for (i in total) printf "%3f;%s\n", total[i], i}' data.csv | sort -t';' -k1nr |  head -n 10 | sort -t ';' -k2n | head -n 10)
echo "$sorted_data" > sorted_data.txt

gnuplot << EOF
set terminal pngcairo enhanced font "arial,10" size 800,600
set output 'histogram_l.png'
set title 'Option -l : Distance = f(Route)'
set ylabel "Distance en km"
set xlabel "Route ID"
set style fill solid
set boxwidth 0.5 relative
set ytics nomirror
set yrange [0:*]
set xtics rotate by -45
set autoscale xfix
set datafile separator ";" 
plot "lfinal.txt" using 2:xtic(1) with boxes notitle 
EOF

end_time=$(date +%s)

execution_time=$((end_time - start_time))

echo "Le graphique a été généré avec succès (histogramme_l.png) en ${execution_time} secondes."





