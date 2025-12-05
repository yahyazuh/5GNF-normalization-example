// Test 5 — Supplier ↔ Customer city match (Before 5GNF)
PROFILE
MATCH (s:Supplier), (c:Customer)
WHERE s.city = c.city AND s.country = c.country
RETURN s.city AS city, count(*) AS matches;

