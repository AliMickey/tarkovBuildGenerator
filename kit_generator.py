import random

def generate_weapon(db):
    weapon = []
    # gun = random.choice(db.execute('''
    #                     SELECT id, gun_name
    #                     FROM guns
    #                     ''').fetchall())
    gun = [1, "AK-TEST"]
    weapon.append(gun[1])

    stockList = (db.execute('''
                SELECT s.stock_name, buffer_tube_required, pistol_grip_required
                FROM stocks s JOIN stock_compatibility sc ON sc.stock_id = s.id 
                JOIN guns g ON sc.gun_id = g.id
                WHERE sc.gun_id = ?
                ''', [gun[0]]).fetchall())

    if stockList:
        stock = random.choice(stockList)
        stockName = stock[0]
        if (stock[1] == True):
            stockName += " | Buffer Tube: Temp"
        if (stock[2] == True):
            stockName += " | Pistol Grip: Temp"
        weapon.append(stockName)
    else:
        weapon.append("No Compatible Stock")


    sightList = db.execute('''
                SELECT s.sight_name
                FROM sights s JOIN sight_compatibility sc ON sc.sight_id = s.id 
                JOIN guns g ON sc.gun_id = g.id
                WHERE sc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if sightList:
        weapon.append(random.choice(sightList))
    else:
        weapon.append("No Compatible Sight")


    magazineList = db.execute('''
                SELECT m.magazine_name
                FROM magazines m JOIN magazine_compatibility mc ON mc.magazine_id = m.id 
                JOIN guns g ON mc.gun_id = g.id
                WHERE mc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if magazineList:
        weapon.append(random.choice(magazineList))
    else:
        weapon.append("No Compatible Magazine")


    weapon.append("Temp pistol grip")


    boltList = db.execute('''
                SELECT b.bolt_name
                FROM bolts b JOIN bolt_compatibility bc ON bc.bolt_id = b.id 
                JOIN guns g ON bc.gun_id = g.id
                WHERE bc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if boltList:
        weapon.append(random.choice(boltList))
    else:
        weapon.append("No Compatible Bolt")


    barrelList = db.execute('''
                SELECT b.barrel_name
                FROM barrels b JOIN barrel_compatibility bc ON bc.barrel_id = b.id 
                JOIN guns g ON bc.gun_id = g.id
                WHERE bc.gun_id = ?
                ''', [gun[0]]).fetchall()
    if barrelList:
        weapon.append(random.choice(barrelList))
    else:
        weapon.append("No Compatible Barrel")


    ammoTypeList = db.execute('''
                    SELECT a.ammo_name
                    FROM ammo_types a JOIN ammo_type_compatibility ac ON ac.ammo_id = a.id 
                    JOIN guns g ON ac.gun_id = g.id
                    WHERE ac.gun_id = ?
                    ''', [gun[0]]).fetchall()
    if ammoTypeList:
        weapon.append(random.choice(ammoTypeList))
    else:
        weapon.append("No Compatible Ammo Type")
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