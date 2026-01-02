# Audit Financiar - Simularea Integrității Datelor prin SQL

### Descrierea Proiectului
Am construit o bază de date pentru tranzacții financiare în MySQL pentru a testa capacitatea de identificare a anomaliilor de sistem prin interogări SQL.

### Scenarii de Audit Verificate
Am implementat scripturi pentru a extrage automat următoarele tipuri de excepții:
* **Erori de autorizare:** Identificarea tranzacțiilor cu valori 'NULL' sau 'ERROR' (procesări eșuate).
* **Tranzacții de risc:** Filtrarea sumelor mari provenite din jurisdicții specifice (ex: Insulele Cayman).
* **Integritatea datelor:** Verificarea structurii corecte a tabelului și popularea cu date de test.

### Tehnologii
* **MySQL Server 8.0**
* **MySQL Workbench**

### Rezultate
Proiectul demonstrează utilizarea clauzelor 'WHERE', 'AND' și 'OR' pentru a genera rapoarte de excepție necesare în verificarea conformității datelor financiare.
