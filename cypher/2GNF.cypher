// Create Person nodes
CREATE 
  (p1:Person {
    name: "John",
    surname: "Doe",
    birthdate: date("1985-05-15"),
    country: "USA",
    city: "New York",
    street: "5th Avenue"
  }),
  
  (p2:Person {
    name: "Jane",
    surname: "Smith", 
    birthdate: date("1990-08-22"),
    country: "UK",
    city: "London",
    street: "Baker Street"
  });

// Create Producer nodes (separated from cars as per 2nd NF)
CREATE
  (prod1:Producer {
    name: "AutoCorp",
    fullname: "Auto Corporation Ltd.",
    country: "Germany", 
    city: "Berlin",
    street: "Hauptstrasse"
  }),
  
  (prod2:Producer {
    name: "CarMakers",
    fullname: "Car Makers Inc.",
    country: "Japan",
    city: "Tokyo",
    street: "Shibuya Street"
  }),
  
  (prod3:Producer {
    name: "EcoDrive",
    fullname: "Eco Drive Technologies",
    country: "USA",
    city: "San Francisco",
    street: "Tech Avenue"
  }),
  
  (prod4:Producer {
    name: "FutureMobility",
    fullname: "Future Mobility Solutions",
    country: "China",
    city: "Shanghai",
    street: "Innovation Road"
  });

// Create CombustionCar nodes (without producer details - references Producer)
CREATE
  (cc1:CombustionCar {
    label: "Sedan",
    model: "Model X",
    emissions: 150,
    made: date("2020-03-10")
  }),
  
  (cc2:CombustionCar {
    label: "SUV",
    model: "Explorer",
    emissions: 200,
    made: date("2021-07-15")
  });

// Create ElectricCar nodes (without producer details - references Producer)  
CREATE
  (ec1:ElectricCar {
    label: "Compact",
    model: "E-100",
    range: 350,
    made: date("2022-01-20")
  }),
  
  (ec2:ElectricCar {
    label: "Luxury", 
    model: "PowerElite",
    range: 500,
    made: date("2023-05-08")
  });

// Create PRODUCED_BY relationships
MATCH (cc1:CombustionCar {model: "Model X"})
MATCH (prod1:Producer {name: "AutoCorp"})
CREATE (cc1)-[:PRODUCED_BY]->(prod1);

MATCH (cc2:CombustionCar {model: "Explorer"})
MATCH (prod2:Producer {name: "CarMakers"})
CREATE (cc2)-[:PRODUCED_BY]->(prod2);

MATCH (ec1:ElectricCar {model: "E-100"})
MATCH (prod3:Producer {name: "EcoDrive"})
CREATE (ec1)-[:PRODUCED_BY]->(prod3);

MATCH (ec2:ElectricCar {model: "PowerElite"})
MATCH (prod4:Producer {name: "FutureMobility"})
CREATE (ec2)-[:PRODUCED_BY]->(prod4);

// Create OWNS relationships
MATCH (p1:Person {name: "John", surname: "Doe"})
MATCH (cc1:CombustionCar {model: "Model X"})
MATCH (ec1:ElectricCar {model: "E-100"})
CREATE (p1)-[:OWNS]->(cc1), (p1)-[:OWNS]->(ec1);

MATCH (p2:Person {name: "Jane", surname: "Smith"}) 
MATCH (cc2:CombustionCar {model: "Explorer"})
MATCH (ec2:ElectricCar {model: "PowerElite"})
CREATE (p2)-[:OWNS]->(cc2), (p2)-[:OWNS]->(ec2);
