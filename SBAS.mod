set REGIONS;
set AIRPORTS;
param T{REGIONS,AIRPORTS};
param costs{AIRPORTS}>=0;

# Decision variables
var x{AIRPORTS} binary ;

# Objective function
minimize total_cost: sum{i in AIRPORTS} costs [i]*x[i];

# Constraints (2 stations for every zones for redundancy)
subject to covering{j in REGIONS}: sum{i in AIRPORTS}T[j,i]*x[i]>=1;
