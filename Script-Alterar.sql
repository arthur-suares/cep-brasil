Use cepBrasil;

UPDATE LOGRADOURO
SET latitude = NULL
WHERE latitude IS NOT NULL AND latitude NOT REGEXP '^-?[0-9]+(\.[0-9]+)?$';

UPDATE LOGRADOURO
SET longitude = NULL
WHERE longitude IS NOT NULL AND longitude NOT REGEXP '^-?[0-9]+(\.[0-9]+)?$';


ALTER TABLE LOGRADOURO
    MODIFY latitude FLOAT,
    MODIFY longitude FLOAT;
