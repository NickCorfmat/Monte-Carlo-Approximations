#! /bin/bash

make clean && make monte_carlo # Rebuild the monte_carlo executable.

./monte_carlo -n 100 | tail -n +2 > mc_data.dat

awk '{if($5=="1"){print $3 " " $4}}' < mc_data.dat > inside_circle.dat
awk '{if($5=="0"){print $3 " " $4}}' < mc_data.dat > outside_circle.dat

gnuplot <<END
set terminal pdf
set output "monte_carlo.pdf"
set xlabel "x"
set ylabel "y"
set zeroaxis
set xrange [0:1]
set yrange [0:1]
set size square
set object 1 circle front at 0,0 size 1 fillcolor rgb "black" lw 1
plot "inside_circle.dat" title "" lc rgb "blue" pt 7 ps 0.3, "outside_circle.dat" title "" lc rgb "red" pt 7 ps 0.3
END

for i in {1..4}; do ./monte_carlo -n 70000 -r $RANDOM | tail -n +2 | awk '{print $2 - 3.14159265358979323846264338327950288419 }' > "pi_error$i.dat"; done

gnuplot <<END
set terminal pdf
set output "error.pdf"
set title "Monte Carlo Error Estimation"
set xlabel "Iterations"
set ylabel "Error
set zeroaxis
set yrange [-1:1]
set xrange [1:65536]
set logscale x 4
plot "pi_error1.dat" with lines lc "blue", "pi_error2.dat" with lines lc "red", "pi_error3.dat" with lines lc "green", "pi_error4.dat" with lines lc "orange"
END

