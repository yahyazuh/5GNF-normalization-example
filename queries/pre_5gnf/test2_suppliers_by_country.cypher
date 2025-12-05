// Test 2 — Supplier metadata scan (Before 5GNF)
PROFILE
MATCH (s:Supplier)
RETURN s.country AS country, count(*) AS total;

