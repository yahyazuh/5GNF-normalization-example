// Test 4 — Customers by city and country (Before 5GNF)
PROFILE
MATCH (c:Customer)
RETURN c.city AS city, c.country AS country, count(*) AS total;

