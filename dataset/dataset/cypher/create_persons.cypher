// Create 3,000 Person nodes with randomized metadata
UNWIND range(1,3000) AS id
CREATE (:Person {
    id: id,
    birthDate: date("1970-01-01") + duration({days: toInteger(rand() * 18000)}),
    country: ["USA","Germany","UK","Japan","Canada"][toInteger(rand() * 5)],
    city: ["Berlin","London","Tokyo","Toronto","New York"][toInteger(rand() * 5)]
});
