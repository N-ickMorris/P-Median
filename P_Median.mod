param q; # number of workers

set P; # parts
set M; # machines
set W := 1..q; # workers

param a{P,M}; # P-M Assignment Matrix
param u{M}; # utilization/importance of M

var x{P,W} binary; # a P is/isn't assigned to a W
var y{W,M} binary; # a W is/isn't assigned to a M

minimize Dissimilarity: sum{w in W, m in M}(y[w,m] * (1 / u[m]) * sum{p in P, k in P}((a[p,m] - a[k,m])^2) * (1 / sum{p in P}(a[p,m]))); # assign workers to machines with minimal mistakes
s.t. PartAssign{p in P}: sum{w in W}(x[p,w]) = 1; # every part must be assigned to a worker
s.t. WorkerLimit{m in M}: 1 <= sum{w in W}(y[w,m]) <= q; # every machine must be assigned to at least one worker
s.t. AssignLimit{p in P, w in W}: x[p,w] <= sum{m in M}(y[w,m] * a[p,m]); # a part can only be assigned to a worker if the worker is assigned to a machine that can make the part



