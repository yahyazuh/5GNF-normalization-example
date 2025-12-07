
# 5GNF Normalization – Cypher Scripts & Experimental Evaluation  
This repository contains all Cypher scripts, normalization procedures, and performance experiments used in the research study:

**“Trait-Based Fifth Graph Normal Form (5GNF) for Property Graphs.”**

The repository provides:

- A complete running example demonstrating **0GNF → 5GNF**  
- Scripts to load a **real dataset (Northwind)** and run pre-5GNF Baseline Experiments  
- A full Cypher implementation of the **TraitExtraction5GNF** algorithm  
- Post-normalization analytical queries  
- Screenshots of execution plans (before & after 5GNF) for reproducibility  
- Graph diagrams used in the manuscript  

The code follows the **VLDB Reproducibility Guidelines** and is fully runnable under **Neo4j 5.x**.

---

#  Repository Structure

```

cypher/
0GNF.cypher
1GNF.cypher
2GNF.cypher
3GNF.cypher
4GNF.cypher
5GNF.cypher

dataset/
northwind_load.cypher
northwind_constraints.cypher

normalization/
trait_extraction_5gnf.cypher
delete_properties.cypher

experiments/
pre_5gnf/
test01_customer_city.cypher
test02_supplier_country.cypher
test03_orders_by_country.cypher
test04_customers_city_country.cypher
test05_supplier_customer_match.cypher

post_5gnf/
test01_customer_city_trait.cypher
test02_supplier_country_trait.cypher
test03_orders_by_country_trait.cypher
test04_customers_city_country_trait.cypher
test05_supplier_customer_match_trait.cypher

results/
before_5gnf/
(screenshots)
after_5gnf/
(screenshots)

graph/
figures used in manuscript

README.md

```

---

#  1. Running Example (0GNF → 5GNF)

The folder `/cypher/` contains a simple, pedagogical example demonstrating how a redundant property graph evolves through each normalization stage.

### Files

| File | Description |
|------|-------------|
| `0GNF.cypher` | Original graph with redundant metadata |
| `1GNF.cypher` | Extract domain values |
| `2GNF.cypher` | Separate producers from products |
| `3GNF.cypher` | Extract shared location |
| `4GNF.cypher` | Decompose technical metadata |
| `5GNF.cypher` | Apply Trait Extraction → Final 5GNF |

This example is used in the paper to illustrate the conceptual progression toward 5GNF.

---

#  2. Real Dataset (Northwind)

A real, widely used dataset (Northwind) was loaded into Neo4j using the scripts in:

```

dataset/

````

### 2.1 Dataset Loading

Run:

```cypher
:run dataset/northwind_constraints.cypher
:run dataset/northwind_load.cypher
````

This loads:

* **91 Customers**
* **29 Suppliers**
* **830 Products**
* **78 Categories**
* **~800 Orders**
* **Thousands of metadata attributes** (country, city, phone, region, etc.)

This real dataset replaces the synthetic dataset used in the earlier version of the paper and provides more realistic behavior for metadata redundancy and reuse.

---

#  3. TraitExtraction5GNF – Normalization Procedure

The full Cypher implementation of the 5GNF transformation is located in:

```
normalization/trait_extraction_5gnf.cypher
```

It performs the following steps:

1. Detect redundant metadata properties
2. Create **Trait** nodes for each distinct metadata value
3. Create **HAS_TRAIT** edges linking entities to traits
4. Ensure schema consistency (unique constraints)
5. Remove embedded metadata (optional cleanup)

After execution, all redundant properties (city, country, region, engine types, contact titles, etc.) become reusable traits.

---

# 📊 4. Experimental Evaluation

Experiments were executed before and after applying 5GNF.

## 4.1 Pre-5GNF (Baseline)

Queries inside:

```
experiments/pre_5gnf/
```

measure:

* DB hits
* runtime (ms)
* memory allocation
* execution plan behavior

Screenshots of Neo4j PROFILE results are stored under:

```
results/before_5gnf/
```

Example (Customer–City scan):

| Metric  | Value        |
| ------- | ------------ |
| DB Hits | 274          |
| Time    | 175 ms       |
| Memory  | 12,544 bytes |

---

## 4.2 Post-5GNF (Normalized Schema)

Queries inside:

```
experiments/post_5gnf/
```

perform the same analytics but using **Trait nodes** instead of embedded metadata.

Screenshots are stored in:

```
results/after_5gnf/
```

Example improvement:

| Query            | Before | After | Improvement    |
| ---------------- | ------ | ----- | -------------- |
| Customer by City | 175 ms | 82 ms | **53% faster** |

Even when performance does not improve, **schema clarity, metadata reuse, and complexity reduction** remain strong benefits.

---

# 🧪 5. Reproducing the Experiments

### Step 1 — Load Northwind

```cypher
:run dataset/northwind_constraints.cypher
:run dataset/northwind_load.cypher
```

### Step 2 — Run baseline experiments

```cypher
:run experiments/pre_5gnf/test01_customer_city.cypher
...
```

### Step 3 — Apply 5GNF

```cypher
:run normalization/trait_extraction_5gnf.cypher
```

### Step 4 — Run post-5GNF experiments

```cypher
:run experiments/post_5gnf/test01_customer_city_trait.cypher
...
```

### Step 5 — Compare execution plans

Results are provided in `/results/`.

---

# 📘 6. Academic Use

This repository is referenced in the manuscript submitted to ENASE/VLDB-style venues.
It provides:

* Reproducible Cypher code
* Clear normalization stages
* Real-dataset evaluation
* Before/after screenshots for verification

Feel free to cite or reuse the scripts in academic work.

---

#  Acknowledgements

This work builds upon:

* Neo4j 5.x Documentation
* Property-Graph Normalization literature
* Trait Dependency research foundations

---

#  Contact

For questions about the scripts or the 5GNF framework, contact:

**Yahya Sa'd**
yahyazuh (GitHub)


