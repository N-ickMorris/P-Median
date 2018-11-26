param n;			#num of families

set P;				#parts
set M;				#machines
set F := 1..n;		#families

param a{P,M};		#P-M Assignment Matrix
param u{M};			#utilization of M

var x{P,F} binary;	#a P is/isn't assigned to a F

minimize Dissimilarity: sum{p in P, k in P, f in F, m in M: p != k}((1/u[m]) * ((a[p,m] - a[k,m])^2) * x[p,f]);  #
s.t. PartAssign{p in P}: sum{f in F}(x[p,f]) = 1; # 

