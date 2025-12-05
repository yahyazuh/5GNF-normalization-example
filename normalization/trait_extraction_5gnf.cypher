// =============================================
// TRAIT EXTRACTION — 5GNF
// PART 1 — Create constraints for trait nodes
// =============================================

// Constraint for LocationTrait (City, Country, PostalCode, Address, Region)
CREATE CONSTRAINT location_trait_unique IF NOT EXISTS
FOR (t:LocationTrait)
REQUIRE (t.city, t.country, t.postalCode, t.address, t.region) IS UNIQUE;

// Constraint for ShippingTrait (ShipCity, ShipCountry, ShipPostalCode, ShipAddress, ShipRegion)
CREATE CONSTRAINT shipping_trait_unique IF NOT EXISTS
FOR (t:ShippingTrait)
REQUIRE (t.shipCity, t.shipCountry, t.shipPostalCode, t.shipAddress, t.shipRegion) IS UNIQUE;

// =============================================
// PART 2 — Create LocationTrait nodes
// =============================================

// Extract and create unique LocationTrait nodes from Customers and Suppliers
MATCH (n)
WHERE n:Customer OR n:Supplier
WITH DISTINCT 
    n.city AS city,
    n.country AS country,
    n.postalCode AS postalCode,
    n.address AS address,
    n.region AS region
WHERE city IS NOT NULL OR country IS NOT NULL
MERGE (t:LocationTrait {
    city: city,
    country: country,
    postalCode: postalCode,
    address: address,
    region: region
});

// =============================================
// PART 3 — Link Customers to LocationTrait
// =============================================

MATCH (c:Customer)
MATCH (t:LocationTrait)
WHERE t.city = c.city
  AND t.country = c.country
MERGE (c)-[:HAS_LOCATION_TRAIT]->(t);


// =============================================
// PART 4 — Link Suppliers to LocationTrait
// =============================================

MATCH (s:Supplier)
MATCH (t:LocationTrait)
WHERE t.city = s.city
  AND t.country = s.country
MERGE (s)-[:HAS_LOCATION_TRAIT]->(t);



// =============================================
// PART 5 — Create ShippingTrait nodes
// =============================================

MATCH (o:Order)
WITH DISTINCT
    o.shipCity AS shipCity,
    o.shipCountry AS shipCountry,
    o.shipPostalCode AS shipPostalCode,
    o.shipAddress AS shipAddress,
    o.shipRegion AS shipRegion
WHERE shipCity IS NOT NULL OR shipCountry IS NOT NULL
MERGE (t:ShippingTrait {
    shipCity: shipCity,
    shipCountry: shipCountry,
    shipPostalCode: shipPostalCode,
    shipAddress: shipAddress,
    shipRegion: shipRegion
});


// =============================================
// PART 6 — Link Orders to ShippingTrait
// =============================================

MATCH (o:Order)
MATCH (t:ShippingTrait)
WHERE t.shipCity = o.shipCity
  AND t.shipCountry = o.shipCountry
MERGE (o)-[:HAS_SHIPPING_TRAIT]->(t);


// =============================================
// PART 7 — Verification Queries
// =============================================

// Verify that all Customers are linked to a LocationTrait
// (Customers, Linked Customers)
MATCH (c:Customer)
WITH collect(c) AS customers
RETURN size(customers) AS customers,
       size([x IN customers WHERE (x)-[:HAS_LOCATION_TRAIT]->()]) AS linked_customers;

// Verify that all Suppliers are linked to a LocationTrait
MATCH (s:Supplier)
WITH collect(s) AS suppliers
RETURN size(suppliers) AS suppliers,
       size([x IN suppliers WHERE (x)-[:HAS_LOCATION_TRAIT]->()]) AS linked_suppliers;

// Verify that all Orders are linked to a ShippingTrait
MATCH (o:Order)
WITH collect(o) AS orders
RETURN size(orders) AS orders,
       size([x IN orders WHERE (x)-[:HAS_SHIPPING_TRAIT]->()]) AS linked_orders;
