// Create Person nodes with embedded car data (unstructured format )
CREATE 
  (p1:Person {
    // Personal information
    name: "John",
    surname: "Doe",
    birthdate: date("1985-05-15"),
    country: "USA",
    city: "New York",
    street: "5th Avenue",
    
    // 1st Car (Combustion Car)
    car1_label: "Sedan",
    car1_model: "Model X",
    car1_emissions: 150,
    car1_range: NULL,
    car1_made: date("2020-03-10"),
    car1_producer_name: "AutoCorp",
    car1_producer_fullname: "Auto Corporation Ltd.",
    car1_producer_country: "Germany",
    car1_producer_city: "Berlin",
    car1_producer_street: "Hauptstrasse",
    
    // 2nd Car (Electric Car)
    car2_label: "Compact",
    car2_model: "E-100",
    car2_emissions: NULL,
    car2_range: 350,
    car2_made: date("2022-01-20"),
    car2_producer_name: "EcoDrive",
    car2_producer_fullname: "Eco Drive Technologies",
    car2_producer_country: "USA",
    car2_producer_city: "San Francisco",
    car2_producer_street: "Tech Avenue"
  }),
  
  (p2:Person {
    // Personal information
    name: "Jane",
    surname: "Smith",
    birthdate: date("1990-08-22"),
    country: "UK",
    city: "London",
    street: "Baker Street",
    
    // 1st Car (Combustion Car)
    car1_label: "SUV",
    car1_model: "Explorer",
    car1_emissions: 200,
    car1_range: NULL,
    car1_made: date("2021-07-15"),
    car1_producer_name: "CarMakers",
    car1_producer_fullname: "Car Makers Inc.",
    car1_producer_country: "Japan",
    car1_producer_city: "Tokyo",
    car1_producer_street: "Shibuya Street",
    
    // 2nd Car (Electric Car)
    car2_label: "Luxury",
    car2_model: "PowerElite",
    car2_emissions: NULL,
    car2_range: 500,
    car2_made: date("2023-05-08"),
    car2_producer_name: "FutureMobility",
    car2_producer_fullname: "Future Mobility Solutions",
    car2_producer_country: "China",
    car2_producer_city: "Shanghai",
    car2_producer_street: "Innovation Road"
  });
