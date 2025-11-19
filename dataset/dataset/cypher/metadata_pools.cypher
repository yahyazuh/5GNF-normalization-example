// Metadata pools for synthetic dataset generation
WITH
["USA","Germany","France","Japan","Canada","UK"] AS countries,
["Berlin","London","Tokyo","New York","Munich","Toronto"] AS cities,
["V6","V8","Hybrid","Electric","Diesel"] AS engines,
["NSF","ERC","HorizonEU","NIH","DFG"] AS agencies
RETURN countries, cities, engines, agencies;
