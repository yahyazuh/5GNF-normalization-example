// ===============================
// 1. Load Customers
// ===============================

LOAD CSV WITH HEADERS FROM 'file:///northwind/customers.csv' AS row
WITH row
WHERE row.customerID IS NOT NULL
CREATE (c:Customer {
    customerID: row.customerID,
    contactName: row.contactName,
    contactTitle: row.contactTitle,
    companyName: row.companyName,
    phone: row.phone,
    city: row.city,
    country: row.country,
    address: row.address,
    postalCode: row.postalCode
});


// ===============================
// 2. Load Suppliers
// ===============================

LOAD CSV WITH HEADERS FROM 'file:///northwind/suppliers.csv' AS row
WITH row
WHERE row.supplierID IS NOT NULL
CREATE (s:Supplier {
    supplierID: row.supplierID,
    companyName: row.companyName,
    contactName: row.contactName,
    contactTitle: row.contactTitle,
    phone: row.phone,
    homePage: row.homePage,
    city: row.city,
    country: row.country,
    address: row.address,
    postalCode: row.postalCode
});


// ===============================
// 3. Load Orders
// ===============================

LOAD CSV WITH HEADERS FROM 'file:///northwind/orders.csv' AS row
WITH row
WHERE row.orderID IS NOT NULL
CREATE (o:Order {
    orderID: row.orderID,
    shipName: row.shipName,
    shipAddress: row.shipAddress,
    shipCity: row.shipCity,
    shipCountry: row.shipCountry,
    freight: row.freight,
    orderDate: row.orderDate,
    requiredDate: row.requiredDate,
    shippedDate: row.shippedDate,
    employeeID: row.employeeID
});


// ===============================
// 4. Link Orders → Customers
// ===============================

LOAD CSV WITH HEADERS FROM 'file:///northwind/orders.csv' AS row
MATCH (o:Order {orderID: row.orderID})
MATCH (c:Customer {customerID: row.customerID})
MERGE (c)-[:PLACED_ORDER]->(o);


// ===============================
// 5. Link Orders → Suppliers
// ===============================

LOAD CSV WITH HEADERS FROM 'file:///northwind/order_details.csv' AS row
MATCH (o:Order {orderID: row.orderID})
MATCH (s:Supplier {supplierID: row.supplierID})
MERGE (s)-[:SUPPLIED_ORDER]->(o);

