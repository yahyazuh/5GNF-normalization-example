// Test 3 — Filtering Orders by country (Before 5GNF)
PROFILE
MATCH (o:Order)
RETURN o.shipCountry AS country, count(*) AS total;

