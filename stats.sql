/*
    Albei Liviu, Codreanu Radu, Florian Luca-Paul
    FMI, BDTS, Anul II, 2026
*/

/*
    If parameter vector_memory_size = 0, from SQLPLUS:

    ALTER SYSTEM SET vector_memory_size = 512M SCOPE=SPFILE;
    SHUTDOWN IMMEDIATE;
    STARTUP;
*/

CREATE VECTOR INDEX beasts_vec_idx ON beasts (description_vector)
ORGANIZATION INMEMORY NEIGHBOR GRAPH
DISTANCE COSINE
WITH TARGET ACCURACY 95;

EXPLAIN PLAN 
SET statement_id = 'hnsw'
FOR
SELECT b.name, b.physical_description, VECTOR_DISTANCE(b.description_vector, '[0.8, 0.2, 0.1]', COSINE) as dist
FROM beasts b
ORDER BY dist
FETCH FIRST 2 ROWS ONLY;

SELECT plan_table_output FROM TABLE(DBMS_XPLAN.DISPLAY('plan_table', 'with_index'));