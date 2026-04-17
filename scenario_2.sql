/*
    Albei Liviu, Codreanu Radu, Florian Luca-Paul
    FMI, BDTS, Anul II, 2026
*/

SELECT name, physical_description,
       VECTOR_DISTANCE(description_vector, '[0.88, 0.12, 0.1]', COSINE) as distance
FROM beasts
ORDER BY distance ASC;
