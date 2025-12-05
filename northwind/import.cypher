// ============================================================================
// Northwind Dataset: Complete Graph Import Script for Neo4j 5
// ----------------------------------------------------------------------------
// This Cypher script loads the canonical Northwind dataset into Neo4j using
// MERGE-based entity construction, schema constraints, and explicit type 
// conversions. The dataset is obtained from Neo4j's public repository:
//
//   https://data.neo4j.com/northwind/
//
// The script guarantees idempotency (safe to re-run) and establishes all 
// structural relationships between Products, Categories, Customers, Orders, 
// Suppliers, and Order Details. Numeric attributes are converted to the 
// appropriate types to support analytical workloads.
// ============================================================================


// ============================================================================
// 1. Schema Constraints
//    Ensures uniqueness and enables MERGE-based loading without duplication.
// ============================================================================

CREATE CONSTRAINT Product_productID IF NOT EXISTS
FOR (p:Product) REQUIRE p.productID IS UNIQUE;

CREATE CONSTRAINT Category_categoryID IF NOT EXISTS
FOR (c:Category) REQUIRE c.categoryID IS UNIQUE;

CREATE CONSTRAINT Supplier_supplierID IF NOT EXISTS
FOR (s:Supplier) REQUIRE s.supplierID IS UNIQUE;

CREATE CONSTRAINT Customer_customerID IF NOT EXISTS
FOR (c:Customer) REQUIRE c.customerID IS UNIQUE;

CREATE CONSTRAINT Order_orderID IF NOT EXISTS
FOR (o:Order) REQUIRE o.orderID IS UNIQUE;


// ============================================================================
// 2. Load Product Nodes
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/products.csv" AS row
MERGE (p:Product {productID: row.productID})
SET p.productName     = row.productName,
    p.quantityPerUnit = row.quantityPerUnit,
    p.unitPrice       = toFloat(row.unitPrice),
    p.unitsInStock    = toInteger(row.unitsInStock),
    p.unitsOnOrder    = toInteger(row.unitsOnOrder),
    p.reorderLevel    = toInteger(row.reorderLevel),
    p.discontinued    = (row.discontinued <> "0"),
    p.categoryID      = row.categoryID,
    p.supplierID      = row.supplierID;


// ============================================================================
// 3. Load Category Nodes
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/categories.csv" AS row
MERGE (c:Category {categoryID: row.categoryID})
SET c.categoryName        = row.categoryName,
    c.description         = row.description;


// ============================================================================
// 4. Load Supplier Nodes
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/suppliers.csv" AS row
MERGE (s:Supplier {supplierID: row.supplierID})
SET s.companyName   = row.companyName,
    s.contactName   = row.contactName,
    s.contactTitle  = row.contactTitle,
    s.address       = row.address,
    s.city          = row.city,
    s.region        = row.region,
    s.postalCode    = row.postalCode,
    s.country       = row.country,
    s.phone         = row.phone,
    s.homePage      = row.homePage;


// ============================================================================
// 5. Establish Product → Category Relationships
// ============================================================================

MATCH (p:Product), (c:Category)
WHERE p.categoryID = c.categoryID
MERGE (p)-[:PART_OF]->(c);


// ============================================================================
// 6. Establish Supplier → Product Relationships
// ============================================================================

MATCH (p:Product), (s:Supplier)
WHERE p.supplierID = s.supplierID
MERGE (s)-[:SUPPLIES]->(p);


// ============================================================================
// 7. Load Customer Nodes
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/customers.csv" AS row
MERGE (c:Customer {customerID: row.customerID})
SET c.companyName   = row.companyName,
    c.contactName   = row.contactName,
    c.contactTitle  = row.contactTitle,
    c.address       = row.address,
    c.city          = row.city,
    c.region        = row.region,
    c.postalCode    = row.postalCode,
    c.country       = row.country,
    c.phone         = row.phone;


// ============================================================================
// 8. Load Order Nodes
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/orders.csv" AS row
MERGE (o:Order {orderID: row.orderID})
SET o.orderDate     = row.orderDate,
    o.requiredDate  = row.requiredDate,
    o.shippedDate   = row.shippedDate,
    o.freight       = row.freight,
    o.shipName      = row.shipName,
    o.shipAddress   = row.shipAddress,
    o.shipCity      = row.shipCity,
    o.shipRegion    = row.shipRegion,
    o.shipPostalCode= row.shipPostalCode,
    o.shipCountry   = row.shipCountry,
    o.customerID    = row.customerID;


// ============================================================================
// 9. Establish Customer → Order Relationships
// ============================================================================

MATCH (c:Customer), (o:Order)
WHERE c.customerID = o.customerID
MERGE (c)-[:PURCHASED]->(o);


// ============================================================================
// 10. Load Order Details (Order → Product items)
// ============================================================================

LOAD CSV WITH HEADERS FROM "https://data.neo4j.com/northwind/order-details.csv" AS row
MATCH (o:Order {orderID: row.orderID})
MATCH (p:Product {productID: row.productID})
MERGE (o)-[r:ORDERS]->(p)
SET r.unitPrice = toFloat(row.unitPrice),
    r.quantity  = toInteger(row.quantity),
    r.discount  = toFloat(row.discount);


// ============================================================================
// End of Script
// ============================================================================


