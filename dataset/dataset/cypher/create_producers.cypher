// Create 1,000 Producer nodes with metadata
UNWIND range(1,1000) AS id
CREATE (:Producer {
    id: id,
    country: ["USA","Germany","France","Japan","Canada"][toInteger(rand() * 5)],
    name: "Producer_" + id
});
