5GNF Normalization – Cypher Scripts (0GNF → 5GNF)

This repository contains the runnable Cypher scripts used in the paper
“Trait-Based Fifth Graph Normal Form (5GNF) for Property Graphs”.

The scripts demonstrate step-by-step normalization of a simple running example from 0GNF (unnormalized) to 5GNF (fully trait-based normalization).

How to Reproduce

1. Install Neo4j Desktop or use Neo4j Browser (https://browser.neo4j.io).
2. Create a new project and open a blank graph.
3. Run each Cypher file in the following order:
. 0GNF.cypher
. 1GNF.cypher
. 2GNF.cypher
. 3GNF.cypher
. 4GNF.cypher
. 5GNF.cypher

4. After running 5GNF.cypher, you will see the final normalized schema with:
. TemporalTrait
. LocationTrait
. TechTrait
. HAS_TRAIT edges
. Clean domain nodes (Person, Car, Producer)

Files:
| File          | Description                                        |
| ------------- | -------------------------------------------------- |
| `0GNF.cypher` | Initial unnormalized graph with redundant metadata |
| `1GNF.cypher` | Domain extraction begins                           |
| `2GNF.cypher` | Producer separated from Car                        |
| `3GNF.cypher` | Location extracted                                 |
| `4GNF.cypher` | Technical metadata decomposed                      |
| `5GNF.cypher` | Trait extraction; final 5GNF schema                |


Figures

The final schema (Figure X in the paper) is included as 5gnf.png.
