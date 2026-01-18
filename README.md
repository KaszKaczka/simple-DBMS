# Simple DBMS - Aplikacja do zarządzania bazą danych

Prosty system zarządzania bazą danych (DBMS) zbudowany przy użyciu Flask (Python) i SQLite. Aplikacja oferuje interfejs webowy do przeglądania, dodawania i usuwania rekordów z bazy danych.

##  Funkcjonalności

*   **Interfejs Webowy**: Łatwy w obsłudze interfejs HTML/CSS do interakcji z bazą danych.
*   **Podstawowe Operacje CRUD**:
    *   Przeglądanie (Read) wszystkich rekordów z głównej tabeli bazy danych.
    *   Dodawanie (Create) nowych rekordów poprzez formularz.
    *   Usuwanie (Delete) istniejących rekordów.
*   **Backend w Pythonie**: Logika aplikacji napisana w Flask, obsługująca routing, żądania i komunikację z bazą danych SQLite.
*   **Statyczne Pliki**: Obsługa obrazów i stylów CSS dla interfejsu użytkownika.

##  Struktura projektu
```
simple-DBMS/
│
├── app.py              # Główna aplikacja Flask
├── realizacjaDB.sql    # Skrypt SQL do utworzenia bazy danych
├── podgladDB.sql       # Prawdopodobnie przykładowe zapytania lub widoki
│
├── templates/          # Szablony HTML
│   └── index.html      # Główna strona aplikacji
│
├── static/             # Pliki statyczne (CSS, obrazy)
│   └── images/
│       └── logo.png    # Logo projektu
│
├── RaportProjekt1.pdf  # Dokumentacja projektu (pierwszy raport)
├── RAport projekt bazy 2.pdf # Dokumentacja projektu (drugi raport)
└── README.md           # Ten plik
```

##  Wymagania

Aby uruchomić ten projekt, potrzebujesz:
*   **Python 3.7+**
*   **Flask** (zostanie zainstalowany poniżej)

##  Instalacja i uruchomienie

Wykonaj poniższe kroki, aby skonfigurować i uruchomić aplikację lokalnie.

1.  **Sklonuj repozytorium:**
    ```bash
    git clone https://github.com/KaszKaczka/simple-DBMS.git
    cd simple-DBMS
    ```

2.  **(Opcjonalnie) Utwórz i aktywuj wirtualne środowisko Pythona:**
    ```bash
    python -m venv venv
    # Na Windows:
    venv\Scripts\activate
    # Na macOS/Linux:
    source venv/bin/activate
    ```

3.  **Zainstaluj wymagane zależności:**
    ```bash
    pip install flask
    ```

4.  **Przygotuj bazę danych:**
    *   Uruchom skrypt `realizacjaDB.sql` w swojej ulubionej aplikacji do obsługi SQLite (np. DB Browser for SQLite), aby utworzyć strukturę bazy danych.
    *   Alternatywnie, możesz uruchomić go z poziomu Pythona, jeśli masz zainstalowaną bibliotekę `sqlite3`.

5.  **Uruchom aplikację Flask:**
    ```bash
    python app.py
    ```
    Aplikacja powinna uruchomić się lokalnie, zwykle pod adresem `http://127.0.0.1:5000`.

##  Użycie

1.  Otwórz przeglądarkę i przejdź do adresu `http://127.0.0.1:5000`.
2.  Strona główna wyświetli listę rekordów z bazy danych.
3.  Użyj formularza na stronie, aby dodać nowy rekord.
4.  Aby usunąć rekord, kliknij odpowiedni przycisk obok wybranego wpisu.

##  Struktura bazy danych

Szczegółowa struktura tabel, relacji i pjest zdefiniowana w pliku **`realizacjaDB.sql`**. Zapoznaj się z tym plikiem, aby zrozumieć, jakie dane przechowuje aplikacja. Plik **`podgladDB.sql`** może zawierać pomocnicze widoki lub przykładowe zapytania.