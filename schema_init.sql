/*
    Albei Liviu, Codreanu Radu, Florian Luca-Paul
    FMI, BDTS, Anul II, 2026
*/

-- Crearea tabelelor
CREATE TABLE habitats (
    habitat_id NUMBER PRIMARY KEY,
    climate VARCHAR2(50),
    geography VARCHAR2(50)
);

CREATE TABLE encounters (
    encounter_id NUMBER PRIMARY KEY,
    beast_id NUMBER,
    survival_rate NUMBER, 
    last_seen_year NUMBER
);

-- Crearea tabelului principal + vector
CREATE TABLE beasts (
    beast_id NUMBER PRIMARY KEY,
    habitat_id NUMBER REFERENCES habitats(habitat_id),
    name VARCHAR2(100),
    physical_description VARCHAR2(1000),
    description_vector VECTOR(3, FLOAT32)
);

-- Inserarea datelor
INSERT INTO habitats VALUES (1, 'Volcanic', 'Mountains');
INSERT INTO habitats VALUES (2, 'Temperate', 'Forest');
INSERT INTO habitats VALUES (3, 'Aquatic', 'Ocean');

INSERT INTO beasts VALUES (101, 1, 'Dragon', 'Massive fire-breathing winged reptile with thick scales.', '[0.9, 0.1, 0.1]');
INSERT INTO beasts VALUES (102, 2, 'Wyvern', 'Bipedal flying lizard with a barbed tail and venomous bite.', '[0.85, 0.15, 0.1]');
INSERT INTO beasts VALUES (103, 3, 'Kraken', 'Gigantic cephalopod with enormous tentacles.', '[0.1, 0.9, 0.1]');

INSERT INTO encounters VALUES (1001, 101, 5, 1450);
INSERT INTO encounters VALUES (1002, 102, 25, 1890);
INSERT INTO encounters VALUES (1003, 103, 10, 1700);

COMMIT;
