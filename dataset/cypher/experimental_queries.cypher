/*
========================================================
  5GNF EXPERIMENTAL PERFORMANCE QUERIES
  This file contains all Cypher queries used to measure
  performance before and after applying 5GNF normalization.
========================================================
*/

/*
========================================================
 SECTION 1 — BASELINE QUERIES (Before 5GNF)
========================================================
*/

PROFILE
MATCH (p:Person)
WHERE p.country = 'Germany'
RETURN count(p);

PROFILE
MATCH (c:Car)
WHERE c.engineType = 'V8'
RETURN count(c);

PROFILE
MATCH (p:Project)
WHERE p.topic = 'AI'
RETURN count(p);


/*
========================================================
 SECTION 2 — POST-5GNF QUERIES (After TraitExtraction5GNF)
========================================================
*/

PROFILE
MATCH (p:Person)-[:HAS_TRAIT]->(:Trait {type:'Country', value:'Germany'})
RETURN count(p);

PROFILE
MATCH (c:Car)-[:HAS_TRAIT]->(:Trait {type:'Engine', value:'V8'})
RETURN count(c);

PROFILE
MATCH (p:Project)-[:HAS_TRAIT]->(:Trait {type:'Topic', value:'AI'})
RETURN count(p);
