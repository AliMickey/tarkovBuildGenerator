import sqlite3

def get_db():
    db = sqlite3.connect(
        'database.db',
        detect_types=sqlite3.PARSE_DECLTYPES
    )
    return db

def close_db(db):
    if db is not None:
        db.close()

def init_db():
    db = get_db()
    with open('schema.sql') as f:
        db.executescript(f.read())