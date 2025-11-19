# 5GNF Normalization – Cypher Scripts and Experimental Evaluation

This repository contains all runnable Cypher scripts, dataset generators, trait-extraction procedures, and performance queries used in the paper:

**“Trait-Based Fifth Graph Normal Form (5GNF) for Property Graphs”**

The repository includes:

1. A simple running example demonstrating 0GNF → 5GNF.
2. The full large-scale experimental evaluation used in Section 6 of the paper.
3. Cypher scripts for dataset generation, normalization, and performance profiling.
4. Graph diagrams used in the manuscript.

This package is designed to be *fully reproducible* and follows the **VLDB Reproducibility Guidelines**.

---

# 📘 Part 1 — Running Example (0GNF → 5GNF)

The folder `/cypher/` contains six Cypher scripts showing step-by-step normalization:

Files:
| File          | Description                                        |
| ------------- | -------------------------------------------------- |
| `0GNF.cypher` | Initial unnormalized graph with redundant metadata |
| `1GNF.cypher` | Domain extraction begins                           |
| `2GNF.cypher` | Producer separated from Car                        |
| `3GNF.cypher` | Location extracted                                 |
| `4GNF.cypher` | Technical metadata decomposed                      |
| `5GNF.cypher` | Trait extraction; final 5GNF schema                |

## 🔧 How to Run the Example

1. Install Neo4j Desktop or use the web browser version:  
   https://browser.neo4j.io

2. Create a blank Neo4j database.

3. Run the files **in order**:


## 📊 Final Schema Includes:
- `TemporalTrait`  
- `LocationTrait`  
- `TechTrait`  
- `(:Entity)-[:HAS_TRAIT]->(:Trait)` edges  
- Clean domain nodes (`Person`, `Car`, `Producer`)  

The schema diagram (`5gnf.png`) is available in `/graph/`.

---

# 🧪 Part 2 — Experimental Evaluation (Section 6 of the Paper)

The folder `/dataset/cypher/` contains all scripts used to generate the large synthetic dataset used in Section 6.

### 📂 Dataset Generation Scripts

metadata_pools.cypher
create_persons.cypher
create_cars.cypher
create_producers.cypher
create_projects.cypher
create_relationships.cypher
trait_extraction_5gnf.cypher
experimental_queries.cypher

These scripts reproduce the full experiment described in the paper:

- ~12,000 nodes  
- ~55,000 edges  
- Metadata redundancy across entity nodes  
- Trait extraction producing ~4,500 trait nodes  
- ~18,000 HAS_TRAIT edges  
- Profiling queries before and after normalization  

---

# 🚀 How to Run the Full Experiment

## 1. Start Neo4j (Docker recommended)

Run Neo4j 5.x with APOC enabled:

docker run --name neo4j-5gnf ^
-p 7474:7474 -p 7687:7687 ^
-v <YOUR_LOCAL_PATH>:/data ^
-e NEO4J_AUTH=neo4j/adminpass ^
-e NEO4J_PLUGINS='["apoc"]' ^
neo4j:5.24

Then open:
http://localhost:7474

Login:
username: neo4j
password: adminpass

---

## 2. Generate the Dataset

Run these in order:

metadata_pools.cypher
create_persons.cypher
create_cars.cypher
create_producers.cypher
create_projects.cypher
create_relationships.cypher

This produces the raw (unnormalized) dataset.

---

## 3. Apply the 5GNF Trait Extraction

Run:

trait_extraction_5gnf.cypher

This script:
- identifies repeated metadata  
- creates canonical Trait nodes  
- connects entities using `HAS_TRAIT`  
- removes redundant attributes  

---

## 4. Run the Experimental Performance Queries

experimental_queries.cypher


This includes:
- baseline queries (before 5GNF)  
- trait-based queries (after 5GNF)  
- `PROFILE` instrumentation  

These reproduce the results shown in Section 6 of the manuscript.

---

# 📈 Expected Results

The results should match Section 6 of the paper:

- **Redundant metadata removed**
- **Trait reuse increased**
- **Schema complexity reduced**
- **Query performance improved**
- **Counts identical or similar to those reported**

---

# 🔄 Reproducibility

This repository follows the official **VLDB Reproducibility Guidelines**:  
https://vldb.org/pvldb/reproducibility/

All experiments can be reproduced by executing the included scripts in sequence.

---

# 📩 Contact

For questions, collaborations, or replication issues:

**Yahya Sa'd**  
GitHub: https://github.com/yahyazuh

