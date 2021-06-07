import os
import discord
from discord import colour
from dotenv import load_dotenv
from discord.ext import commands
import kit_generator as kg

load_dotenv()
TOKEN = os.getenv('DISCORD_TOKEN')

client = commands.Bot(command_prefix='!')

@client.command()
async def kit(ctx):
        await ctx.send("Game Options:")
        grenade = kg.generate_grenades()
        gameOptions = kg.generate_gameOption()
        medicals = kg.generate_medical()
        backpack = kg.generate_backpack()
        armour = "Temp"
        head = "Temp"
        stim = kg.generate_stim()
        tacRig = "Temp"
        weapon = ["AK", "Fab Defence", "Red Dot", "60 Round", "Gral", "Charging Handle", '10.6" Barrel']

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

        otherEmbed = discord.Embed(title = "Gear", colour = 15158332)
        otherEmbed.add_field(name='Other', value=f'**Backpack: **`{backpack}`', inline=True)
        otherEmbed.add_field(name='Consumables', value=f'**Grenade: **`{grenade}`', inline=True)
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

client.run(TOKEN)