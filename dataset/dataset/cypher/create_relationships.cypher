// ------------------------------
// Create OWNS relationships
// Each Person owns 0–2 cars
// ------------------------------
MATCH (p:Person)
WITH p, rand() AS r
MATCH (c:Car)
WITH p, c, r
WHERE rand() < 0.0005   // controls total ~3000-4000 edges
CREATE (p)-[:OWNS]->(c);

// ------------------------------
// Create MADE_BY relationships
// Each Car has exactly 1 Producer
// ------------------------------
MATCH (c:Car)
WITH c, toInteger(rand() * 1000) AS pid
MATCH (pr:Producer {id: pid})
CREATE (c)-[:MADE_BY]->(pr);

// ------------------------------
// Create WORKS_ON relationships
// Each Person works on 0–3 projects
// ------------------------------
MATCH (p:Person)
WITH p
MATCH (pr:Project)
WHERE rand() < 0.0012
CREATE (p)-[:WORKS_ON]->(pr);

// ------------------------------
// Create FUNDED_BY relationships
// Each Project has 1–2 funding producers
// ------------------------------
MATCH (pr:Project)
WITH pr
MATCH (pd:Producer)
WHERE rand() < 0.0015
CREATE (pr)-[:FUNDED_BY]->(pd);
