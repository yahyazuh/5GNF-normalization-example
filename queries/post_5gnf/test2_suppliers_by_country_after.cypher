// Test 2 — Supplier metadata scan (After 5GNF)
PROFILE
MATCH (s:Supplier)-[:HAS_LOCATION_TRAIT]->(t:LocationTrait)
RETURN t.country AS country, count(s) AS total;

