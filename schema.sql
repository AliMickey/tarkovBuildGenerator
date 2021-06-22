DROP TABLE IF EXISTS guns;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS buffer_tubes;
DROP TABLE IF EXISTS pistol_grips;
DROP TABLE IF EXISTS hand_guards;
DROP TABLE IF EXISTS receivers;
DROP TABLE IF EXISTS gas_tubes;
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
DROP TABLE IF EXISTS receiver_compatibility;
DROP TABLE IF EXISTS gas_tube_compatibility;
DROP TABLE IF EXISTS fore_grip_compatibility;
DROP TABLE IF EXISTS tactical_compatibility;
DROP TABLE IF EXISTS sight_compatibility;
DROP TABLE IF EXISTS sight_mount_compatibility;
DROP TABLE IF EXISTS magazine_compatibility;
DROP TABLE IF EXISTS barrel_compatibility;
DROP TABLE IF EXISTS muzzle_compatibility;
DROP TABLE IF EXISTS muzzle_adaptor_compatibility;
DROP TABLE IF EXISTS bolt_compatibility;
DROP TABLE IF EXISTS ammo_type_compatibility;

--> Gun --> Ammo Type --> Bolt --> (Receiver --> Sight --> Sight Mount) --> Magazine --> Tactical --> Stock 
--> Buffer Tube --> Pistol --> (Barrel --> Hand Guard --> (Muzzle --> Muzzle Adaptor) --> (Foregrip)) --> Gas Tube

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
  hand_guard_required BOOLEAN --NOT NULL,
  --gas_tube_required BOOLEAN --NOT NULL
);

-- Buffer Tubes
CREATE TABLE buffer_tubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  buffer_tube_name TEXT UNIQUE NOT NULL
);

-- Pistol Grips
CREATE TABLE pistol_grips (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pistol_grip_name TEXT UNIQUE NOT NULL,
  buffer_tube_required BOOLEAN --NOT NULL
);

-- Hand Guards
CREATE TABLE hand_guards (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  hand_guard_name TEXT UNIQUE NOT NULL
);

-- Receivers
CREATE TABLE receivers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  receiver_name TEXT UNIQUE NOT NULL
);

-- Gas Tubes
CREATE TABLE gas_tubes (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  gas_tube_name TEXT UNIQUE NOT NULL,
  handguard_required BOOLEAN -- NOT NULL
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
  stock_id INTEGER REFERENCES stocks (id),
  pistol_grip_id INTEGER REFERENCES pistol_grips (id),
  PRIMARY KEY (stock_id, pistol_grip_id)
);

--Gun -> Hand Guards
CREATE TABLE hand_guard_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  hand_guard_id INTEGER REFERENCES hand_guards (id),
  PRIMARY KEY (gun_id, hand_guard_id)
);

--Gun -> Receiver
CREATE TABLE receiver_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  receiver_id INTEGER REFERENCES receiver (id),
  PRIMARY KEY (gun_id, receiver_id)
);

--Hand Guard -> Fore Grips
CREATE TABLE fore_grip_compatibility (
  hand_guard_id INTEGER REFERENCES hand_guards (id),
  fore_grip_id INTEGER REFERENCES fore_grips (id),
  PRIMARY KEY (hand_guard_id, fore_grip_id)
);

--Gun -> Tacticals
CREATE TABLE tactical_compatibility (
  gun_id INTEGER REFERENCES guns (id),
  tactical_id INTEGER REFERENCES tacticals (id),
  PRIMARY KEY (gun_id, tactical_id)
);

--Receiver -> Sights
CREATE TABLE sight_compatibility (
  receiver_id INTEGER REFERENCES receivers (id),
  sight_id INTEGER REFERENCES sights (id),
  PRIMARY KEY (receiver_id, sight_id)
);

--Sight -> Mounts
CREATE TABLE sight_mount_compatibility (
  sight_id INTEGER REFERENCES sights (id),
  mount_id INTEGER REFERENCES sight_mounts (id),
  PRIMARY KEY (sight_id, mount_id)
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
VALUES ('Izhmash AK-12 regular stock', false, false, false);
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
--        ('Zenit PT-3 "Klassika" stock'), ('Zhukov-S for AK'), ('Hera Arms CQR pistol grip-stock');

--        AS VAL Pistol grip-buffer tube

-- Buffer Tubes
INSERT INTO buffer_tubes (buffer_tube_name)
VALUES ('ADAR buffer tube'), ('AK74/AK100 PT Lock'), ('AKM/AK-74 PT Lock'), ('AKS-74/AKS-74U PT Lock'), ('Buffer Tube adapter for SA-58'), 
       ('Buffer tube side folder adapter for M700'), ('CAA AKTS AK-74 Buffer Tube for AK and compatible'), ('CAA AKTS AK-74 Buffer Tube for AK and compatible (foldable)'),
       ('COLT "A2" buffer tube'), ('Colt buffer tube'), ('Fab Defence buffer tube for AGR-870'), ('HK "Enhanced Tube" buffer tube'), ('Izhmash RPK-16 buffer tube'), 
       ('KRISS Vector non folding stock adapter'), ('LEO stock adapter for M870'), ('LEO stock adapter gen.1 for M590'), ('ME adapter for AK'), 
       ('Mesa Tactical Crosshair Hydraulic buffer tube'), ('SI Advanced receiver extension buffer tube'), ('SIG retractable stock pipe adapter'), ('STM Arms buffer tube'), 
       ('Tapco buffer tube'), ('Stock adapter Tactica Tula 12003 for MP-133/153');

-- Pistol Grips
INSERT INTO pistol_grips (pistol_grip_name)
VALUES ('US Palm pistol grip for AK'), ('HK Grip V.2 pistol grip for AR-15 based systems'), ('Izhmash SVDS pistol grip'), ('	Desert Tech pistol grip for MDR'), 
       ('Razor Arms TT rubber grips'), ('Hogue like TT rubber grips'), ('Wooden Sig Sauer Elite pistol grip for P226'), ('Emperor scorpion Sig Sauer pistol grip for P226'), 
       ('Hogue Chain link pistol grip for P226'), ('Axelson Tacical MK.25 pistol grip for P226'), ('PM-Laser TT-206 side grips with LAM'), 
       ('Fab Defence AGR-870 pistol grip for Remington-870'), ('Izhmash AK-12 regular pistol grip'), ('Tacfire pistol grip for Mosin rifle'), 
       ('HK "Battle Grip" pistol grip for AR-15 based systems'), ('HK Battle Grip with Beavertail pistol grip for AR-15 based systems'), 
       ('Fab AG FAL pistol grip for SA-58'), ('Regular "DS Arms" pistol grip for SA-58'), ('TAPCO SAW-Style black pistol grip for SA-58'), 
       ('Rubber with finger grooves pistol grip for P226'), ('Magpul MOE pistol grip for AK'), ('M14ALCS(MOD. 0) pistol grip for M14'), ('	PP-19-01 Izhmash pistol grip'), 
       ('TOZ 002 pistol grip for TOZ-106'), ('Polymer Izhmekh pistol grip for MP-443'), ('Sig Sauer pistol grip for P226'), ('TSNIITOCHMASH bakelite PB side grips'), 
       ('Fancy TT side grips'), ('Standard TT side grips'), ('Izhmash AK bakelite pistol grip (6P4 Sb.8V)'), ('Izhmash AK polymer pistol grip (6P1 Sb.8)'), 
       ('Izhmash AKM bakelite pistol grip'), ('Wooden Izhmash AKM pistol grip for AK'), ('Izhmash AK-74 Textolite pistol grip (6P4 Sb.9)'), 
       ('Molot AK bakelite pistol grip'), ('TAPCO SAW-Style pistol grip for AK'), ('Zenit RK-3 AK pistol grip'), ('APS bakelite side-pieces'), ('Colt A2 AR-15 pistol grip'), 
       ('DI ECS FDE pistol grip for AR-15 based systems'), ('Hogue OverMolded Rubber Grip'), ('MIAD Pistol grip for AR-15 based systems'), ('Magpul MOE AR-15 pistol grip'), 
       ('Naroh Arms GRAL-S Pistol grip for AR-15-compatible weapons'), ('Stark AR Rifle Grip for AR-15-compatible weapons'), ('Pistol grip SIG MPX'), 
       ('ZMZ Polymer pistol grip for PP-91'), ('AS VAL Pistol grip'), ('Pachmayr tactical rubber grip'), ('Skeletonized AR-15 pistol grip'), 
       ('TAPCO SAW-Style pistol grip for SKS INTRAFUSE Kit'), ('Polymer pistol grip for M9A3'), ('Hera Arms HG-15 pistol grip for AR-15 based systems'), 
       ('Magpul Pistol Grip for Pro 700 Kit'), ('SI Enhanced pistol grip for AK'), ('KGB MG-47 pistol grip for AK'), ('Fab Defence AG-58 pistol grip for VZ-58'), 
       ('HK Ergo PSG-1 style pistol grip for AR-15 based systems'), ('Orsis T-5000 Pistol Grip'), ('Standard polymerpistol grip for M1911A1'), 
       ('Pachmayr "American legend grip 423 for M1911A1'), ('Polymer pistol grip for KS-23M'), ('Standart polymerpistol grip for M45A1'), 
       ('Aeroknox scorpius pistol grip for AK'), ('SIG MCX pistol grip'), ('DLG-123 pistol grip for AR-15 based systems');

-- Hand Guards
INSERT INTO hand_guards (hand_guard_name)
VALUES ('daniel defence FDE');
VALUES ('Lancer OEM 14 inch M-LOK foregrip for MPX'), ('Troy Industries 13" M-LOK foregrip for 416A5'), ('Strike Industries CRUX 15" M-LOK foregrip for 416A5'), 
       ('Desert Tech foregrip for MDR'), ('HK MRS 14" keymod foregrip for 416A5'), ('Zenit B-10 AK Handguard'), ('SAI 10" QD Rail foregrip for AR15'), 
       ('Midwest 14 inch M-LOK foregrip for MPX'), ('Midwest 10.5 inch M-LOK foregrip for MPX'), ('Midwest 4.5 inch M-LOK foregrip for MPX'), 
       ('Stngr Vypr 10" M-LOK foregrip for AR15'), ('Daniel Defence RIS II 12.25 foregrip for AR-15-compatible systems'), 
       ('Magpul MOE SL carbine length M-LOK foregrip for AR15'), ('Daniel Defence FDE RIS II FSP 9.5 foregrip for AR-15-compatible systems'), ('Polymer SVDS handguard'), 
       ('SAI 14.5" QD Rail foregrip for AR15'), ('Midwest 6.5 inch M-LOK foregrip for MPX'), ('Midwest 9" M-LOK foregrip for 416A5'), ('Magpul Zhukov-U HAND GUARD for AK'), 
       ('Magpul MOE SL mid length M-LOK foregrip for AR15'), ('Midwest 13.5" M-LOK foregrip for 416A5'), ('Izhmash RPK-16 regular handguard'), 
       ('ADAR 2-15 wooden stock for AR-15 and compatibles'), ('VLTOR CMRD Keymod handguard for AK'), ('HK quadrail handguard for 416-compatible systems'), 
       ('HK quadrail handguard with a flip-up sight for 416-compatible systems'), ('HK extended quadrail handguard for 416-compatible systems'), 
       ('DS Arms Quad Rail Full Length foregrip for SA-58'), ('Vltor CASV FAS foregrip for FAL'), ('Vltor CASV FAL foregrip for FAL'), 
       ('Original Austrian foregrip for a FAL'), ('DSA Belgian style foregrip for a FAL'), ('Aim sport Universal M-LOK foregrip for FAL'), 
       ('Aim sport Universal keymod foregrip for FAL'), ('Hexagon handguard for AK'), ('DS Arms quad rail foregrip for SA-58'), 
       ('Handguard MK 10 for use with AR-15 and compatible'), ('Strike industries TRAX 1 foregrip'), ('Strike industries TRAX 2'), 
       ('Colt M4 Length handguard for AR-15 and compatibles'), ('XRSU47SU Tactical Handguard for AKS-74U'), ('MP5 TL-99 Aluminum handguard'), 
       ('MP5 Wide Tropical Polymer handguard'), ('Wooden AK-74 handguard (6P20 Sb.6)'), ('Magpul MOE AKM HAND GUARD for AK'), ('LOBAEV Arms DVL-10 M2 handguard'), 
       ('Wooden AKM / VPO-209 handguard'), ('Wooden AK-74 handguard (6P1 Sb.6-1)'), ('Wooden VPO-136 handguard'), ('Izhmekh MP-153 Polymer stock'), 
       ('Krebs Custom UFM Keymod System handguard for AKM'), ('MP5SD Polymer handguard'), ('Izhmekh MP-133 Beechwood forestock'), ('B-11 AKS-74U Handguard'), 
       ('Handguard SIG MPX Gen. 1 for MPX'), ('Remington Arms handguard for a R11 RSASS'), ('Handguard War Sport LVOA-C blk. for use with AR-15 and compatible'), 
       ('Handguard War Sport LVOA-S blk. for use with AR-15 and compatible'), ('Daniel Defence RIS II 9.5 foregrip for AR-15-compatible systems'), 
       ('SOK-12 aluminum handguard MTU002 Long Top'), ('Polymer AK-74 foregrip (6P20 Sb.9)'), ('SOK-12 polymer handguard Sb.7-1'), 
       ('SOK-12 aluminum handguard MTU002 Short Top'), ('CAA RS47 foregrip for AK-compatible systems'), ('	B-10M foregrip and rail mount B-19'), 
       ('Wooden AKS-74U Handguard (6P26 Sb.6)'), ("Knight's Armament KAC RIS handguard for AR-15 and compatibles"), ('Custom plastic MP-133 forestock with mounts'), 
       ('Fab Defence PR870 forestock'), ('Magpul MOE M870 forestock'), ('Speedfeed short M870 forestock'), ('Polymer AK-100 series foregrip'), ('Polymer ASh-12 foregrip'), 
       ('A*B Arms MOD X Gen.3 keymod handguard for M700'), ('5.45 Design "Aggressor" handguard for AK'), ('Strike Industries Viper carbine length M-LOK foregrip for AR-15'), 
       ('Noveske SWS N6 10.5 inch foregrip for AR-10-compatible systems'), ('Noveske SWS N6 Split handguard for AR-10-compatible systems'), ('CAA HX-5 MP5 handguard'), 
       ('URX 3.1 10.75" handguard for AR15'), ('URX 3 8" handguard for AR15'), ('Alfa Arms Goliaf AKS-74U Handguard'), ('PTR Tri-Rail MP5 handguard'), 
       ('TDI AKM-L handguard for AK'), ('Wooden CAF WASR 10-63 handguard'), ('MP5k Polymer handguard'), ('Lone Star Ion Lite handguard for AR-15 and compatible'), 
       ('URX-4 handguard for AR-10 and compatible'), ('Orsis handguard for T-5000'), ('SAG MK1 Freefloat Chassis for SVD'), ('CAA XRS DRG for SVD'), 
       ('Izhmash modern handguard for SVD'), ('Geissele SMR Mk.16 9.5 inch M-LOK handguard for AR-15'), ('Geissele SMR Mk.16 13.5 inch M-LOK handguard for AR-15'), 
       ('Speedfeed short M590A1 forestock'), ('Magpul MOE M590 forestock'), ('	B-30 foregrip and rail mount B-31С'), ('TOZ KS-23M forestock'), 
       ('Kel-Tec RFB regular handguard'), ('Lancer LCH-7 12.5 inch M-LOK handguard for AR-10'), ('SOK-12 aluminum handguard Bravo-18'), 
       ('X47 Tactical Handguard for AK and compatible'), ('SIG 12" keymod foregrip for MCX'), ('SIG 8" keymod foregrip for MCX'), 
       ('Sword int. 18 inch handguard for Mk-18'), ('STM 9 inch M-LOK handguard for AR-15'), ('STM 12 inch M-LOK handguard for AR-15'), 
       ('STM 15 inch M-LOK handguard for AR-15');

-- Receivers
INSERT INTO receivers (receiver_name)
VALUES ('upper receiver ADAR');

-- Gas Tubes
INSERT INTO gas_tubes (gas_tube_name)
VALUES ('colt m4 front sight');

-- Sights
INSERT INTO sights (sight_name)
VALUES ('Eotech HHS-1');
VALUES ('ELCAN SpecterDR 1x/4x Scope'), ('Leupold Mark 4 HAMR 4x24mm DeltaPoint hybrid assault scope'), ('Primary Arms Compact prism scope 2.5x'), ('Sig BRAVO4 4X30 Scope'), 
       ('Trijicon ACOG 3.5x35 scope'), ('Trijicon ACOG TA01NSN 4x32 scope'), ('Valday PS-320 1x/6x Scope'), ('Monstrum Compact prism scope 2x32'), 
       ('Aimpoint COMP M4 reflex sight'), ('Cobra EKP-8-02 reflex sight'), ('Cobra EKP-8-18 reflex sight'), ('Eotech 553 holographic sight'), 
       ('Eotech EXPS3 holographic sight'), ('Eotech HHS-1 sight'), ('Eotech XPS3-0 holographic sight'), ('Eotech XPS3-2 holographic sight'), ('Holosun HS401G5 reflex sight'), 
       ('OKP-7 reflex sight'), ('OKP-7 reflex sight (Dovetail)'), ('VOMZ Pilad P1X42 "WEAVER" reflex sight'), ('Valday 1P87 holographic sight'), 
       ('Vortex Razor AMG UH-1 holographic sight'), ('Walther MRS reflex sight'), ('Trijicon SRS-02 reflex sight'), ('Belomo PK-06 reflex sight'), 
       ('Aimpoint Micro T-1 reflex sight'), ('Burris FastFire 3 Reflex Sight'), ('Leupold DeltaPoint Reflex Sight'), ('Trijicon RMR'), ('Sig Sauer Romeo 4 reflex sight'), 
       ('PU 3.5x riflescope'), ('Nightforce ATACR 7-35x56 riflescope'), ('Leupold Mark 4 LR 6.5-20x50 riflescope'), ('Optical scope March Tactical 3-24x42 FFP'), 
       ('Hensoldt FF 4-16x56 scope'), ('Zenit-Belomo PSO 1 4x24 scope'), ('Zenit-Belomo PSO 1M2 4x24 scope'), ('Zenit-Belomo PSO 1M2-1 4x24 scope'), 
       ('EOtech Vudu 1-6 riflescope'), ('Burris FullField TAC 30 1-4x24 riflescope'), ('NPZ USP-1 4x scope'), ('KMZ 1P59 3-10x riflescope'), ('KMZ 1P69 3-10x riflescope'), 
       ('VOMZ Pilad 4x32 riflescope'), ('NcSTAR ADO P4 Sniper 3-9x42 riflescope'), ('Vulcan MG night scope 3.5x'), ('Trijicon REAP-IR thermal riflescope'), 
       ('NSPU-M night Scope'), ('FLIR RS-32 2.25-9x 35mm 60Hz thermal riflescope');

-- Sight Mounts
INSERT INTO sight_mounts (mount_name)
VALUES ('25 mm mount ring'), ('25mm rings made by UTG'), ('30mm ring-mount AR- P.E.P.R. made by Burris'), ('30mm ring-mount made by JP'), 
       ('30mm ring-mount Remington integral for model 700 rifles'), ('30mm rings made by Nightforce'), ('30mm Scope mount'), 
       ('34mm one piece magmount made by I-E-A Mil Optics'), ('34mm one piece magmount made by Nightforce'), 
       ('34mm one piece magmount made by Nightforce with a Multimount rail'), ('Aimpoint LRP mount for COMP M4 sights'), ('Aimpoint Micro Spacer High'), 
       ('Aimpoint mount for the sights of Micro series'), ('Armasight universal base'), ('Burris FastFire Weaver Base'), ('Compact mount for sights'), 
       ('Cross Slot Mount base for Deltapoint scopes'), ('High profile mount for Trijicon RMR'), ('KMZ 1P59 Dovetail mount'), ('KMZ 1P69 Weaver mount'), 
       ('Low profile mount for Trijicon RMR'), ('TA51 Mount for sights'), ('Trijicon RMR mount for ACOG scopes'), ('UNV DLOC-IRD Mount for sights');

-- Magazine
INSERT INTO magazines (magazine_name)
VALUES ('Colt AR-15');
VALUES ('F5 MPX Drum mag 50-round 9x19 magazine'), ('TROY Battlemag 5.56x45 STANAG 30-round magazine'), ('ProMag AALVX 35 7.62x39 35-round SKS magazine'), 
       ('MPX with TTI Base pad +11 41-round 9x19 magazine'), ('7.62x51 metal magazine for VPO-101 and compatibles, 10-round capacity'), 
       ('5-shot MC 20-01 Sb.3 20ga magazine for TOZ-106'), ('20-round SVD 7.62x54 magazine'), ('7.62x51 metal magazine for VPO-101 and compatibles, 5-round capacity'), 
       ('ProMag AK-A-16 73-round 7.62x39 magazine for AKM and compatibles'), ('P226 Extended magazine 9x19'), ('HK PM Gen.2 5.56x45 STANAG 30-round magazine'), 
       ('10 rnds. SKS internal box magazine 7.62x39'), ('10-round SVD 7.62x54 magazine'), ('HK Polymer mag 30 5.56x45 STANAG 30-round magazine'), 
       ('100-round MAG5-100 5.56x45 STANAG magazine'), ('Standard MPX 20-round 9x19 magazine'), ('PUFGUN SG-919 20 20-round 9x19 magazine for PP-19-01'), 
       ('PUFGUN SG-919 30 30-round 9x19 magazine for PP-19-01'), ('Arsenal CWP 30-round 5.56x45 magazine for SLR-106 and compatible weapons'), 
       ('HK Steel Maritime 5.56x45 STANAG 30-round magazine'), ('5-round .308 M700 magazine'), ('10-round .308 M700 magazine'), 
       ('95-round 5.45x39 magazine for RPK-16 and compatibles'), ('30-round 5.45x39 magazine for AK-12 and compatibles'), 
       ('7.62x54r ProMag OPFOR for Archangel Mosin rifle kit, 10-round capacity'), ('British FAL/L1A1 7.62x51 30 rnd magazine'), ('X-14 M14 50 round 7.62x51 magazine'), 
       ('M14 30 round 7.62x51 magazine'), ('Regular 4rnd magazine for Mosin rifle'), ('PMAG GEN M3 30 5.56x45 STANAG 30-round magazine'), 
       ('6L29 30-round 5.56x45 magazine for AK-101 and compatible weapons'), ('30-round 7.62x39 magazine for AK-103 and compatible weapons'), ('M1A 20 round 7.62x51 magazine'), 
       ('PMAG GEN M3 10 5.56x45 STANAG 10-round magazine'), ('Pmag 30 AK74 GEN M3 5.45x39 magazine for AK and compatibles, 30-round capacity'), 
       ('30-round SR3M.130 9x39 SR3M magazine'), ('SAI-02 10-round 12x76 magazine for SOK-12 and compatible weapons'), ('8-shell MP-133x8 12ga magazine'), 
       ('Izhmash 6L10 7.62x39 magazine for AK and compatibles, 30-round capacity'), ('7.62x39 ribbed metal magazine for AK and compatibles, 10-round capacity'), 
       ('SR1-MP magazine'), ('P226 magazine'), ('20-round 6L25 9x39 VSS magazine'), ('30-round 6L23 5.45x39 magazine for AK-74 and compatibles'), 
       ('45-round 6L26 5.45x39 magazine for AK-74 and compatibles'), ('10-round .308 DVL-10 magazine'), ('MP-443 9x19 18-round magazine'), 
       ('Standard MP5 30-round 9x19 magazine'), ('Glock 9x19 magazine'), ('Standard MPX 30-round 9x19 magazine'), ('6-shell MP-133x6 12ga magazine'), ('MP-153 forend cap'), 
       ('X Products X-5 MP5 50-round 9x19 magazine'), ('MP-153 5-rd magazine extension'), ('MP-153 6-rd magazine extension'), ('MP-153 7-rd magazine extension'), 
       ('MP-153 8-rd magazine extension'), ('60-round 6L31 5.45x39 magazine for AK-74 and compatibles'), 
       ('Palm US AK30 7.62x39 magazine for AK and compatibles, 30-round capacity'), ('TT-105 7.62x25 TT Magazine'), ('PM/PPSH 9x18PM 84-round drum mag for PM'), 
       ('90-93 9x18PM Magazine, for 8 PM rounds'), ('Sb.5 5-round 12/76 magazine for SOK-12 and compatible weapons'), ('ProMag SKS-A5 7.62x39 20-round SKS magazine'), 
       ('6L20 30-round 5.45x39 magazine for AK-74 and compatible weapons'), ('10-round 6L24 9x39 VSS magazine'), 
       ('6L18 45-round 5.45x39 magazine for AK-74 and compatible weapons'), ('Izhmash AK magazine (issued ‘55 or later) 30-round for 7.62x39 AK and compatibles'), 
       ('Izhmash 7.62x39 AKMS aluminium magazine for AK and compatibles, 30-round capacity'), ('10-round Saiga 545 5.45x39 magazine for AK-74 and compatibles'), 
       ('10-round polymer magazine 7.62x54R for SV-98'), ('Molot 6P2.Sb-11 7.62x39 magazine for AK and compatibles, 40-round capacity'), 
       ('PMAG 30 AK/AKM GEN M3 7.62x39 magazine for AK and compatibles, 30-round capacity'), ('Standard APS 9x18PM 20-round magazine'), ('10-round Izh.9x19 Sb.7 magazine'), 
       ('Standard PP-19-01 30-round 9x19 magazine'), ('Standard 9x18PM 20-round magazine for PP-91'), ('Standard 9x18PM 30-round magazine for PP-91'), 
       ('Colt AR-15 5.56x45 STANAG 30-round magazine'), ('Magpul PMAG D-60 5.56x45 60-round magazine'), ('PMAG GEN M3 20 5.56x45 STANAG 20-round magazine'), 
       ('40-round PMAG GEN M3 40 5.56x45 STANAG magazine'), ('PMAG GEN M3 W 30 5.56x45 STANAG 30-round magazine'), ('60-round MAG5-60 5.56x45 STANAG magazine'), 
       ('PMAG SR/LR GEN M3 20 7.62x51 20 rnd'), ('2-shot MC 20-01 Sb.3 20ga magazine for TOZ-106'), ('4-shot MC 20-01 Sb.3 20ga magazine for TOZ-106'), 
       ('10-shell M870x10 12ga magazine'), ('7-shell M870x7 12ga magazine'), ('Pmag GL9 polymer magazine'), ('SGMT Drum mag for Glock 9x19, 50 rounds capacity'), 
       ('4-shell M870 12ga magazine cap'), ('"Big Stick" 9x19 magazine for Glock 9x19'), ('FAL/SA-58 7.62x51 20 rnd'), ('FAL/SA-58 7.62x51 30 rnd'), 
       ('FAL/SA-58 7.62x51 10 rnd'), ('X-FAL FAL/SA-58 7.62x51 50 rnd magazine'), ('FAL/SA-58 "MMW" 7.62x51 20 rnd plastic mag'), 
       ('Bakelite 7.62x39 magazine for AK and compatibles, 40-round capacity'), ('Izhmash 7.62x39 AK aluminium magazine for AK and compatibles, 10-round capacity'), 
       ('Standard MP7 20-round 4.6x30 magazine'), ('Standard MP7 30-round 4.6x30 magazine'), ('Standard MP7 40-round 4.6x30 magazine'), ('M9A3 9x19 17-round magazine'), 
       ('12.7x55 magazine for ASh-12, 10-round capacity'), ('12.7x55 magazine for ASh-12, 20-round capacity'), ('X-47 AK 7.62x39 50 rnd magazine'), 
       ('Molot magazine for AK and compatibles, 75-round capacity'), ('FN magazine for P90, 50-round capacity'), ('Magpul PMAG .308 AC 5-round M700 magazine'), 
       ('Promag AA-70 10-round .308 M700 magazine'), ('Promag AA-70 20-round .308 M700 magazine'), 
       ('MaxRounds Powermag 20-round 12/76 magazine for SOK-12 and compatible weapons'), ('5-round .308 AICS M700 magazine'), ('10-round .308 AICS M700 magazine'), 
       ('12-round .308 MDT AICS M700 magazine'), ('Magpul PMAG .308 AC 10-round M700 magazine'), ('Standard MP5 20-round 9x19 magazine'), 
       ('Five-seveN 20-Round 5.7x28 magazine'), ('Standard 9x19 15-round magazine for MP9'), ('Standard 9x19 20-round magazine for MP9'), 
       ('Standard 9x19 25-round magazine for MP9'), ('Standard 9x19 30-round magazine for MP9'), ('KAC Steel 10 7.62x51 10 rnd'), ('KAC Steel 20 7.62x51 20 rnd'), 
       ('Metal magazine for VPO-215 and compatibles, .366 TKM 4-round capacity'), ('5-round .308 T-5000 magazine'), ('35-round 7.62x25 magazine for PPSH-41'), 
       ('71-round 7.62x25 magazine for PPSH-41'), ('M1911 .45 ACP 7-round magazine'), ('Mec-Gar .45 ACP 11-round magazine for M1911A1'), ('8-shell M590A1 12ga magazine cap'), 
       ('3-shell KS-23M 23mm magazine cap'), ('M45A1 .45 ACP 7-round magazine'), ('Glock .45 ACP magazine'), ('Magex G30 magazine for Glock .45 ACP'), 
       ('Standard UMP 25-round .45 ACP magazine'), ('Sword Int. Mk-18 .338 LM 10-round magazine'), ('PL-15 9x19 magazine, 16-round capacity');

-- Barrels
INSERT INTO barrels (barrel_name)
VALUES ('18" barrel AR-15');
VALUES ('10.6" barrel for 416A5 and compatible 5.56x45'), ('10.5" 9x19 barrel for MPX'), ('6.5" 9x19 barrel for MPX'), ('406mm barrel for MDR and compatible 5.56x45'), 
       ('22" barrel for a SVDS 7.62x54'), ('4.5" 9x19 barrel for MPX'), ('14" 9x19 barrel for MPX'), ('406mm Molot barrel for AR-15 and compatible 5.56x45'), 
       ('	20" barrel for a Remington M700 7.62x51 NATO'), ('26" barrel for a Remington M700 7.62x51 NATO'), ('Sawn off 200mm Mosin barrel'), ('Sawn off 220mm Mosin barrel'), 
       ('Regular 514mm Mosin carbine barrel'), ('15" barrel for RPK-16 and compatible 5.45x39'), ('22" barrel for RPK-16 and compatible 5.45x39'), 
       ('11" barrel for 416A5 and compatible 5.56x45'), ('14.5" barrel for 416A5 and compatible 5.56x45'), ('16.5" barrel for 416A5 and compatible 5.56x45'), 
       ('20" barrel for 416A5 and compatible 5.56x45'), ('11" barrel for SA-58 7.62x51'), ('16" barrel for SA-58 7.62x51'), ('21" barrel for SA-58 7.62x51'), 
       ('22" barrel for a M1A 7.62x51 NATO'), ('Regular 730mm Mosin barrel'), ('16" barrel for a M1A 7.62x51 NATO'), ('18" barrel for a AR-10 and compatible 7.62x51 NATO'), 
       ('510mm barrel for MP-133 12ga'), ('500mm .308 barrel for DVL-10'), ('116mm 7.62x25 TT barrel'), ('116mm 7.62x25 TT gilded barrel'), 
       ('Homespun 121mm 7.62x25 TT barrel with threading'), ('Threaded barrel for P226 9x19'), ('260mm barrel for AR-15 and compatible 5.56x45'), 
       ('370mm barrel for AR-15 and compatible 5.56x45'), ('165 mm 9x19 barrel for MPX-SD'), ('203 mm 9x19 barrel for MPX'), ('510mm barrel for MP-133 12ga shotgun with rib'), 
       ('540mm barrel for MP-133 12ga shotgun'), ('540mm barrel for MR-133 12ga shotgun with rib'), ('610mm barrel for MP-133 12ga shotgun'), 
       ('610mm barrel for MP-133 12ga shotgun with rib'), ('660mm barrel for MR-133 12ga shotgun'), ('660mm barrel for MP-133 12ga shotgun with rib'), 
       ('710mm barrel for MP-133 12ga shotgun'), ('710mm barrel for MR-133 12ga shotgun with rib'), ('750mm barrel for MP-133 12ga shotgun'), 
       ('750mm barrel for MP-133 12ga shotgun with rib'), ('610 mm barrel for MP-153 12ga shotgun'), ('660 mm barrel for MP-153 12ga shotgun'), 
       ('750 mm barrel for MP-153 12ga shotgun'), ('112mm barrel for P226 9x19'), ('660mm .308 barrel for DVL-10 M2'), ('22" barrel for a AR-10 and compatible 7.62x51 NATO'),
       ('710 mm barrel for MP-153 12ga shotgun'), ('Threaded barrel for Glock 9x19 manufactured by Lone Wolf.'), ('660mm vent rib barrel for M870 12ga'), 
       ('508mm barrel for M870 12ga'), ('Basic barrel for Glock 17 9x19'), ('Cut off 325mm barrel for M870 12ga'), ('355mm barrel for M870 12ga'), 
       ('508mm barrel for M870 12ga with a fixed sight'), ('Threaded barrel for Glock 9x19 manufactured by Double Diamond'), ('Barrel with compensator for Glock 17 9x19'), 
       ('Threaded barrel for Glock 9x19 manufactured by Salient Arms'), ('Barrel with compensator for Glock 18C 9x19'), ('Threaded barrel for M9A3 9x19'), 
       ('10.5" barrel for P90 5.7x28'), ('16" barrel for P90 5.7x28'), ('26" stainless steel barrel for a Remington M700 7.62x51 NATO'), 
       ('20" stainless steel barrel for a Remington M700 7.62x51 NATO'), ('Barrel for Five-seveN 5.7x28'), ('Threaded barrel for Five-seveN 5.7x28'), 
       ('18" barrel for AR-15 and compatible 5.56x45'), ('20" barrel for AR-15 and compatible 5.56x45'), ('660mm .308 barrel for T-5000'), 
       ('20" barrel for SR-25 and compatible 7.62x51'), ('16" barrel for SR-25 and compatible 7.62x51'), ('23" barrel for a VPO-215 .366TKM'), 
       ('16 inch .308 barrel for MDR and compatible'), ('Standard barrel for M1911A1 .45 ACP'), ('10.6" barrel for PPSH-41 7.62x25'), ('20" barrel for M590 12ga'), 
       ('510mm barrel for KS-23 23x75mm'), ('700mm barrel for KS-23 23x75mm'), ('18" barrel for RFB 7.62x51'), ('National match barrel for M1911 .45 ACP'), 
       ('Threaded barrel for M1911A1 .45 ACP'), ('171mm barrel for MCX and compatible .300 BLK'), ('229mm barrel for MCX and compatible .300 BLK'), 
       ('5" barrel for Vector 9x19'), ('6" barrel for Vector 9x19'), ('5" Vector barrel .45 ACP'), ('6" Vector barrel .45 ACP'), ('8" barrel for UMP .45 ACP'), 
       ('24" barrel for Mk-18 .338 LM'), ('Regular barrel for PL-15 9x19'), ('	Threaded barrel for PL-15'), ('10.5" barrel for STM-9 9x19'), ('12" barrel for STM-9 9x19'), 
       ('14" barrel for STM-9 9x19'), ('16" barrel for STM-9 9x19'), ('VSS 9x39 integral barrel-suppressor'), ('AS VAL 9x39 integral barrel-suppressor');

-- Muzzles
INSERT INTO muzzles (muzzle_name, adaptor_required)
VALUES ('Gemtech ONE 7.62x51 Sound Suppressor', true), ('AAC Illusion 9 9x19mm silencer', true), ('Sig SRD 9 9x19mm sound suppressor', true), 
       ('Regular SV-98 7.62x54 silencer', true), ('Surefire SOCOM556-MONSTER 5.56x45 silencer', true), ('Surefire SOCOM556-MINI MONSTER 5.56x45 Silencer', true), 
       ('B&T Rotex 2 4.6x30 silencer', true), ('Bramit silencer for a Mosin rifle', true), ('Hexagon 12K sound suppressor', true), ('PBS-4 5.45x39 Silencer', true), 
       ('Hexagon AK-74 5.45x39 sound suppressor', true), ('Hexagon SKS 7.62x39 sound suppressor', true), ('Zenit DTK-4M muzzle brake', true), 
       ('Hexagon AKM 7.62x39 sound suppressor', true), ('Rotor 43 9x19 muzzle brake', true), ('Rotor 43 7.62x39 muzzle brake', true), ('Rotor 43 .366TKM muzzle brake', true), 
       ('Rotor 43 5.56x45 muzzle brake', true), ('Silencer APB 9x18PM', true), ('SilencerCo Salvo 12 sound suppressor', true), ('MP5SD 9x19 silencer', true), 
       ('AAC 762 SDN-6 7.62x51 Sound Suppressor', true), ('SilencerCo Osprey 9 9x19mm sound suppressor', true), ('SR1MP silencer 9x21', true), 
       ('Silencerco Hybrid 46 multi-caliber silencer', true), ('Vityaz 9x19 sound suppressing device', true), ('Makeshift 7.62x25 TT silencer', true), 
       ('Fischer Development FD917 suppressor', true), ('Alpha Dog Alpha 9 9x19 sound suppressor', true), ('KAC QDSS NT-4 5.56x45 silencer', true), 
       ('MPX-SD 9x19 Integrated silencer', true), ('PBS-1 7.62x39 silencer', true), ('Stock silencer for PB 9x18 PM', true), ('TGP-A 5.45x39 muzzle device/suppressor', true), 
       ('PP-91-01 Kedr-B 9x18PM suppressor', true), ('ASh-12 12.7x55 tactical suppressor', true), ('FN Attenuator 5.7x28 silencer', true), 
       ('Daniel Defence Wave QD Sound Suppressor', true), ('Gemtech SFN-57 5.7x28mm silencer', true), ('Thunder Beast Ultra 5 Sound Suppressor', true), 
       ('KAC PRS QDC 7.62x51 Sound Suppressor', true), ('Rotor 43 7.62x54 muzzle brake', true), ('B&T MP9 9x19mm sound suppressor', true), 
       ('Hexagon "DTKP MK.2" 7.62x39 sound suppressor', true), ('Surefire SOCOM556-RC2 5.56x45 silencer', true), ('Rotor 43 7.62x51 muzzle brake for VPO-101', true), 
       ('Sig-Sauer "SRD" 7.62x51 Sound Suppressor', true), ('Sig-Sauer SRD QD 7.62x51 Sound Suppressor', true), ('SilencerCo Omega 45k .45 ACP sound suppresso', true), 
       ('PL-15 9x19mm sound suppressor', true), ('Izhmash 7.62x39 AKM muzzle brake & compensator (6P1 0-14)', true), 
       ('Molot 7.62x39 Vepr KM / VPO-136 muzzle brake & compensator', true), ('Thread protection for AKM/VPO-209', true), ('KAC QD Compensator 5.56x45', true), 
       ('Izhmash 7.62x39 flash hider for AKML system', true), ('AAC Blackout 51T flash hider (7.62x51)', true), ('Carver Custom 4 Port 9x19 muzzle brake', true), 
       ('Decelerator 3 Port 9x19 Compensator', true), ('Double Diamond flash hider', true), ('Alpha Wolf Bullnose 9x19 Compensator', true), 
       ('Lone Wolf Compensator 9 9x19', true), ('Strike Industries G4 slide compensator 9x19', true), ('Lantac Dragon 7.62x39 muzzle brake & compensator for AK', true), 
       ('SAI Jail Break 5.56x45 for AR-15', true), ('AAC Blackout 51T 5.56x45 flash-hider', true), ('Thread adapter 7.62x54 for SV-98', true), 
       ('Surefire WarComp 5.56x45 Flash hider for AR-15', true), ('Lantac Dragon 7.62x51 muzzle brake', true), ('Izhmash 7.62x54 SVDS muzzlebrake & compensator', true), 
       ('SRVV "Mk.2.0" compensator 7.62x54 for SV-98', true), ('Venom Antidote muzzle brake & compensator for AK', true), ('Surefire SF3P 5.56x45 Flash hider for AR-15', true), 
       ('TJ Custom 9x19 Compensator', true), ('Desert Tech 5.56x45 Flash hider', true), ('HK Noveske style muzzle brake & compensator for MP-5', true), 
       ('PM-Laser DTK-TT muzzle brake for TT pistol', true), ('Izhmash 5.45x39 RPK-16 muzzle brake & compensator', true), ('ADAR 2-15.56x45 Flashhider', true), 
       ('Noveske KX3 5.56x45 flash hider', true), ('Muzzle brake Odin Works Atlas-7 7.62x51 for AR-10', true), ('Tacfire Tanker style muzzle brake for Mosin rifle', true), 
       ('Witt Machine muzzle brake for Mosin rifle', true), ('HK A1 4.6x30 Flash hider for MP7', true), ('DS Arms "Austrian Style" 7.62x51 muzzle brake for SA-58', true), 
       ('Compensator 2A "X3" 7.62x51 for AR-10', true), ('Annihilator 7.62x39, 5.56x45 and 9mm flash hider for AR-15', true), 
       ('DS Arms "3 prong trident" 7.62x51 Flash hider for SA-58', true), ('Phantom 7.62x51 muzzle brake & compensator for M14', true), 
       ('Vortex DC 7.62x51 muzzle brake & compensator for M14', true), ('National Match 7.62x51 muzzle brake & compensator for M1A', true), 
       ('JP Enterprises tactical compensator 7.62x51 muzzle brake & compensator for M14', true), ('Good Iron 7.62x51 muzzle brake & compensator for M14', true), 
       ('Izhmash 5.45x39 AK-74 muzzle brake & compensator (6P20 0-20)', true), ('Zenit DTK-1 7.62x39 & 5.45x39 muzzle brake & compensator for AK', true), 
       ('Izhmash 5.45x39 muzzle brake for AKS-74U (6P26 0-20)', true), ('Colt USGI A2 5.56x45 Flash hider for AR-15', true), ('PWS CQB 5.56 x 45 Muzzle brake', true), 
       ('A2 9x19 Flash hider for MPX', true), ('SV-98 muzzle device', true), ('Muzzle brake Vendetta precision VP-09 5.56x45', true), 
       ('Izhmash 9x19 PP-19-01 muzzle brake/compensator', true), ('Izhmash 9x19 Saiga-9 muzzle brake/compensator', true), ('PWS CQB 74 5.45x39 Muzzle brake', true), 
       ('DVL-10 M2 muzzle brake', true), ('DVL-10 muzzle device', true), ('Tromix Monster Claw 12ga muzzle brake', true), ('GK-02 Muzzle Brake', true), 
       ('Remington Tactical Choke 12ga', true), ('Socom 16 7.62x51 muzzle brake & compensator for M1A (threaded)', true), 
       ('Izhmash 5.56x45 AK-101 muzzlebrake & compensator', true), ('Izhmash 5.45x39 AK-74M muzzle brake & compensator (6P20 0-20)', true), 
       ('Izhmash 5.45x39 AK-105 muzzlebrake & compensator (6P44 0-20)', true), ('Izhmash 7.62x39 AK-104 muzzlebrake & compensator (6P46 0-20)', true), 
       ('Izhmash 7.62x39 AK-103 muzzlebrake & compensator', true), ('Izhmash 5.56x45 AK-102 muzzlebrake & compensator (6P44 0-20)', true), 
       ('Socom 16 7.62x51 muzzle brake & compensator for M1A (unthreaded)', true), ('Spike tactical dynacomp 7.62x39 muzzle brake & compensator for AK', true), 
       ('Texas Precision Products muzzle brake for Mosin rifle', true), ('Fortis Red Brake 7.62x51 muzzle brake for AR-10', true), ('ASh-12 regular muzzle brake 12.7x55', true),
       ('FN P90 5.7x28 flash hider', true), ('SRVV 5.45x39 AK-74 muzzle brake', true), ('SRVV 7.62x39 AK muzzle brake & compensator', true), 
       ('TROY Claymore 5.56x45 muzzle brake for AR-15', true), ('Muzzle brake Keeno Arms SHREWD 7.62x51 for AR-10', true), 
       ('Muzzle brake Precision Armament M-11 7.62x51 for AR-10', true), ('Carbine brake for SIG MPX by TACCOM', true), ('Bulletec ST-6012 5.56x45 Flash hider for AR-15', true),
       ('Lantac "Blast mitigation device" 7.62x51', true), ('Nordic Corvette 7.62x51 muzzle brake for AR-10', true), ('Nordic Corvette 5.56x45 compensator for AR-15', true), 
       ('Daniel Defense Wave Muzzle Brake 5.56x45', true), ('Daniel Defense Wave Muzzle Brake 7.62x51', true), ('Thunder Beast 223CB Muzzle brake 5.56x45', true), 
       ('Thunder Beast 30CB Muzzle Brake 7.62x51', true), ('KAC QDC Flash suppressor kit 7.62x51 flash hider', true), ('Orsis T-5000M muzzle brake', true), 
       ('Desert Tech .308 Flash hider', true), ('Surefire FH556RC 5.56x45 Flash hider for AR-15', true), ('Anarchy Outdoors Muzzle Brake .45 ACP', true), 
       ('Regular RFB 7.62x51 Flash hider', true), ('Ferfrans "CRD" 5.56x45', true), ('Ferfrans Muzzle Brake 5.56x45', true), 
       ('JMAC RRD-4C 7.62x39 muzzle brake for AKM type thread', true), ('JMAC RRD-4C muzzle brake for AK-74 type thread', true), 
       ('SilencerCo AC-858 ASR .338 LM Muzzle brake', true), ('3-prong SIG Flash hider 7.62x51', true), ('SIG micro brake muzzle brake 7.62x51', true), 
       ('SIG Two Port brake muzzle brake 7.62x51', true), ('KRISS Vector 9x19 Flash hider', true), ('Kriss Vector .45 ACP Flash hider', true), ('STM-9 9x19 muzzle brake', true);

-- Muzzle Adaptors
INSERT INTO muzzle_adaptors (adaptor_name)
VALUES ('Direct Thread Mount adapter for Gemtech ONE');

-- Bolts
INSERT INTO bolts (bolt_name)
VALUES ('ADAR 2-15 charging handle');
VALUES ('Geissele "SCH" charging handle for MPX'), ('ADAR 2-15 charging handle for AR-15'), ('HK Extended latch Charging Handle'), 
       ('Badger Ordnance Tactical Charging Handle Latch'), ('Raptor charging handle for AR-15'), ('Colt AR-15 charging handle for AR-15'), ('MP5 Cocking Handle'), 
       ('SIG double latch charging handle for MPX'), ('SIG single latch charging handle for MPX'), ('FN charge handle for P90'), ('K&M The Handler charge handle for P90'), 
       ('MP5 Kurz Cocking Handle'), ('KAC Ambidextrous Charging Handle for AR-10'), ('B&T charging handle for MP9'), ('KAC Charging Handle for SR-25'), 
       ('Geissele ACH charging handle for AR-15'), ('Avalanche Mod.2 charging handle for AR-15'), ('Sig-Sauer charging handle for MCX'), 
       ('MASP Ambi battle charging handle for AR-15');

-- Fore Grips
INSERT INTO fore_grips (fore_grip_name)
VALUES ('Fortis shift tac grip');
VALUES ('KAC Vertical pistol grip'), ('BCM MOD.3 Tactical grip'), ('SI "Cobra tactical" tactical grip'), ('Magpul M-LOK AFG Tactical grip'), ('Hera Arms CQR tactical grip'), 
       ('Fortis Shift tactical grip'), ('Magpul AFG grip'), ('Magpul RVG grip'), ('SE-5 Express Grip'), ('Tango Down Stubby BGV-MK46K tactical grip'), 
       ('Viking Tactical UVG Tactical grip'), ('Zenit RK-0 Foregrip'), ('Zenit RK-1 Foregrip'), ('Zenit RK-1 Foregrip on B-25U mount'), ('Zenit RK-2 Foregrip'), 
       ('Zenit RK-4 Foregrip'), ('Zenit RK-5 Foregrip'), ('Zenit RK-6 Foregrip'), ('ASh-12 Vertical pistol grip'), ('RTM Pillau Tactical grip'), ('B&T MP9-N Vertical grip'), 
       ('T-5000 Pad'), ('TD Aluminium skeletonized vertical grip'), ('MVF001 A3 Vertical Grip KeyMod black'), ('Sig Sauer Vertical Foregrip Keymod Black');

-- Tacticals
INSERT INTO tacticals (tactical_name)
VALUES ('LA-5 tac device');
VALUES ('Armytek Predator Pro v3 XHP35 HI Flashlight'), ('Ultrafire WF-501B Flashlight'), ('Zenit Perst-3 tactical device'), ('Zenit 2IRS Klesch flashlight + laser designator'),
       ('Zenit 2P Klesch flashlight + laser designator'), ('Zenit 2U Klesch tactical flashlight'), ('AN/PEQ-15 tactical device'), ('Glock Tactical GL21 flashlight with laser'),
       ('Holosun LS321 Tactical device'), ('LA-5 tactical device'), ('LAS/TAC 2 tactical flashlight'), ('Surefire XC1 tactical flashlight'), ('X400 tactical flashlight'), 
       ('NcSTAR Tactical blue laser LAM-Module'), ('AN/PEQ-2 tactical device'), ('Steiner Dbal PL tactical flashlight'), ('DLP "Tactical Precision" LAM Module for TT Pistol');

-- Ammo Types
INSERT INTO ammo_types (ammo_name)
VALUES ('5.56mm');
VALUES ('7.62x25mm Tokarev'), ('9x18mm Makarov'), ('9x19mm Parabellum'), ('9x21mm Gyurza'), ('.45 ACP'), ('4.6x30mm HK'), ('5.7x28mm FN'), ('5.45x39mm'), ('5.56x45mm NATO'), 
       ('.300 Blackout'), ('7.62x39mm'), ('7.62x51mm NATO'), ('7.62x54mmR'), ('.338 Lapua Magnum'), ('9x39mm'), ('.366 TKM'), ('12.7x55mm STs-130'), ('12x70mm'), ('20x70mm'), 
       ('40x46 mm');


--Stock Compatibility
INSERT INTO stock_compatibility (gun_id, stock_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);
-- Gun2
--VALUES (2, 1), (2, 3);


--Buffer Tube Compatibility
INSERT INTO buffer_tube_compatibility (stock_id, buffer_tube_id)
-- Stock name
VALUES (1, 1);


--Pistol Grip Compatibility
INSERT INTO pistol_grip_compatibility (stock_id, pistol_grip_id)
-- Stock name
VALUES (1, 1);


--Hand Guard Compatibility
INSERT INTO hand_guard_compatibility (gun_id, hand_guard_id)
-- Stock name
VALUES (1, 1);


--Receiver Compatibility
INSERT INTO receiver_compatibility (gun_id, receiver_id)
-- Receiver name
VALUES (1, 1);


--Foregrip Compatibility
INSERT INTO fore_grip_compatibility (hand_guard_id, fore_grip_id)
-- Hand Guard
VALUES (1, 1);


--Tactical Compatibility
INSERT INTO tactical_compatibility (gun_id, tactical_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);


--Sight Compatibility
INSERT INTO sight_compatibility (receiver_id, sight_id)
-- Receiver
VALUES (1, 1);


--Sight Mount Compatibility
INSERT INTO sight_mount_compatibility (sight_id, mount_id)
-- Sight
VALUES (2, 2);


--Magazine Compatibility
INSERT INTO magazine_compatibility (gun_id, magazine_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);


--Barrel Compatibility
INSERT INTO barrel_compatibility (gun_id, barrel_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);


--Muzzle Compatibility
INSERT INTO muzzle_compatibility (barrel_id, muzzle_id)
-- barrel name
VALUES (2, 1);


--Muzzle Adaptor Compatibility
INSERT INTO muzzle_adaptor_compatibility (muzzle_id, adaptor_id)
-- Muzzle name
VALUES (1, 1);


--Bolt Compatibility
INSERT INTO bolt_compatibility (gun_id, bolt_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);


--Ammo Type Compatibility
INSERT INTO ammo_type_compatibility (gun_id, ammo_id)
-- ADAR 2-15 .223 Carbine
VALUES (1, 1);