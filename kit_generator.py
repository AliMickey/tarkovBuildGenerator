import random
def generate_weapon():
    weapon = []
    return weapon

def generate_head():
    head = []
    return head

def generate_grenades():
    grenades = ["None", "F-1 Hand", "RGD-5 Hand", "VOG-17 Khattabka", "VOG-25 Khattabka", "M67 Hand", "RDG-2B Smoke",
                "Zarya Stun"]
    return random.choice(grenades)

def generate_armour():
    armour = []
    return armour

def generate_backpack(): #Fix capitals
    backpacks =  ["6SH118 Raid Backpack", "LBT-2670 Slim Field Med Pack", "Mystery Ranch Blackjack 50 backpack (multicam)",
                "Eberlestock F4 Terminator load bearing backpack (tiger stripe)", "SSO 'Attack 2' raid backpack",
                "Pilgrim tourist backpack", "3V G Paratus 3-Day Operator's Tactical Backpack",
                "Eberlestock G2 Gunslinger II backpack (dry earth)", "Oakley Mechanism heavy duty backpack (black)",
                "Camelbak Tri-Zip Backpack", "Ana tactical Beta 2 battle backpack",
                "Eberlestock F5 Switchblade backpack (dry earth)", "Hazard4 Takedown sling backpack",
                "Wartech Berkut VV-102 backpack", "LBT-8005A Day Pack backpack", "Scav Backpack", "Flyye MBSS Backpack",
                "Sanitar bag", "Duffle bag", "LK 3F Transfer tourist backpack", "Transformer Bag", "VKBO army bag",
                "Tactical sling bag"]
    return random.choice(backpacks)

def generate_medical():
    medical = ["None", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes", "Yes"]
    return random.choice(medical)

def generate_gameOption():
    options = []
    communication = ["No", "Yes", "Yes", "Yes", "Yes"]
    maps = ["Customs", "Factory", "Interchange", "Woods", "The Lab", "Reserve", "Shoreline"]
    time = ["Night", "Day", "Day", "Day", "Day", "Day", "Day", "Day", "Day", "Day"]
    options.append(random.choice(communication))
    options.append(random.choice(maps))
    options.append(random.choice(time))
    return options

def generate_stim():
    stims = ["Combat stimulant injector SJ1 TGLabs", "Combat stimulant injector SJ9 TGLabs",
            "Combat stimulant injector SJ6 TGLabs", "Propital", "Hemostatic drug Zagustin", "Adrenaline injector",
            "Meldonin", "AHF1-M", "3-(b-TG)", "L1 (Norepinephrine)", "P22", "Cocktail 'Obdolbos'",
            "M.U.L.E. stimulator",
            "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
    return random.choice(stims)

