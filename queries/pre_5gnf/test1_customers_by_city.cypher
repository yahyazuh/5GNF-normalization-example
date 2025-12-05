// Test 1 — Customer metadata scan (Before 5GNF)
PROFILE
MATCH (c:Customer)
RETURN c.city AS city, count(*) AS total;

