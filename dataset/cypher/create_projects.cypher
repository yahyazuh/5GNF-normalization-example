// Create 2,000 Project nodes with randomized metadata
UNWIND range(1,2000) AS id
CREATE (:Project {
    id: id,
    startDate: date("2010-01-01") + duration({days: toInteger(rand() * 3000)}),
    topic: ["AI","ML","Databases","Graphs","Networks","Security","NLP","IoT","Cloud","Software"][toInteger(rand() * 10)],
    fundingAgency: ["NSF","ERC","HorizonEU","NIH","DFG"][toInteger(rand() * 5)]
});
