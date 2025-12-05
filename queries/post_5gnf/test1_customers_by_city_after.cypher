// Test 1 — Customer metadata scan (After 5GNF)
PROFILE
MATCH (c:Customer)-[:HAS_LOCATION_TRAIT]->(t:LocationTrait)
RETURN t.city AS city, count(c) AS total;

