// =============================================
// REMOVE REDUNDANT METADATA AFTER 5GNF
// =============================================

// ---------------------------------------------
// Remove redundant location metadata from Customers
// ---------------------------------------------
MATCH (c:Customer)
REMOVE c.city,
       c.country,
       c.region,
       c.address,
       c.postalCode;


// ---------------------------------------------
// Remove redundant location metadata from Suppliers
// ---------------------------------------------
MATCH (s:Supplier)
REMOVE s.city,
       s.country,
       s.region,
       s.address,
       s.postalCode;


// ---------------------------------------------
// Remove redundant shipping metadata from Orders
// ---------------------------------------------
MATCH (o:Order)
REMOVE o.shipCity,
       o.shipCountry,
       o.shipRegion,
       o.shipAddress,
       o.shipPostalCode;

