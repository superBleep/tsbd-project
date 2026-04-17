/*
    Albei Liviu, Codreanu Radu, Florian Luca-Paul
    FMI, BDTS, Anul II, 2026
*/

SELECT b.name, b.physical_description, h.geography, e.survival_rate
FROM beasts b
JOIN habitats h ON b.habitat_id = h.habitat_id
JOIN encounters e ON b.beast_id = e.beast_id
WHERE b.physical_description LIKE '%dragon%'
  AND e.survival_rate > 10;
