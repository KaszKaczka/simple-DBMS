from flask import Flask, render_template, request, jsonify, redirect, url_for, session, flash
import pymysql
from werkzeug.security import check_password_hash, generate_password_hash

app = Flask(__name__)
app.secret_key = 'your_secret_key_here'

# Konfiguracja połączenia z bazą MySQL
db_config = {
    'user': 'root',
    'password': '2203',
    'host': 'localhost',
    'database': 'rekinki',
    'charset': 'utf8mb4'
}

# Przykładowa baza danych użytkowników (z hashowaniem haseł)
users = {
    "admin": generate_password_hash("password123"),
    "user1": generate_password_hash("mypassword")
}

# Funkcja do pobierania danych z tabeli
def pobieranie_danych(table_name):
    connection = pymysql.connect(**db_config)
    try:
        with connection.cursor() as cursor:
            cursor.execute(f"SELECT * FROM {table_name}")
            columns = [desc[0] for desc in cursor.description]  # Nazwy kolumn
            rows = cursor.fetchall()  # Fetchall przechodzi przez wszystkie wiersze robiac liste tych wierszy
        return columns, rows
    finally:
        connection.close()

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        if username in users and check_password_hash(users[username], password):
            session['username'] = username
            flash('Zalogowano pomyślnie!', 'success')
            return redirect(url_for('show_tables'))
        else:
            flash('Nieprawidłowy login lub hasło.', 'danger')

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('username', None)
    flash('Wylogowano pomyślnie.', 'info')
    return redirect(url_for('login'))

@app.route('/tabele')
@app.route('/')
def show_tables():
    if 'username' not in session:
        flash('Musisz być zalogowany, aby zobaczyć tę stronę.', 'warning')
        return redirect(url_for('login'))

    # URL obrazu rekina (możesz go ustawić na stałe lub pobierać z bazy danych)
    rekin_image_url = "your_shark_image.png"

    # Nazwy tabel w bazie danych
    table_names = [
        "siedliska", "diety", "zagrożenia", "naukowcy",
        "badania", "rekiny"
    ]

    # Pobieranie danych z każdej tabeli
    tables = {}
    for table in table_names:
        columns, rows = pobieranie_danych(table)
        tables[table] = {"columns": columns, "rows": rows}

    # Renderowanie HTML z URL-em obrazu
    return render_template("tabelki.html", tables=tables, rekin_image_url=rekin_image_url)

@app.route('/usun_rekord', methods=['DELETE'])
def usun_rekord():
    id = request.args.get('id')
    tabela = request.args.get('tabela')

    # Walidacja danych wejściowych
    if not id or not tabela:
        return jsonify({"error": "Brak wymaganych parametrów: id i tabela"}), 400

    connection = pymysql.connect(**db_config)
    try:
        with connection.cursor() as cursor:
            sql = f"DELETE FROM `{tabela}` WHERE id = %s"
            cursor.execute(sql, (id,))
            connection.commit()

            if cursor.rowcount == 0:
                return jsonify({"message": "Rekord o podanym id nie istnieje"}), 404

            return jsonify({"message": "Rekord został usunięty"}), 200
    except Exception as e:
        return jsonify({"message": "Rekord nie został usunięty"}), 500
    finally:
        connection.close()

@app.route('/zmodyfikuj_rekord', methods=['POST'])
def zmodyfikuj_rekord():
    data = request.get_json()
    id = data.get('id')
    tabela = data.get('tabela')
    nowe_dane = data.get('dane')

    if not id or not tabela or not nowe_dane:
        return jsonify({"error": "Brak wymaganych danych: id, tabela lub dane"}), 400

    connection = pymysql.connect(**db_config)
    try:
        with connection.cursor() as cursor:
            cursor.execute(f"SHOW COLUMNS FROM `{tabela}`")
            columns = [column[0] for column in cursor.fetchall()]

            update_columns = columns[1:]  
            if len(update_columns) != len(nowe_dane):
                return jsonify({"error": "Dane nie pasują do liczby kolumn"}), 400

            set_clause = ", ".join([f"`{col}` = %s" for col in update_columns])
            values = nowe_dane + [id]

            sql = f"UPDATE `{tabela}` SET {set_clause} WHERE id = %s"
            cursor.execute(sql, values)
            connection.commit()

            if cursor.rowcount == 0:
                return jsonify({"message": "Rekord o podanym id nie istnieje"}), 404

            return jsonify({"message": "Rekord został zmodyfikowany"}), 200
    except Exception as e:
        print(e)
        return jsonify({"message": "Rekord nie został zmodyfikowany"}), 500
    finally:
        connection.close()

@app.route('/dodaj_rekord', methods=['POST'])
def dodaj_rekord():
    data = request.get_json()
    tabela = data.get('tabela')
    nowe_dane = data.get('dane')

    if not tabela or not nowe_dane:
        return jsonify({"error": "Brak wymaganych danych: tabela lub dane"}), 400

    columns = ', '.join([f"`{col.replace(' ', '_')}`" for col in nowe_dane.keys()])
    values = ', '.join([f"'{value}'" for value in nowe_dane.values()])

    connection = pymysql.connect(**db_config)
    try:
        with connection.cursor() as cursor:
            query = f"INSERT INTO `{tabela}` ({columns}) VALUES ({values})"
            cursor.execute(query)
            connection.commit()
    finally:
        connection.close()

    return jsonify({"message": "Rekord został dodany pomyślnie"}), 200

if __name__ == '__main__':
    app.run(debug=True)
