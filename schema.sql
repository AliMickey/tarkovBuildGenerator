DROP TABLE IF EXISTS guns;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS sights;
DROP TABLE IF EXISTS magazines;
DROP TABLE IF EXISTS barrels;
DROP TABLE IF EXISTS bolts;
DROP TABLE IF EXISTS pistol_grips;
DROP TABLE IF EXISTS hand_guards;
DROP TABLE IF EXISTS buffer_tubes;

-- Guns
CREATE TABLE guns (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gun_name TEXT NOT NULL,
  compatible_stock_id INTEGER,
  compatible_sight_id INTEGER,
  compatible_magazine_id INTEGER,
  compatible_barrel_id INTEGER,
  compatible_bolt_id INTEGER,
  compatible_pistol_grips_id INTEGER,
  compatible_hand_guard_id INTEGER,
  compatible_buffer_tube_id INTEGER,

  FOREIGN KEY compatible_stock_id REFERENCES stocks (id)),
  FOREIGN KEY compatible_sight_id REFERENCES sights (id)),
  FOREIGN KEY compatible_magazine_id REFERENCES magazines (id)),
  FOREIGN KEY compatible_barrel_id REFERENCES barrels (id)),
  FOREIGN KEY compatible_bolt_id REFERENCES bolts (id)),
  FOREIGN KEY compatible_pistol_grips_id REFERENCES pistol_grips (id)),
  FOREIGN KEY compatible_hand_guard_id REFERENCES hand_guards (id)),
  FOREIGN KEY compatible_buffer_tube_id REFERENCES buffer_tubes (id)),
);

-- Stocks
CREATE TABLE stocks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stock_name TEXT NOT NULL,
);

-- Sights
CREATE TABLE sights (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sight_name TEXT NOT NULL,
);

-- Magazine
CREATE TABLE magazines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  magazine_name TEXT NOT NULL,
);

-- Barrels
CREATE TABLE barrels (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  barrel_name TEXT NOT NULL,
);

-- Bolts
CREATE TABLE bolts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolt_name TEXT NOT NULL,
);

-- Pistol Grips
CREATE TABLE pistol_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pistol_grip_name TEXT NOT NULL,
);

-- Hand Guards
CREATE TABLE hand_guards (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  hand_guard_name TEXT NOT NULL,
);

-- Buffer Tubes
CREATE TABLE buffer_tubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  buffer_tube_name TEXT NOT NULL,
);

