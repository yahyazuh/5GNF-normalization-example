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

