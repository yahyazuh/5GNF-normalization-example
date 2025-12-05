// Test 4 — Customers by city + country (After 5GNF)
PROFILE
MATCH (c:Customer)-[:HAS_LOCATION_TRAIT]->(t:LocationTrait)
RETURN t.city AS city, t.country AS country, count(c) AS total;

