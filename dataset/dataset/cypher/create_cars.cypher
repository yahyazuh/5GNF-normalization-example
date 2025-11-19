// Create 2,000 Car nodes with randomized metadata
UNWIND range(1,2000) AS id
CREATE (:Car {
    id: id,
    manufactureDate: date("2000-01-01") + duration({days: toInteger(rand() * 7000)}),
    engineType: ["V6","V8","Hybrid","Electric","Diesel"][toInteger(rand() * 5)]
});
