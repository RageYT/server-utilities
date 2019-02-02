# Server Utilites | A Basic Set of Commands
Server Utilities is a simplified resource that offers administrator rights and basic player commands. While offering not many commands, I hope to expand it as time moves on.

## Current Features
- /cc - Clears all of chat and removing any commands left in the history
- /weapon {weapon_has} - Provides the player with a weapon
- /ammo - Alongside the **/weapon** command, this provides ammo for the current weapon in hand
- /suicide - Self explanatory but kills yourself and respawns you
- /vehicle {vehicle model} - Spawns a vehicle with the specified model
- /dv - Deletes the vehicle the player is closest to or deletes it if the player is in a vehicle

## Possible Features
- /tp {player ID} - A teleport command to teleport you to a player anywhere in the world
- /tpme {player ID} - Teleports a specified player to you're current location
- /tpcoords {x, y, z} - Will teleport you to the specified coordinates
- /kill {player ID} - Kills a specified player that is alive
- /freeze {player ID} - Stops the specified player from moving and doing any other actions

If you have anymore ideas, please do share them or if you even want to contribute go ahead and make a pull request.

## Easy Installation Guide
Installing is as simple as downloading and throwing into your resource folder, but some may not find it easy.

1. Download the latest release via [GitHub]()
2. Locate you're resources folder
3. Put the provided folder in the archive into you're resources folder (Don't forget to remove the **-master** at the end of the folder name)
4. Add the line below into you're **server.cfg** file

> start server-utilites
