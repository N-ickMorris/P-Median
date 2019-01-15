param n;			#num of families

set P;				#parts
set M;				#machines
set F := 1..n;		#families

param a{P,M};		#P-M [1 0] Matrix
param w{M};			#weight assigned to M, based on ID number
param r default 1;	#Algebraic Constant

var x{P,F} binary;	#a P is/isn't assigned to a F
var y{F,F} binary;	#a F is/isn't created

minimize Dissimilarity: sum{p in P,f in F: p != f}(((sum{m in M}(w[m]*(abs(a[p,m] - a[f,m]))^(r)))^(1/r))*x[p,f]);
s.t. PartAssign{p in P}: sum{f in F}(x[p,f]) = 1;
s.t. MaxFam: sum{f in F}(y[f,f]) = n;
s.t. PartAssignLimit{p in P, f in F}: x[p,f] <= y[f,f];