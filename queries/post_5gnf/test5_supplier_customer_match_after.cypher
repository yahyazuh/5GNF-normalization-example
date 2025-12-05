// Test 5 — Supplier ↔ Customer city match (After 5GNF)
PROFILE
MATCH (s:Supplier)-[:HAS_LOCATION_TRAIT]->(ts:LocationTrait),
      (c:Customer)-[:HAS_LOCATION_TRAIT]->(tc:LocationTrait)
WHERE ts.city = tc.city
  AND ts.country = tc.country
RETURN ts.city AS city, count(*) AS matches;

