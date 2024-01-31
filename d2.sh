#!\bin\bash
start_time=$(date +%s)
data=$(LC_NUMERIC=en_US.UTF-8 awk -F';' 'NR > 2 {count[$6]+=$5} END {for (i in count) printf "%.3f %s\n", count[i], i}' data.csv | sort -k1,1nr | head -10)

echo "$data" > temp_data.txt

gnuplot <<- EOF
    	set terminal pngcairo enhanced font "arial,10" size 800,600
    	set output 'histogramme_d2.png'
    	set style fill solid
    	set boxwidth 0.5
    	set yrange [*:*] 
    	set xlabel "Distance totale parcourue"
    	set ylabel "Conducteurs"
    	set title "Histogramme des distances parcourues par conducteur"
    	plot 'temp_data.txt' using 1:xticlabels(2) with boxes notitle
EOF
convert -rotate 90 histogramme_d2.png histogramme_d2.png
rm temp_data.txt
end_time=$(date +%s)

execution_time=$((end_time - start_time))
echo "Le graphique a été généré avec succès (histogramme_d2.png) en ${execution_time} secondes."
