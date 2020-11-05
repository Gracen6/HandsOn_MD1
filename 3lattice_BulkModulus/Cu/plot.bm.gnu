#!/usr/bin/gnuplot -persist
set title "Equation of State of FCC"
set xlabel "Volume/atom (A^3)"
set ylabel "Energy/atom (eV)"

set size ratio 0.5
set key font ",8"
set tics font ",8"
set xtics 0.1
set ytics 0.0005


t(vo,v) = (vo/v)**.666666666666666667 - 1.0
e(eo,vo,ko,kop,v) = eo + 1.125*ko*vo*t(vo,v)*t(vo,v)* (1.0 + 0.5*(kop-4.0)*t(vo,v))
ef = -3.49
vf = 11.7
kf = 0.856
kfp = 4
fit e(ef,vf,kf,kfp,x) 'data' using 2:3 via ef,vf,kf,kfp
plot "data" u 2:3  t "Cu" w p pt 6, e(ef,vf,kf,kfp,x) t "Birch fit" w l

print ""
print "Results of 3rd order Birch fit:"
print ""
print "FCC Lattice:"
af = (4.0*vf)**.333333333333333
print ""
print "E_0 = ",ef," eV"
print "a_0 = ",af," Angstrom"
print "V_0 = ",vf," Angstrom**3"
print "B_0 = ",kf*160.2176565," GPa"
print "B_0'= ",kfp

pause -1