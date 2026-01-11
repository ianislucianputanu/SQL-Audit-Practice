import mysql.connector

try:
    conexiune = mysql.connector.connect(
        host="localhost",
        user="root",
        password="PAROLA_TA",
        database="ProiectAudit"
    )

    if conexiune.is_connected():
        cursor = conexiune.cursor()

        query = "SELECT * FROM Tranzactii WHERE cod_autorizare IS NULL OR cod_autorizare = 'ERROR'"
        cursor.execute(query)
        rezultate = cursor.fetchall()

        print("--- Raport Audit: Tranzacții cu anomalii ---")
        for rand in rezultate:
            print(f"ID: {rand[0]} | Client: {rand[1]} | Suma: {rand[2]} | Status: {rand[5]}")

except Exception as e:
    print("A aparut o eroare de conexiune. Verific datele serverului.")

finally:
    if 'conexiune' in locals() and conexiune.is_connected():
        cursor.close()
        conexiune.close()

