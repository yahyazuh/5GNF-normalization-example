// =============================================
// 5GNF Trait Extraction Algorithm (Neo4j 5.x)
// =============================================

// 1. Extract CountryTrait
MATCH (n)
WHERE n.country IS NOT NULL
MERGE (t:Trait {type:'Country', value:n.country})
CREATE (n)-[:HAS_TRAIT]->(t)
REMOVE n.country;

// 2. Extract CityTrait
MATCH (n)
WHERE n.city IS NOT NULL
MERGE (t:Trait {type:'City', value:n.city})
CREATE (n)-[:HAS_TRAIT]->(t)
REMOVE n.city;

// 3. Extract EngineTrait
MATCH (c:Car)
WHERE c.engineType IS NOT NULL
MERGE (t:Trait {type:'Engine', value:c.engineType})
CREATE (c)-[:HAS_TRAIT]->(t)
REMOVE c.engineType;

// 4. Extract TopicTrait
MATCH (p:Project)
WHERE p.topic IS NOT NULL
MERGE (t:Trait {type:'Topic', value:p.topic})
CREATE (p)-[:HAS_TRAIT]->(t)
REMOVE p.topic;

// 5. Extract FundingAgencyTrait
MATCH (p:Project)
WHERE p.fundingAgency IS NOT NULL
MERGE (t:Trait {type:'FundingAgency', value:p.fundingAgency})
CREATE (p)-[:HAS_TRAIT]->(t)
REMOVE p.fundingAgency;

// 6. Extract BirthDateTrait
MATCH (p:Person)
WHERE p.birthDate IS NOT NULL
MERGE (t:Trait {type:'BirthDate', value:toString(p.birthDate)})
CREATE (p)-[:HAS_TRAIT]->(t)
REMOVE p.birthDate;

// 7. Extract ManufactureDateTrait
MATCH (c:Car)
WHERE c.manufactureDate IS NOT NULL
MERGE (t:Trait {type:'ManufactureDate', value:toString(c.manufactureDate)})
CREATE (c)-[:HAS_TRAIT]->(t)
REMOVE c.manufactureDate;

// =============================================
// Create index on trait value (NEEDED for performance)
// =============================================
CREATE INDEX trait_value_index FOR (t:Trait) ON (t.value);
