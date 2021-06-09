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

  FOREIGN KEY (compatible_stock_id) REFERENCES stocks (id),
  FOREIGN KEY (compatible_sight_id) REFERENCES sights (id),
  FOREIGN KEY (compatible_magazine_id) REFERENCES magazines (id),
  FOREIGN KEY (compatible_barrel_id) REFERENCES barrels (id),
  FOREIGN KEY (compatible_bolt_id) REFERENCES bolts (id),
  FOREIGN KEY (compatible_pistol_grips_id) REFERENCES pistol_grips (id),
  FOREIGN KEY (compatible_hand_guard_id) REFERENCES hand_guards (id),
  FOREIGN KEY (compatible_buffer_tube_id) REFERENCES buffer_tubes (id)
);

-- Stocks
CREATE TABLE stocks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  stock_name TEXT NOT NULL,
  buffer_tube_required BOOLEAN NOT NULL
);

-- Sights
CREATE TABLE sights (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sight_name TEXT NOT NULL
);

-- Magazines
CREATE TABLE magazines (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  magazine_name TEXT NOT NULL
);

-- Barrels
CREATE TABLE barrels (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  barrel_name TEXT NOT NULL
);

-- Bolts
CREATE TABLE bolts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  bolt_name TEXT NOT NULL
);

-- Pistol Grips
CREATE TABLE pistol_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pistol_grip_name TEXT NOT NULL
);

-- Hand Guards
CREATE TABLE hand_guards (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  hand_guard_name TEXT NOT NULL
);

-- Buffer Tubes
CREATE TABLE buffer_tubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  buffer_tube_name TEXT NOT NULL
);

-- Mounts
CREATE TABLE mounts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  mount_name TEXT NOT NULL
);

-- Fore Grips
CREATE TABLE fore_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fore_grip_name TEXT NOT NULL
);

-- Tacticals
CREATE TABLE tacticals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tactical_name TEXT NOT NULL
);

-- Muzzles
CREATE TABLE muzzles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  muzzle_name TEXT NOT NULL
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
       ('HK UMP 45 submachinegun')('TDI KRISS Vector Gen.2 .45 ACP submachinegun'), ('TDI Kriss Vector Gen.2 9x19 submachinegun'), 
       ('Mossberg 590A1 12ga shotgun'), ('Remington Model 870 12ga shotgun'), ('MP-133 12ga shotgun'), ('MP-153 12ga semi-automatic shotgun'), 
       ('Saiga 12ga ver.10 12x76 assault rifle'), ('TOZ-106 bolt-action shotgun'), ('TOZ KS-23M 23x75mm shotgun'), ('Lone Star TX-15 DML Rifle'), 
       ('Springfield Armory M1A 7.62x51'), ('Mk-18 .338 LM marksman rifle'), ('Remington R11 RSASS 7.62x51'), ("Knight's Armament Company SR-25 7.62x51"), 
       ('SVDS 7.62x54 Sniper rifle'), ('Special Sniper Rifle VSS Vintorez'), ('DVL-10 Saboteur sniper rifle'), ('Remington Model 700 Sniper rifle'), 
       ('Mosin bolt-action sniper rifle'), ('Mosin bolt-action infantry rifle'), ('SV-98 bolt-action sniper rifle'), ('Orsis T-5000 .308 sniper rifle'), 
       ('Molot VPO-215 .366 TKM rifle'), ('FN GL40 Mk.2 grenade launcher'), ('Stechkin Automatic Pistol 9x18PM'), ('Silenced Stechkin Automatic Pistol 9x18PM'), 
       ('FN Five-seveN MK2 5.7x28 pistol'), ('FN Five-seveN MK2 FDE Frame 5.7x28 pistol'), ('GLOCK 17 9x19 pistol'), ('GLOCK 18C 9x19 pistol'), 
       ('Colt M1911A1 .45 ACP pistol'), ('Colt M45A1 .45 ACP pistol'), ('Beretta M9A3 9x19 pistol'), ('Yarygin MP-443 Grach 9x19 pistol'), 
       ('P226R 9x19 pistol'), ('PB 9x18PM silenced pistol'), ('PL-15 9x19 pistol'), ('PM (t) 9x18PM pistol'), ('PM 9x18PM pistol'), 
       ('9x21 Serdyukov automatic pistol SR1MP Gyurza'), ('TT pistol 7.62x25 TT'), ('TT pistol 7.62x25 TT (gold)');

-- Stocks
INSERT INTO stocks (stock_name)
VALUES ('ADAR 2-15 wooden stock'), ('APB detachable wire stock'), ('Armacon Baskak stock'), ('AT AICS polymer stock for M700'), 
       ('ATI Monte Carlo Mosin rifle stock'), ('B5 Precision stock'), ('Custom cut mosin stock for TOZ-106'), ('Double Star Ace Socom gen.4 stock for AR-15'), 
       ('DSA BRS stock for SA-58'), ('DSA Folding stock for SA-58'), ('DSA SPR stock for SA-58'), ('Early produced SIG collapsing/telescoping MCX/MPX stock'), 
       ('EMOD Stock'), ('F93 Pro Stock'), ('Fab Defence GL Core Stock'), ('Fab Defence GL Shock Stock'), ('Fab Defence GLR-16-S Stock'), 
       ('Fab Defence GLR-17 Stock for Glock and compatible'), ('Fab Defence UAS Stock for SKS'), ('Fab Defense UAS for AK'), ('FN P90 stock'), ('FN PS90 stock'), 
       ('Hexagon "Kocherga" stock red'), ('High Standard M4SS Stock'), ('HK A2 Stock'), ('HK A3 old stock model'), ('HK E1 Stock for AR-15 and compatible'), 
       ('HK End Cap Stock for MP5'), ('HK End Cap Stock for MP5 Kurz'), ('HK Slim Line Stock'), ('Hogue "Overmolded ghillie" stock for Remington Model 700'), 
       ('Infantry Mosin rifle stock'), ('Izhmash AK-12 regular stock'), ('IzhMash metal stock for AKS-74 (6P21 Sb.5)'), ('Izhmash metal stock for AKS-74U (6P26 Sb.5)'), 
       ('Izhmash polymer AK-74 stock (6P20 Sb.7)'), ('Izhmash shoulder piece for AKMS (6P4 Sb.1-19)'), ('Izhmash shoulder piece for AKMSN (6P4 Sb.1-19)'), 
       ('Izhmash SOK-12 AK type stock'), ('Izhmash wooden AK-74 stock (6P20 Sb.5)'), ('Izhmash wooden AKM stock (6P1 Sb.5)'), ('KRISS Defiance DS150 stock'), 
       ('KRISSVector Gen.2 folding stock'), ('LMT Sopmod stock'), ('LOBAEV Arms Stock'), ('M14 M14ALCS(MOD. 0) stock (buttstock)'), ('M1A Archangel stock'), 
       ('M1A Socom 16 stock'), ('M700 MOD X Gen.3 stock'), ('Magpul CTR Carbine stock'), ('Magpul PRO 700 chassis'), ('Magpul PRS 2 polymer stock for FAL'), 
       ('Magpul PRS GEN2 FDE stock'), ('Magpul PRS GEN3 stock'), ('Magpul Rubber Butt-Pad for Carbine stock series'), 
       ('Maxim Defence CQB collapsing/telescoping MCX/MPX stock'), ('MC 20-01 stock'), ('Metal Izhmash stock for PP-19-01'), ('MFT BUS Stock'), ('MOE Carbine stock'), 
       ('Molot wooden VPO-136 stock'), ('Molot wooden VPO-209 stock'), ('Mosin carbine stock'), ('Mosin rifle sniper carbine stock'), 
       ('Orsis T-5000M Stock'), ('Plastic pistol grip for MP-133/153'), ('Plastic stock for MP-133/153'), ('PMM "ULSS" foldable MCX/MPX stock'), 
       ('Polymer stock DSA humpback for SA-58'), ('Polymer stock for AK-74M (6P34 Sb.15)'), ('Polymer stock for M590A1'), ('Polymer stock for SVDS'), 
       ('Polymer stock for UMP'), ('PPSH-41 stock'), ('PRO 700 folding stock'), ('ProMag Archangel OPFOR PRS Mosin rifle stock'), 
       ('Promag Archangel polymer stock for M700'), ('Raptor grip for M870'), ('Regular Mosin rifle stock'), ('Regular stock for B&T MP9'), 
       ('Regular stock for HK MP7A1'), ('Regular stock for HK MP7A2'), ('Regular VPO-101 "Vepr Hunter" stock'), ('Regular VPO-215 stock'), 
       ('Remington SPS Polymer stock for M870'), ('Sawn off Mosin rifle sniper stock'), ('Sawn off regular Mosin rifle stock'), ('SGA stock for M590'), 
       ('SGA stock for M870'), ('SI Viper Mod.1 Stock'), ('SIG Sauer telescoping MCX/MPX stock'), ('SIG Sauer Thin lightweight MCX/MPX stock'), 
       ('Tapco INTRAFUSE Stock for SKS'), ('TOZ stock for TOZ-106'), ('Troy M7A1 PDW stock'), ('Troy S.A.S.S. Chassis stock for M14'), ('TSNIITochMash AS VAL stock'), 
       ('TSNIITochMash VSS Vintorez stock'), ('UBR GEN2 stock'), ('VPO-101 SVD style stock'), ('Wired stock for KS-23M'), ('Wooden stock 56-A-231 Sb.5'), 
       ('Wooden stock for KS-23'), ('Wooden stock for Molot OP-SKS'), ('Wooden stock for MP-133/153'), ('Zenit PT-1 "Klassika" stock'), 
       ('Zenit PT-3 "Klassika" stock'), ('Zhukov-S for AK');

-- Sights
INSERT INTO sights (sight_name)
VALUES ('1');

-- Magazine
INSERT INTO magazines (magazine_name)
VALUES ('1');

-- Barrels
INSERT INTO barrels (barrel_name)
VALUES ('1');

-- Bolts
INSERT INTO bolts (bolt_name)
VALUES ('1');

-- Pistol Grips
INSERT INTO pistol_grips (pistol_grip_name)
VALUES ('1');

-- Hand Guards
INSERT INTO hand_guards (hand_guard_name)
VALUES ('1');

-- Mounts
INSERT INTO mounts (buffer_tube_name)
VALUES ('1');

-- Fore Grips
INSERT INTO fore_grips (buffer_tube_name)
VALUES ('1');

-- Tacticals
INSERT INTO tacticals (buffer_tube_name)
VALUES ('1');

-- Muzzles
INSERT INTO muzzles (buffer_tube_name)
VALUES ('1');






-- Foreign Key Linking
--UPDATE guns (compatible_stock_id)
