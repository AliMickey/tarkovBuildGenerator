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
        weapon = ["AK", "Fab Defence", "Red Dot", "60 Round", "Gral", "Charging Handle", '10.6" Barrel']
        head = kg.generate_head(db)
        armour = kg.generate_armour(db)
        ammoType = kg.generate_ammo_type(db)
        tacRig = kg.generate_tac_rig(db)
        grenade = kg.generate_grenades()
        backpack = kg.generate_backpack()
        medicals = kg.generate_medical()
        gameOptions = kg.generate_gameOption()
        stim = kg.generate_stim()
        
      
        weaponEmbed = discord.Embed(title = "Weapon Kit", colour = 1752220)
        weaponEmbed.add_field(name='───────────', value=f'**Name: **`{weapon[0]}`', inline=False)

        weaponEmbed.add_field(name='\u200b', value=f'**Stock: **`{weapon[1]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Sight: **`{weapon[2]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Magazine: **`{weapon[3]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Pistol Grip: **`{weapon[4]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Bolt: **`{weapon[5]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value=f'**Barrel: **`{weapon[6]}`', inline=True)
        weaponEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        weaponEmbed.add_field(name='\u200b', value=f'**Ammo Type: **`{ammoType}`', inline=True)


        otherEmbed = discord.Embed(title = "Gear", colour = 15158332)
        otherEmbed.add_field(name='───────────', value=f'**Backpack: **`{backpack}`', inline=True)
        otherEmbed.add_field(name='───────────', value=f'**Grenade: **`{grenade}`', inline=True)
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        otherEmbed.add_field(name='\u200b', value=f'**Armour: **`{armour}`', inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Medicals: **`{medicals}`', inline=True)
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)

        otherEmbed.add_field(name='\u200b', value=f'**Head: **`{head}`', inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Stimulator: **`{stim}`', inline=True)
        
        
        otherEmbed.add_field(name='\u200b', value="\u200b", inline=True)
        otherEmbed.add_field(name='\u200b', value=f'**Tactical Rig: **`{tacRig}`', inline=True)
       
        otherEmbed.add_field(name='\n\u200b', value="\n\u200b")


        optionsEmbed = discord.Embed(title = "Game Options", colour = 10181046)
        
        optionsEmbed.add_field(name='───────────', value=f'**Communication: **`{gameOptions[0]}`', inline=False)
        optionsEmbed.add_field(name='───────────', value=f'**Map: **`{gameOptions[1]}`', inline=False)
        optionsEmbed.add_field(name='───────────', value=f'**Time: **`{gameOptions[2]}`', inline=False)
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
                        embedTitle ='HK 4.6x30mm'
                        embedUrl = "https://i.ibb.co/Pr7Jffw/4-6x30.png"


                elif message[0] == "5.7x28" or "5.7x28mm" or "5.7": 
                        embedTitle ='5.7x28mm FN'
                        embedUrl = "https://i.ibb.co/C9cm3xT/5-7x28.png"
                     

                elif message[0] == "5.45" or "545" or "5.45x39" or "5.45x39mm": 
                        embed = discord.Embed(
                                title='5.45x39mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/whVHPZS/5-45x39.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "5.56" or "556" or "5.56x45" or "5.56x45mm":
                        embed = discord.Embed(
                                title='5.56x45mm NATO',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/MC0Xx3V/5-56x45.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "7.62x25":  
                        embed = discord.Embed(
                                title='7.62x25 Tokarev',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/6b26XP8/7-62x25.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "7.62x25" or "7.62x25mm":
                        embed = discord.Embed(
                                title='7.62x25 Tokarev',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/6b26XP8/7-62x25.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "7.62x39" or "7.62x39mm" or "7.62" or "762":  
                        embed = discord.Embed(
                                title='7.62x39mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/Rb9pxph/7-62x39.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "7.62x51" or "7.62x51":     
                        embed = discord.Embed(
                                title='7.62x51mm NATO',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/NY6GSp4/7-62x51.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "7.62x54" or "7.62x54mm" or "7.62x54mmr" or "mosin": 
                        embed = discord.Embed(
                                title='7.62x54mmR',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/WHQg90j/7-62x54.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)    

                elif message[0] == "9x18" or "9x18mm":    
                        embed = discord.Embed(
                                title='9x18mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/9NfFsM8/9x18.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "9x19" or "9x19mm" or "9mm":  
                        embed = discord.Embed(
                                title='9x19mm Parabellum',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/8Y1p50K/9x19.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "9x21" or "9x21mm":  
                        embed = discord.Embed(
                                title='9x21mm Gyurza',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/tKqSmfH/9x21.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "9x39" or "9x39mm":  
                        embed = discord.Embed(
                                title='9x39mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/4Zpn40t/9x39.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "12.7" or "12.7x55" or "12.7x55mm":   
                        embed = discord.Embed(
                                title='12.7x55mm STs-130',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/qCmndSd/12-7x55.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "12g" or "12 guage" or "12x70" or "12x70mm":
                        embed = discord.Embed(
                                title='12 Gauge',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/4gkN5Zc/12g.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "20g" or "20 guage" or "20x70" or "20x70mm":
                        embed = discord.Embed(
                                title='20 Gauge',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/NLQTqBq/20g.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "23x75" or "23x75mm":
                        embed = discord.Embed(
                                title='23x75mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/V2VbcYc/23x75.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "40x46" or "40x46mm" or "gl" or "gl40" or "gl-40":
                        embed = discord.Embed(
                                title='40x46mm',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/RjwR7L4/40x46.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == ".45 acp" or "45" or "45 acp": 
                        embed = discord.Embed(
                                title='.45 ACP',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/8MNH10s/45-acp.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)      

                elif message[0] == ".300 blackout" or ".300" or "300" or "300 blackout": 
                        embed = discord.Embed(
                                title='.300 Blackout',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/SQVncpS/300-blackout.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == "338" or "388 lapua" or ".338" or ".338 lapua" or ".338 lapua magnum" or ".338 lapua magnum":  
                        embed = discord.Embed(
                                title='.338 Lapua Magnum',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/L06GYp6/338-lap.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)

                elif message[0] == ".336 tkm" or ".366" or "366":  
                        embed = discord.Embed(
                                title='.366 TKM',
                                description=embedDesc,
                                colour=discord.Colour.blue())
                        embed.set_image(url="https://i.ibb.co/D8s91R5/366-tkm.png")
                        embed.set_footer(text=embedFooter)
                        await ctx.send(embed=embed)
                        embedTitle = '.366 TKM'
                        description=embedDesc
                        embedImage = "https://i.ibb.co/D8s91R5/366-tkm.png"

                embed = discord.Embed(
                        title = embedTitle,
                        description = embedDesc,
                        colour = discord.Colour.blue())
                embed.set_image(url=embedUrl)
                embed.set_footer(text=embedFooter)
                await ctx.send(embed=embed)

client.run(TOKEN)
