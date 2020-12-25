import psycopg2

def main():
    conn = psycopg2.connect(host="134.209.120.236", port=5432, database="film_music", user="music_user", password="music_telebot_password")
    cur = conn.cursor()
    print("Database opened successfully")
    cur.execute("""INSERT INTO User(telegram_id, fullname) VALUES("1222","nameee");""")
    query_results = cur.fetchall()
    text = '\n\n'.join([', '.join(map(str, x)) for x in query_results])
    print(text)

if __name__ == '__main__':
    main()