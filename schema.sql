DROP TABLE IF EXISTS guns;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS buffer_tubes;
DROP TABLE IF EXISTS pistol_grips;
DROP TABLE IF EXISTS hand_guards;
DROP TABLE IF EXISTS sights;
DROP TABLE IF EXISTS sight_mounts;
DROP TABLE IF EXISTS magazines;
DROP TABLE IF EXISTS barrels;
DROP TABLE IF EXISTS muzzles;
DROP TABLE IF EXISTS muzzle_adaptors;
DROP TABLE IF EXISTS bolts;
DROP TABLE IF EXISTS fore_grips;
DROP TABLE IF EXISTS tacticals;
DROP TABLE IF EXISTS ammo_types;
DROP TABLE IF EXISTS stock_compatibility;
DROP TABLE IF EXISTS buffer_tube_compatibility;
DROP TABLE IF EXISTS pistol_grip_compatibility;
DROP TABLE IF EXISTS hand_guard_compatibility;
DROP TABLE IF EXISTS sight_compatibility;
DROP TABLE IF EXISTS sight_mount_compatibility;
DROP TABLE IF EXISTS magazine_compatibility;
DROP TABLE IF EXISTS barrel_compatibility;
DROP TABLE IF EXISTS muzzle_compatibility;
DROP TABLE IF EXISTS muzzle_adaptor_compatibility;
DROP TABLE IF EXISTS bolt_compatibility;
DROP TABLE IF EXISTS fore_grip_compatibility;
DROP TABLE IF EXISTS tactical_compatibility;
DROP TABLE IF EXISTS ammo_type_compatibility;

-- Guns
CREATE TABLE guns (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gun_name TEXT NOT NULL
);

-- Stocks
CREATE TABLE stocks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stock_name TEXT UNIQUE NOT NULL,
  buffer_tube_required BOOLEAN, --NOT NULL,
  pistol_grip_required BOOLEAN, --NOT NULL,
  hand_guard_required BOOLEAN --NOT NULL
);

-- Buffer Tubes
CREATE TABLE buffer_tubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  buffer_tube_name TEXT UNIQUE NOT NULL
);

-- Pistol Grips
CREATE TABLE pistol_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pistol_grip_name TEXT UNIQUE NOT NULL
);

-- Hand Guards
CREATE TABLE hand_guards (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  hand_guard_name TEXT UNIQUE NOT NULL
);

-- Sights
CREATE TABLE sights (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sight_name TEXT UNIQUE NOT NULL,
  mount_required BOOLEAN --NOT NULL
);

-- Sight Mounts
CREATE TABLE sight_mounts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mount_name TEXT UNIQUE NOT NULL
);

-- Magazines
CREATE TABLE magazines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  magazine_name TEXT UNIQUE NOT NULL
);

-- Barrels
CREATE TABLE barrels (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  barrel_name TEXT UNIQUE NOT NULL
);

-- Muzzles
CREATE TABLE muzzles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  muzzle_name TEXT UNIQUE NOT NULL,
  adaptor_required BOOLEAN --NOT NULL
);

-- Muzzle Adaptors
CREATE TABLE muzzle_adaptors (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  adaptor_name TEXT UNIQUE NOT NULL
);

-- Bolts
CREATE TABLE bolts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolt_name TEXT UNIQUE NOT NULL
);

-- Fore Grips
CREATE TABLE fore_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fore_grip_name TEXT UNIQUE NOT NULL
);

-- Tacticals
CREATE TABLE tacticals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tactical_name TEXT UNIQUE NOT NULL
);

-- Ammo Types
CREATE TABLE ammo_types (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ammo_name TEXT UNIQUE NOT NULL
);

--Gun -> Stocks
CREATE TABLE stock_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  stock_id INTEGER REFERENCES stocks (id),
  PRIMARY KEY (gun_id, stock_id)
);

--Stock -> Buffer Tubes
CREATE TABLE buffer_tube_compatibility (
  stock_id INTEGER REFERENCES stocks (id),
  buffer_tube_id INTEGER REFERENCES buffer_tubes (id),
  PRIMARY KEY (stock_id, buffer_tube_id)
);

--Stock -> Pistol Grips
CREATE TABLE pistol_grip_compatibility (
  stock_id INTEGER REFERENCES guns (id),
  pistol_grip_id INTEGER REFERENCES pistol_grips (id),
  PRIMARY KEY (stock_id, pistol_grip_id)
);

--Stock -> Hand Guards
CREATE TABLE hand_guard_compatibility (
  stock_id INTEGER REFERENCES guns (id),
  hand_guard_id INTEGER REFERENCES hand_guards (id),
  PRIMARY KEY (stock_id, hand_guard_id)
);

--Gun -> Fore Grips
CREATE TABLE fore_grip_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  fore_grip_id INTEGER REFERENCES fore_grips (id),
  PRIMARY KEY (gun_id, fore_grip_id)
);

--Gun -> Tacticals
CREATE TABLE tactical_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  tactical_id INTEGER REFERENCES tacticals (id),
  PRIMARY KEY (gun_id, tactical_id)
);

--Gun -> Sights
CREATE TABLE sight_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  sight_id INTEGER REFERENCES sights (id),
  PRIMARY KEY (gun_id, sight_id)
);

--Sight -> Mounts
CREATE TABLE sight_mount_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  mount_id INTEGER REFERENCES sight_mounts (id),
  PRIMARY KEY (gun_id, mount_id)
);

--Gun -> Magazines
CREATE TABLE magazine_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  magazine_id INTEGER REFERENCES maagzines (id),
  PRIMARY KEY (gun_id, magazine_id)
);

--Gun -> Barrels
CREATE TABLE barrel_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  barrel_id INTEGER REFERENCES barrels (id),
  PRIMARY KEY (gun_id, barrel_id)
);

--Barrel -> Muzzles
CREATE TABLE muzzle_compatibility (
  barrel_id INTEGER REFERENCES barrels (id),
  muzzle_id INTEGER REFERENCES muzzles (id),
  PRIMARY KEY (barrel_id, muzzle_id)
);

--Muzzle -> Adaptors
CREATE TABLE muzzle_adaptor_compatibility (
  muzzle_id INTEGER REFERENCES muzzles (id),
  adaptor_id INTEGER REFERENCES adaptors (id),
  PRIMARY KEY (muzzle_id, adaptor_id)
);

--Gun -> Bolts
CREATE TABLE bolt_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  bolt_id INTEGER REFERENCES bolts (id),
  PRIMARY KEY (gun_id, bolt_id)
);

--Gun -> Ammo Types
CREATE TABLE ammo_type_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  ammo_id INTEGER REFERENCES ammo_types (id),
  PRIMARY KEY (gun_id, ammo_id)
);


-- Inserts
-- Guns
INSERT INTO guns (gun_name)
VALUES ('ADAR 2-15 .223 Carbine'), ('AK-101 5.56x45 assault rifle'), ('AK-102 AK-102 5.56x45 assault rifle'), ('AK-103 7.62x39 assault rifle'), 
       ('AK-104 7.62x39 assault rifle'), ('AK-105 5.45x39 assault rifle'), ('AK-74 5.45x39 assault rifle'), ('AK-74M 5.45x39 assault rifle'), 
       ('AK-74N 5.45x39 assault rifle'), ('AKM 7.62x39 assault rifle'), ('AKMN 7.62x39 assault rifle'), ('AKMS 7.62x39 assault rifle'), 
       ('AKMSN 7.62x39 assault rifle'), ('AKS-74 5.45x39 assault rifle'), ('AKS-74N 5.45x39 assault rifle'), ('Kalashnikov AKS-74U 5.45x39'), 
       ('Kalashnikov AKS-74UB 5.45x39'), ('Kalashnikov AKS-74UN 5.45x39'), ('ASh-12 12.7x55 assault rifle'), ('AS VAL'), ('DT MDR 5.56x45 Assault Rifle'), 
       ('DT MDR 7.62x51 Assault Rifle'), ('HK 416A5 5.56x45 Assault Rifle'), ('Kel-Tec RFB 7.62x51'), ('Colt M4A1 5.56x45 Assault Rifle'), 
       ('SIG MCX .300 AAC Blackout Assault Rifle'), ('DS Arms SA-58 7.62x51'), ('Vepr AKM/VPO-209 366TKM carbine'), ('Vepr KM / VPO-136 7.62x39 carbine'), 
       ('Simonov Semi-Automatic Carbine SKS 7.62x39 Hunting Rifle Version'), ('Simonov Semi-Automatic Carbine SKS 7.62x39'), 
       ('Vepr Hunter/VPO-101 7.62x51 carbine'), ('RPK-16 5.45x39 light machine gun'), ('HK MP5 9x19 submachinegun (Navy 3 Round Burst)'), 
       ('HK MP5 Kurz 9x19 submachinegun'), ('HK MP7A1 4.6x30 submachinegun'), ('HK MP7A2 4.6x30 submachinegun'), ('B&T MP9 9x19 submachinegun'), 
       ('B&T MP9-N 9x19 Submachinegun'), ('SIG MPX 9x19 Submachine gun'), ('FN P90 5.7x28 submachinegun'), ('Submachinegun 19-01 Vityaz-SN 9x19'), 
       ('PP-9 Klin 9x18PMM SMG'), ('PP-91 Kedr 9x18PM SMG'), ('Submachinegun PPSH-41 7.62x25'), ('Saiga-9 9x19 Carbine'), ('STM-9 Gen.2 9x19 carbine'), 
       ('HK UMP 45 submachinegun');

VALUES ('TDI KRISS Vector Gen.2 .45 ACP submachinegun'), ('TDI Kriss Vector Gen.2 9x19 submachinegun'), ('Mossberg 590A1 12ga shotgun'), 
       ('Remington Model 870 12ga shotgun'), ('MP-133 12ga shotgun'), ('MP-153 12ga semi-automatic shotgun'), ('Saiga 12ga ver.10 12x76 assault rifle'), 
       ('TOZ-106 bolt-action shotgun'), ('TOZ KS-23M 23x75mm shotgun'), ('Lone Star TX-15 DML Rifle'), ('Springfield Armory M1A 7.62x51'), 
       ('Mk-18 .338 LM marksman rifle'), ('Remington R11 RSASS 7.62x51'), ("Knight's Armament Company SR-25 7.62x51"), ('SVDS 7.62x54 Sniper rifle'), 
       ('Special Sniper Rifle VSS Vintorez'), ('DVL-10 Saboteur sniper rifle'), ('Remington Model 700 Sniper rifle'), ('Mosin bolt-action sniper rifle'), 
       ('Mosin bolt-action infantry rifle'), ('SV-98 bolt-action sniper rifle'), ('Orsis T-5000 .308 sniper rifle'), ('Molot VPO-215 .366 TKM rifle'), 
       ('FN GL40 Mk.2 grenade launcher'), ('Stechkin Automatic Pistol 9x18PM'), ('Silenced Stechkin Automatic Pistol 9x18PM'), ('FN Five-seveN MK2 5.7x28 pistol'), 
       ('FN Five-seveN MK2 FDE Frame 5.7x28 pistol'), ('GLOCK 17 9x19 pistol'), ('GLOCK 18C 9x19 pistol'), ('Colt M1911A1 .45 ACP pistol'), ('Colt M45A1 .45 ACP pistol'), 
       ('Beretta M9A3 9x19 pistol'), ('Yarygin MP-443 Grach 9x19 pistol'), ('P226R 9x19 pistol'), ('PB 9x18PM silenced pistol'), ('PL-15 9x19 pistol'), 
       ('PM (t) 9x18PM pistol'), ('PM 9x18PM pistol'), ('9x21 Serdyukov automatic pistol SR1MP Gyurza'), ('TT pistol 7.62x25 TT'), ('TT pistol 7.62x25 TT (gold)');



-- Stocks
--temp
INSERT INTO stocks (stock_name, buffer_tube_required, pistol_grip_required, hand_guard_required)
VALUES ('ADAR 2-15 wooden stock', false, false, true), ('APB detachable wire stock', false, true, true), ('Armacon Baskak stock', true, true, false);


-- INSERT INTO stocks (stock_name, buffer_tube_required, pistol_grip_required)
-- VALUES ('ADAR 2-15 wooden stock'), ('APB detachable wire stock'), ('Armacon Baskak stock'), ('AT AICS polymer stock for M700'), 
--        ('ATI Monte Carlo Mosin rifle stock'), ('B5 Precision stock'), ('Custom cut mosin stock for TOZ-106'), ('Double Star Ace Socom gen.4 stock for AR-15'), 
--        ('DSA BRS stock for SA-58'), ('DSA Folding stock for SA-58'), ('DSA SPR stock for SA-58'), ('Early produced SIG collapsing/telescoping MCX/MPX stock'), 
--        ('EMOD Stock'), ('F93 Pro Stock'), ('Fab Defence GL Core Stock'), ('Fab Defence GL Shock Stock'), ('Fab Defence GLR-16-S Stock'), 
--        ('Fab Defence GLR-17 Stock for Glock and compatible'), ('Fab Defence UAS Stock for SKS'), ('Fab Defense UAS for AK'), ('FN P90 stock'), ('FN PS90 stock'), 
--        ('Hexagon "Kocherga" stock red'), ('High Standard M4SS Stock'), ('HK A2 Stock'), ('HK A3 old stock model'), ('HK E1 Stock for AR-15 and compatible'), 
--        ('HK End Cap Stock for MP5'), ('HK End Cap Stock for MP5 Kurz'), ('HK Slim Line Stock'), ('Hogue "Overmolded ghillie" stock for Remington Model 700'), 
--        ('Infantry Mosin rifle stock'), ('Izhmash AK-12 regular stock'), ('IzhMash metal stock for AKS-74 (6P21 Sb.5)'), ('Izhmash metal stock for AKS-74U (6P26 Sb.5)'), 
--        ('Izhmash polymer AK-74 stock (6P20 Sb.7)'), ('Izhmash shoulder piece for AKMS (6P4 Sb.1-19)'), ('Izhmash shoulder piece for AKMSN (6P4 Sb.1-19)'), 
--        ('Izhmash SOK-12 AK type stock'), ('Izhmash wooden AK-74 stock (6P20 Sb.5)'), ('Izhmash wooden AKM stock (6P1 Sb.5)'), ('KRISS Defiance DS150 stock'), 
--        ('KRISSVector Gen.2 folding stock'), ('LMT Sopmod stock'), ('LOBAEV Arms Stock'), ('M14 M14ALCS(MOD. 0) stock (buttstock)'), ('M1A Archangel stock'), 
--        ('M1A Socom 16 stock'), ('M700 MOD X Gen.3 stock'), ('Magpul CTR Carbine stock'), ('Magpul PRO 700 chassis'), ('Magpul PRS 2 polymer stock for FAL'), 
--        ('Magpul PRS GEN2 FDE stock'), ('Magpul PRS GEN3 stock'), ('Magpul Rubber Butt-Pad for Carbine stock series');
       
-- VALUES ('Maxim Defence CQB collapsing/telescoping MCX/MPX stock'), ('MC 20-01 stock'), ('Metal Izhmash stock for PP-19-01'), ('MFT BUS Stock'), ('MOE Carbine stock'), 
--        ('Molot wooden VPO-136 stock'), ('Molot wooden VPO-209 stock'), ('Mosin carbine stock'), ('Mosin rifle sniper carbine stock'), 
--        ('Orsis T-5000M Stock'), ('Plastic pistol grip for MP-133/153'), ('Plastic stock for MP-133/153'), ('PMM "ULSS" foldable MCX/MPX stock'), 
--        ('Polymer stock DSA humpback for SA-58'), ('Polymer stock for AK-74M (6P34 Sb.15)'), ('Polymer stock for M590A1'), ('Polymer stock for SVDS'), 
--        ('Polymer stock for UMP'), ('PPSH-41 stock'), ('PRO 700 folding stock'), ('ProMag Archangel OPFOR PRS Mosin rifle stock'), 
--        ('Promag Archangel polymer stock for M700'), ('Raptor grip for M870'), ('Regular Mosin rifle stock'), ('Regular stock for B&T MP9'), 
--        ('Regular stock for HK MP7A1'), ('Regular stock for HK MP7A2'), ('Regular VPO-101 "Vepr Hunter" stock'), ('Regular VPO-215 stock'), 
--        ('Remington SPS Polymer stock for M870'), ('Sawn off Mosin rifle sniper stock'), ('Sawn off regular Mosin rifle stock'), ('SGA stock for M590'), 
--        ('SGA stock for M870'), ('SI Viper Mod.1 Stock'), ('SIG Sauer telescoping MCX/MPX stock'), ('SIG Sauer Thin lightweight MCX/MPX stock'), 
--        ('Tapco INTRAFUSE Stock for SKS'), ('TOZ stock for TOZ-106'), ('Troy M7A1 PDW stock'), ('Troy S.A.S.S. Chassis stock for M14'), ('TSNIITochMash AS VAL stock'), 
--        ('TSNIITochMash VSS Vintorez stock'), ('UBR GEN2 stock'), ('VPO-101 SVD style stock'), ('Wired stock for KS-23M'), ('Wooden stock 56-A-231 Sb.5'), 
--        ('Wooden stock for KS-23'), ('Wooden stock for Molot OP-SKS'), ('Wooden stock for MP-133/153'), ('Zenit PT-1 "Klassika" stock'), 
--        ('Zenit PT-3 "Klassika" stock'), ('Zhukov-S for AK');

-- Buffer Tubes
INSERT INTO buffer_tubes (buffer_tube_name)
VALUES ('1');

-- Pistol Grips
INSERT INTO pistol_grips (pistol_grip_name)
VALUES ('1');

-- Hand Guards
INSERT INTO hand_guards (hand_guard_name)
VALUES ('1');

-- Sights
INSERT INTO sights (sight_name)
VALUES ('1');

-- Sight Mounts
INSERT INTO sight_mounts (mount_name)
VALUES ('1');

-- Magazine
INSERT INTO magazines (magazine_name)
VALUES ('1');

-- Barrels
INSERT INTO barrels (barrel_name)
VALUES ('1');

-- Muzzles
INSERT INTO muzzles (muzzle_name, adaptor_required)
VALUES ('1', true);

-- Muzzle Adaptors
INSERT INTO muzzle_adaptors (adaptor_name)
VALUES ('1');

-- Bolts
INSERT INTO bolts (bolt_name)
VALUES ('1');

-- Fore Grips
INSERT INTO fore_grips (fore_grip_name)
VALUES ('1');

-- Tacticals
INSERT INTO tacticals (tactical_name)
VALUES ('1');

-- Ammo Types
INSERT INTO ammo_types (ammo_name)
VALUES ('1');


--Stock Compatibility
INSERT INTO stock_compatibility (gun_id, stock_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2), (1, 2);
-- Gun2
VALUES (2, 1), (2, 3);


--Buffer Tube Compatibility
INSERT INTO buffer_tube_compatibility (stock_id, buffer_tube_id)
-- Stock name
VALUES (1, 2)


--Pistol Grip Compatibility
INSERT INTO pistol_grip_compatibility (stock_id, pistol_grip_id)
-- Stock name
VALUES (1, 2)


--Hand Guard Compatibility
INSERT INTO hand_guard_compatibility (stock_id, hand_guard_id)
-- Stock name
VALUES (1, 2)


--Sight Compatibility
INSERT INTO sight_compatibility (gun_id, sight_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Magazine Compatibility
INSERT INTO magazine_compatibility (gun_id, magazine_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Barrel Compatibility
INSERT INTO barrel_compatibility (gun_id, barrel_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Muzzle Compatibility
INSERT INTO muzzle_compatibility (gun_id, muzzle_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Muzzle Adaptor Compatibility
INSERT INTO muzzle_adaptor_compatibility (muzzle_id, adaptor_id)
-- Muzzle name
VALUES (1, 2)


--Bolt Compatibility
INSERT INTO bolt_compatibility (gun_id, bolt_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Ammo Type Compatibility
INSERT INTO ammo_type_compatibility (gun_id, ammo_type_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)


--Ammo Type Compatibility
INSERT INTO ammo_type_compatibility (gun_id, ammo_type_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 2)