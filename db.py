import sqlite3

def get_db():
    db = sqlite3.connect(
        'database.db',
        detect_types=sqlite3.PARSE_DECLTYPES
    )
    db.row_factory = sqlite3.Row
    return db


def close_db(e=None):
    db = g.pop('db', None)

    if db is not None:
        db.close()


def init_db():
    db = get_db()

    with open_resource('schema.sql') as f:
        db.executescript(f.read().decode('utf8'))

