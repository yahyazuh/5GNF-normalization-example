// Test 3 — Filtering Orders by country (After 5GNF)
PROFILE
MATCH (o:Order)-[:HAS_SHIPPING_TRAIT]->(t:ShippingTrait)
RETURN t.shipCountry AS country, count(o) AS total;

