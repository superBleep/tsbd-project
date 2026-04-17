/*
    Albei Liviu, Codreanu Radu, Florian Luca-Paul
    FMI, BDTS, Anul II, 2026
*/

SELECT 
    b.name, 
    b.physical_description,
    h.geography,
    e.survival_rate,
    VECTOR_DISTANCE(b.description_vector, '[0.88, 0.12, 0.1]', COSINE) AS distance
FROM beasts b
JOIN habitats h ON b.habitat_id = h.habitat_id
JOIN encounters e ON b.beast_id = e.beast_id
WHERE e.survival_rate > 10
ORDER BY distance ASC;
