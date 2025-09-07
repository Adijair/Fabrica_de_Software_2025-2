CREATE SCHEMA worksshops;

USE worksshops;

CREATE TABLE carros (
name_carro varchar(40) not null,
ano_carro int(4) not null,
chassi int(17)  not null, /* modifiquei*/
PRIMARY KEY (chassi)
);

ALTER TABLE carros
ADD COLUMN placa
char (7) not null;

ALTER TABLE carros
MODIFY chassi VARCHAR(20);

INSERT INTO carros (name_carro, ano_carro, chassi, placa)
VALUES 
  ('Honda Civic EX', 2020, '9377004251', 'QWE1A23'),
  ('Chevrolet S10 LTZ', 2018, '8123009876', 'BCD2B45'),
  ('Toyota Corolla XRS', 2022, '3456003789', 'XYZ3C67');

UPDATE carros
SET ano_carro = 2019
WHERE chassi = '8123009876';

DELETE FROM carros
WHERE chassi = '3456003789';

/* ver a tabela*/

SELECT * FROM carros;

SELECT * FROM carros
WHERE ano_carro BETWEEN 2018 AND 2025
ORDER BY ano_carro ASC;

SELECT * FROM carros
WHERE ano_carro LIKE '2020%';

