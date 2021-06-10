import os
import discord
from discord import colour
from dotenv import load_dotenv
from discord.ext import commands
import kit_generator as kg
import database

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

client = commands.Bot(command_prefix='!')

@client.command()
async def kit(ctx):
        await ctx.send("Game Options:")
        db = database.get_db()
        weapon = kg.generate_weapon(db)
        gear = kg.generate_gear(db)
        gameOptions = kg.generate_gameOption()
        for row in weapon:
                gun, stock, bufferTube, pistolGrip, sight, magazine, ammoType, muzzle, foreGrip, \
                tactical, handGuard, mount, bolt, barrel = row

        for row in gear:
                backpack, grenade, armour, medical, head, stimulator, tacRig  = row
        
        for row in gameOptions:
                comms, map, time  = row
      
        weaponEmbed = discord.Embed(title = "Weapon Kit", colour = 1752220)
        weaponEmbed.add_field(name='───────────', value=f'**Name: **`{gun}`', inline=False)

        weaponEmbed.add_field(name='\u200b', value=f'**Stock: **`{stock}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Pistol Grip: **`{pistolGrip}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Buffer Tube: **`{bufferTube}`', inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Magazine: **`{magazine}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Ammo Type: **`{ammoType}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Muzzle: **`{muzzle}`', inline=True)


        weaponEmbed.add_field(name='\u200b', value=f'**Sight: **`{sight}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Fore Grip: **`{foreGrip}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Tactical: **`{tactical}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Hand Guards: **`{handGuard}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Mount: **`{mount}`', inline=True)
        
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Bolt: **`{bolt}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Barrel: **`{barrel}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)




        otherEmbed = discord.Embed(title = "Gear", colour = 15158332)
        otherEmbed.add_field(name='───────────', value=f'**Backpack: **`{backpack}`', inline=True)
        otherEmbed.add_field(name='───────────', value=f'**Grenade: **`{grenade}`', inline=True)
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        otherEmbed.add_field(name='\u200b', value=f'**Armour: **`{armour}`', inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Medicals: **`{medical}`', inline=True)
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        otherEmbed.add_field(name='\u200b', value=f'**Head: **`{head}`', inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Stimulator: **`{stimulator}`', inline=True)
        
        
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Tactical Rig: **`{tacRig}`', inline=True)
       
        otherEmbed.add_field(name='\n\u200b', value="\n\u200b")


        optionsEmbed = discord.Embed(title = "Game Options", colour = 10181046)
        
        optionsEmbed.add_field(name='───────────', value=f'**Communication: **`{comms}`', inline=False)
        optionsEmbed.add_field(name='───────────', value=f'**Map: **`{map}`', inline=False)
        optionsEmbed.add_field(name='───────────', value=f'**Time: **`{time}`', inline=False)
        await ctx.send(embed=weaponEmbed)
        await ctx.send(embed=otherEmbed)
        await ctx.send(embed=optionsEmbed)


@client.command()
async def stat(ctx, * message):
        embedTitle = ""
        embedDesc = "Find all stats for this calibre in the attached image"
        embedUrl = ""
        embedFooter = "Statistics current as of 04/06/2021"
        

        if not message:
                await ctx.send("Ammo type required after command (!stat 7.62x25)")

        else:
                if message[0] == "4.6x30" or "4.6x30mm":
                        embedTitle = 'HK 4.6x30mm'
                        embedUrl = "https://i.ibb.co/Pr7Jffw/4-6x30.png"

                elif message[0] == "5.7x28" or "5.7x28mm" or "5.7": 
                        embedTitle = '5.7x28mm FN'
                        embedUrl = "https://i.ibb.co/C9cm3xT/5-7x28.png"

                elif message[0] == "5.45" or "545" or "5.45x39" or "5.45x39mm": 
                        embedTitle = '5.45x39mm'
                        embedUrl = "https://i.ibb.co/whVHPZS/5-45x39.png"
                        
                elif message[0] == "5.56" or "556" or "5.56x45" or "5.56x45mm":
                        embedTitle = '5.56x45mm NATO'
                        embedUrl = "https://i.ibb.co/MC0Xx3V/5-56x45.png"

                elif message[0] == "7.62x25" or "7.62x25mm":
                        embedTitle = '7.62x25 Tokarev'
                        embedUrl = "https://i.ibb.co/6b26XP8/7-62x25.png"

                elif message[0] == "7.62x39" or "7.62x39mm" or "7.62" or "762":
                        embedTitle = '7.62x39mm'
                        embedUrl = "https://i.ibb.co/Rb9pxph/7-62x39.png"

                elif message[0] == "7.62x51" or "7.62x51": 
                        embedTitle = '7.62x51mm NATO'
                        embedUrl = "https://i.ibb.co/NY6GSp4/7-62x51.png"
                       
                elif message[0] == "7.62x54" or "7.62x54mm" or "7.62x54mmr" or "mosin": 
                        embedTitle = '7.62x54mmR'
                        embedUrl = "https://i.ibb.co/WHQg90j/7-62x54.png"
                        
                elif message[0] == "9x18" or "9x18mm": 
                        embedTitle = '9x18mm'
                        embedUrl = "https://i.ibb.co/9NfFsM8/9x18.png"

                elif message[0] == "9x19" or "9x19mm" or "9mm":  
                        embedTitle = '9x19mm Parabellum'
                        embedUrl = "https://i.ibb.co/8Y1p50K/9x19.png"
                        
                elif message[0] == "9x21" or "9x21mm":  
                        embedTitle = '9x21mm Gyurza'
                        embedUrl = "https://i.ibb.co/tKqSmfH/9x21.png"
                        
                elif message[0] == "9x39" or "9x39mm":  
                        embedTitle = '9x39mm'
                        embedUrl = "https://i.ibb.co/4Zpn40t/9x39.png"

                elif message[0] == "12.7" or "12.7x55" or "12.7x55mm":   
                        embedTitle = '12.7x55mm STs-130'
                        embedUrl = "https://i.ibb.co/qCmndSd/12-7x55.png"
                        
                elif message[0] == "12g" or "12 guage" or "12x70" or "12x70mm":
                        embedTitle = '12 Gauge'
                        embedUrl = "https://i.ibb.co/4gkN5Zc/12g.png"
                        
                elif message[0] == "20g" or "20 guage" or "20x70" or "20x70mm":
                        embedTitle = '20 Gauge'
                        embedUrl = "https://i.ibb.co/NLQTqBq/20g.png"

                elif message[0] == "23x75" or "23x75mm":
                        embedTitle = '23x75mm'
                        embedUrl = "https://i.ibb.co/V2VbcYc/23x75.png"
                       
                elif message[0] == "40x46" or "40x46mm" or "gl" or "gl40" or "gl-40":
                        embedTitle = '40x46mm'
                        embedUrl = "https://i.ibb.co/RjwR7L4/40x46.png"
                        
                elif message[0] == ".45 acp" or "45" or "45 acp": 
                        embedTitle = '.45 ACP'
                        embedUrl = "https://i.ibb.co/8MNH10s/45-acp.png"
                        
                elif message[0] == ".300 blackout" or ".300" or "300" or "300 blackout": 
                        embedTitle = '.300 Blackout'
                        embedUrl = "https://i.ibb.co/SQVncpS/300-blackout.png"
                        
                elif message[0] == "338" or "388 lapua" or ".338" or ".338 lapua" or ".338 lapua magnum" or ".338 lapua magnum": 
                        embedTitle = '.338 Lapua Magnum'
                        embedUrl = "https://i.ibb.co/L06GYp6/338-lap.png"

                elif message[0] == ".336 tkm" or ".366" or "366":  
                        embedTitle = '.366 TKM'
                        embedUrl = "https://i.ibb.co/D8s91R5/366-tkm.png"

                embed = discord.Embed(
                        title = embedTitle,
                        description = embedDesc,
                        colour = discord.Colour.blue())
                embed.set_image(url=embedUrl)
                embed.set_footer(text=embedFooter)
                await ctx.send(embed=embed)

client.run(TOKEN)
