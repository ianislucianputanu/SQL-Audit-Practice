CREATE DATABASE ProiectAudit;
USE ProiectAudit;

CREATE TABLE Tranzactii (
id_tranzactie INT PRIMARY KEY,
nume_client VARCHAR(50),
suma DECIMAL (10, 2),
data_tranzactie DATE,
tara VARCHAR(30),
cod_autorizare VARCHAR(10)
);

INSERT INTO Tranzactii VALUES
(1, 'Popescu Ion', 150.00, '2023-10-01', 'Romania', 'A100'),
(2, 'Ionescu Maria', 2450.00, '2023-10-01', 'Romania', 'A101'),
(3, 'Online Shop SRL', 120000.00, '2023-10-02', 'Insulele Cayman', 'ERROR'), 
(4, 'Georgescu Dan', 50.00, '2023-10-02', 'Romania', 'A102'),
(5, 'Popescu Ion', 150.00, '2023-10-01', 'Romania', 'A100'), 
(6, 'Teodor Andrei', 95000.00, '2023-10-03', 'Germania', NULL),
(7, 'Ionescu Maria', 3200.00, '2023-10-04', 'Romania', 'A105');

SELECT * FROM Tranzactii;
SELECT * FROM Tranzactii WHERE suma > 100000 AND tara = 'Insulele Cayman';
SELECT * FROM Tranzactii WHERE cod_autorizare IS NULL or cod_autorizare = 'ERROR';
SELECT nume_client, suma, data_tranzactie, COUNT(*) as nr_aparitii FROM Tranzactii GROUP BY nume_client, suma, data_tranzactie HAVING COUNT(*) > 1;