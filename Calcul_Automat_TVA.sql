CREATE DATABASE IF NOT EXISTS gestiune_magazin;
USE gestiune_magazin;

DROP TABLE IF EXISTS Produse;
CREATE TABLE Produse(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(100),
    pret_fara_tva DECIMAL (10,2),
    cota_tva INT DEFAULT 19,
    valoare_tva DECIMAL (10,2),
    pret_total DECIMAL (10,2)
);

DELIMITER //
DROP FUNCTION IF EXISTS calculeaza_tva // 
CREATE FUNCTION calculeaza_tva(pret DECIMAL (10,2), cota INT)
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
	RETURN (pret * cota / 100);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_insereaza_tva
BEFORE INSERT ON Produse
FOR EACH ROW
BEGIN
	SET NEW.valoare_tva = calculeaza_tva(NEW.pret_fara_tva, NEW.cota_tva);
    SET NEW.pret_total = NEW.pret_fara_tva + NEW.valoare_tva;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_actualizeaza_tva
BEFORE UPDATE ON Produse
FOR EACH ROW
BEGIN
	SET NEW.valoare_tva = calculeaza_tva(NEW.pret_fara_tva, NEW.cota_tva);
    SET NEW.pret_total = NEW.pret_fara_tva + NEW.valoare_tva;
END //
DELIMITER ;

INSERT INTO PRODUSE (nume, pret_fara_tva, cota_tva)
VALUES ('Monitor LED', 1000.00, 19);
SET SQL_SAFE_UPDATES = 0;
UPDATE PRODUSE SET pret_fara_tva = 2000.00 WHERE nume = 'Monitor Led';
SELECT * FROM Produse;

