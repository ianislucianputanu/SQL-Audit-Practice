# Automatizare Calcul TVA - SQL Native

### Descrierea Proiectului
O soluție de audit preventiv implementată direct în motorul bazei de date. Sistemul asigură integritatea prețurilor prin calcularea automată a taxelor (TVA) și a prețului final fără intervenție manuală. 

### Scenarii de Audit Verificate
* **Validarea Calculelor:** Sincronizarea automată a TVA-ului la inserarea produselor noi.
* **Corecția Datelor la Update:** Recalcularea automată a prețului total la modificarea prețului net, gestionând setările de siguranță ale serverului.

* ### Tehnologii
* * **SQL (MySQL):** Utilizarea Stored Functions și Triggers (BEFORE INSERT/UPDATE).

  ### Rezultate
  * **Eliminarea Erorilor:** Prevenirea erorilor de tip "Safe Update" și asigurarea existenței obiectelor în baza de date prin proceduri de curățare automate. 
