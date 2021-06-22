import random

def generate_weapon(db):
    weapon = []
    # gun = random.choice(db.execute('''
    #                     SELECT id, gun_name
    #                     FROM guns
    #                     ''').fetchall())
    gun = [1, "ADAR 2-15 .223 Carbine"]
    weapon.append(gun[1])

    stockList = (db.execute('''
                SELECT s.id, s.stock_name 
                FROM stocks s JOIN stock_compatibility sc ON sc.stock_id = s.id 
                JOIN guns g ON sc.gun_id = g.id
                WHERE sc.gun_id = ?
                ''', [gun[0]]).fetchall())

    stock = random.choice(stockList)
    weapon.append(stock[1])

    bufferTubes = (db.execute('''
                SELECT b.buffer_tube_name
                FROM buffer_tubes b JOIN buffer_tube_compatibility bc ON bc.buffer_tube_id = b.id 
                JOIN stocks s ON bc.stock_id = s.id
                WHERE bc.stock_id = ?
                ''', [stock[0]]).fetchall())

    pistolGrips = (db.execute('''
                SELECT p.pistol_grip_name
                FROM pistol_grips p JOIN pistol_grip_compatibility pc ON pc.pistol_grip_id = p.id 
                JOIN stocks s ON pc.stock_id = s.id
                WHERE pc.stock_id = ?
                ''', [stock[0]]).fetchall())

    handGuards = (db.execute('''
                SELECT h.id, h.hand_guard_name
                FROM hand_guards h JOIN hand_guard_compatibility hc ON hc.hand_guard_id = h.id 
                JOIN guns g ON hc.gun_id = g.id
                WHERE hc.gun_id = ?
                ''', [gun[0]]).fetchall())

    weapon.append(random.choice(bufferTubes))
    weapon.append(random.choice(pistolGrips))
    handGuard = random.choice(handGuards)
    weapon.append(handGuard[1])

    # if stockList:
    #     stock = random.choice(stockList)
    #     weapon.append(stock[0])
    #     if (stock[1] == True):
    #         bufferTubes = (db.execute('''
    #             SELECT b.buffer_tube_name
    #             FROM buffer_tubes b JOIN buffer_tube_compatibility bc ON bc.buffer_tube_id = b.id 
    #             JOIN stocks s ON bc.stock_id = s.id
    #             WHERE bc.stock_id = ?
    #             ''', [stock[4]]).fetchall())

    #     if (stock[2] == True):
    #         pistolGrips = (db.execute('''
    #             SELECT p.pistol_grip_name
    #             FROM pistol_grips p JOIN pistol_grip_compatibility pc ON pc.pistol_grip_id = p.id 
    #             JOIN stocks s ON pc.stock_id = s.id
    #             WHERE pc.stock_id = ?
    #             ''', [stock[4]]).fetchall())

    #     if (stock[3] == True):
    #         handGuards = (db.execute('''
    #             SELECT h.hand_guard_name
    #             FROM hand_guards h JOIN hand_guard_compatibility hc ON hc.hand_guard_id = h.id 
    #             JOIN stocks s ON hc.stock_id = s.id
    #             WHERE hc.stock_id = ?
    #             ''', [stock[4]]).fetchall())
    # else: 
    #     weapon.append("None")
    
    # if bufferTubes: weapon.append(random.choice(bufferTubes))
    # else:  weapon.append("None")

    # if pistolGrips: weapon.append(random.choice(pistolGrips))
    # else: weapon.append("None")

    # if handGuards: weapon.append(random.choice(handGuards))
    # else: weapon.append("None")


    sightList = db.execute('''
                SELECT s.id, s.sight_name, s.mount_required
                FROM sights s JOIN sight_compatibility sc ON sc.sight_id = s.id 
                JOIN receivers r ON sc.receiver_id = r.id
                WHERE sc.receiver_id = ?
                ''', [gun[0]]).fetchall()
    sightMounts = []

    if sightList:
        sight = random.choice(sightList)
        weapon.append(sight[1])
        if (sight[1] == True):
            sightMounts = (db.execute('''
                SELECT m.mount_name
                FROM sight_mounts m JOIN sight_mount_compatibility sc ON sc.mount_id = b.id 
                JOIN sights s ON sc.sight_id = s.id
                WHERE sc.sight_id = ?
                ''', [sight[0]]).fetchall())
    else: 
        weapon.append("None")

    if sightMounts: weapon.append(random.choice(sightMounts))
    else: weapon.append("None")


    magazineList = db.execute('''
                SELECT m.magazine_name
                FROM magazines m JOIN magazine_compatibility mc ON mc.magazine_id = m.id 
                JOIN guns g ON mc.gun_id = g.id
                WHERE mc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if magazineList:
        weapon.append(random.choice(magazineList))
    else:
        weapon.append("None")


    barrelList = db.execute('''
                SELECT b.barrel_name
                FROM barrels b JOIN barrel_compatibility bc ON bc.barrel_id = b.id 
                JOIN guns g ON bc.gun_id = g.id
                WHERE bc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if barrelList:
        weapon.append(random.choice(barrelList))
    else:
        weapon.append("None")


    muzzleList = db.execute('''
                SELECT m.id, m.muzzle_name, m.adaptor_required
                FROM muzzles m JOIN muzzle_compatibility mc ON mc.muzzle_id = m.id 
                JOIN barrels b ON mc.barrel_id = b.id
                WHERE mc.barrel_id = ?
                ''', [gun[0]]).fetchall()
    muzzleAdaptors = []

    if muzzleList:
        muzzle = random.choice(sightList)
        weapon.append(muzzle[1])
        if (muzzle[1] == True):
            muzzleAdaptors = (db.execute('''
                SELECT m.adaptor_name
                FROM muzzle_adaptors m JOIN muzzle_adaptor_compatibility mc ON mc.adaptor_id = m.id 
                JOIN muzzles mu ON mc.muzzle_id = mu.id
                WHERE mc.muzzle_id = ?
                ''', [muzzle[0]]).fetchall())
    else: 
        weapon.append("None")

    if muzzleAdaptors: weapon.append(random.choice(muzzleAdaptors))
    else: weapon.append("None")


    boltList = db.execute('''
                SELECT b.bolt_name
                FROM bolts b JOIN bolt_compatibility bc ON bc.bolt_id = b.id 
                JOIN guns g ON bc.gun_id = g.id
                WHERE bc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if boltList:
        weapon.append(random.choice(boltList))
    else:
        weapon.append("None")

    foreGripList = db.execute('''
                    SELECT f.fore_grip_name
                    FROM fore_grips f JOIN fore_grip_compatibility fc ON fc.fore_grip_id = f.id 
                    JOIN hand_guards h ON fc.hand_guard_id = h.id
                    WHERE fc.hand_guard_id = ?
                    ''', [handGuard[0]]).fetchall()
    if foreGripList:
        weapon.append(random.choice(foreGripList))
    else:
        weapon.append("None")

    tacticalList = db.execute('''
                    SELECT t.tactical_name
                    FROM tacticals t JOIN tactical_compatibility tc ON tc.tactical_id = t.id 
                    JOIN guns g ON tc.gun_id = g.id
                    WHERE tc.gun_id = ?
                    ''', [gun[0]]).fetchall()
    if tacticalList:
        weapon.append(random.choice(tacticalList))
    else:
        weapon.append("None")

    ammoTypeList = db.execute('''
                    SELECT a.ammo_name
                    FROM ammo_types a JOIN ammo_type_compatibility ac ON ac.ammo_id = a.id 
                    JOIN guns g ON ac.gun_id = g.id
                    WHERE ac.gun_id = ?
                    ''', [gun[0]]).fetchall()
    if ammoTypeList:
        weapon.append(random.choice(ammoTypeList))
    else:
        weapon.append("None")
    return weapon


def generate_gear(db):
    gear = []
    medical = ["None", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"]
    grenades = ["None", "F-1 Hand", "RGD-5 Hand", "VOG-17 Khattabka", "VOG-25 Khattabka", "M67 Hand", "RDG-2B Smoke",
                "Zarya Stun"]
    stims = ["Combat stimulant injector SJ1 TGLabs", "Combat stimulant injector SJ9 TGLabs",
            "Combat stimulant injector SJ6 TGLabs", "Propital", "Hemostatic drug Zagustin", "Adrenaline injector",
            "Meldonin", "AHF1-M", "3-(b-TG)", "L1 (Norepinephrine)", "P22", "Cocktail 'Obdolbos'", "M.U.L.E. stimulator",
            "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
    backpacks =  ["6SH118 Raid Backpack", "LBT-2670 Slim Field Med Pack", "Mystery Ranch Blackjack 50 backpack (multicam)",
                "Eberlestock F4 Terminator load bearing backpack (tiger stripe)", "SSO 'Attack 2' raid backpack",
                "Pilgrim tourist backpack", "3V G Paratus 3-Day Operator's Tactical Backpack",
                "Eberlestock G2 Gunslinger II backpack (dry earth)", "Oakley Mechanism heavy duty backpack (black)",
                "Camelbak Tri-Zip Backpack", "Ana tactical Beta 2 battle backpack",
                "Eberlestock F5 Switchblade backpack (dry earth)", "Hazard4 Takedown sling backpack",
                "Wartech Berkut VV-102 backpack", "LBT-8005A Day Pack backpack", "Scav Backpack", "Flyye MBSS Backpack",
                "Sanitar bag", "Duffle bag", "LK 3F Transfer tourist backpack", "Transformer Bag", "VKBO army bag",
                "Tactical sling bag"]
    armour = ["temp"]
    head = ["temp"]
    tacRig = ["temp"]

    gear.append(random.choice(backpacks))
    gear.append(random.choice(grenades))
    gear.append(random.choice(armour))
    gear.append(random.choice(medical))
    gear.append(random.choice(head))
    gear.append(random.choice(stims))
    gear.append(random.choice(tacRig))
    return gear


def generate_gameOption():
    options = []
    communication = ["No", "Yes", "Yes", "Yes", "Yes"]
    maps = ["Customs", "Factory", "Interchange", "Woods", "The Lab", "Reserve", "Shoreline"]
    time = ["Night", "Day", "Day", "Day", "Day", "Day", "Day", "Day", "Day", "Day"]
    options.append(random.choice(communication))
    options.append(random.choice(maps))
    options.append(random.choice(time))
    return options