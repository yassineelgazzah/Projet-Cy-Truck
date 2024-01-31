#!/bin/bash
start_time=$(date +%s)

./tr-t

gnuplot << EOF
set terminal png
set output "histogramme_t.png"
set title "Les 10 villes les plus visitées"
set style data histogram
set style fill solid
set ylabel "NB ROUTES"
set xlabel "Villes"
set xtic rotate by -45
set style histogram clustered
set datafile separator ';'

plot "data_for_gnuplot.txt" using 2:xtic(1) title "Premiere ville", \
 	'' using 3:xtic(1) title "Routes totales"
EOF

end_time=$(date +%s)

execution_time=$((end_time - start_time))

echo "Le graphique a été généré avec succès (histogramme_t.png) en ${execution_time} secondes."

