import psycopg2

def main():
    conn = psycopg2.connect(host="localhost", port=5432, database="film_music", user="music_user", password="music_telebot_password")
    cur = conn.cursor()
    print("Database opened successfully")
    cur.execute("""SELECT * FROM "User";""")
    query_results = cur.fetchall()
    text = '\n\n'.join([', '.join(map(str, x)) for x in query_results])
    print(text)

if __name__ == '__main__':
    main()