#!/bin/bash

# Record the start time
start_time=$(date +%s)

awk -F';' '{conducteurs[$1]++; if (!distance[$1]) { count[$6]++; distance[$1]=1 }} 
           END {for (i in count) print count[i]";"i}' data.csv | sort -k1nr | head -n 10 > top_10_drivers.csv

echo "set term png" > gnuplot_script.gp
echo "set output 'histogramme_d1.png'" >> gnuplot_script.gp
echo "set title 'Top 10 Conducteurs par Nombre de Trajets'" >> gnuplot_script.gp
echo "set xlabel 'Conducteurs'" >> gnuplot_script.gp
echo "set ylabel 'Nombre de Trajets'" >> gnuplot_script.gp
echo "set style data histogram" >> gnuplot_script.gp
echo "set style fill solid" >> gnuplot_script.gp
echo "set boxwidth 0.5" >> gnuplot_script.gp
echo "set xtics rotate" >> gnuplot_script.gp
echo "plot 'top_10_drivers.csv' using 1:xtic(2) title ''" >> gnuplot_script.gp

gnuplot gnuplot_script.gp
convert -rotate 90 histogramme_d1.png histogramme_d1.png
rm top_10_drivers.csv gnuplot_script.gp

end_time=$(date +%s)

execution_time=$((end_time - start_time))

echo "Le graphique a été généré avec succès (histogramme_d1.png) en ${execution_time} secondes."


