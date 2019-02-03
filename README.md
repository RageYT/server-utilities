# Server Utilities - A Set of Server Tools
Hello all once again, after releasing my **Simple Announcements** resource, I thought I'd might as well share my other resource, Server Utilities. It consists of some basic and simple scripts for you're server that allow you to get easier access to things you wouldn't be able to without a trainer or such. This is my second script/resource and many more to come, so I greatly appreciate all the support and criticisms from you which helps me make my resources better.

Currently, the resource only has commands but I do hope to include more such as NoClip and some other fun stuff.

There isn't any need for pictures, so I won't provide them as the list of commands below explains what they do.

## Current Features/Commands
- /cc - Clears all of chat and removing any commands left in the history
- /weapon [weapon_hash] - Provides the player with a weapon
- /ammo - Alongside the **/weapon** command, this provides ammo for the current weapon in hand
- /suicide - Self explanatory but kills yourself and respawns you
- /vehicle [vehicle model] - Spawns a vehicle with the specified model
- /dv - Deletes the vehicle the player is in.

## Possible Features/Commands
- /tp [player ID] - A teleport command to teleport you to a player anywhere in the world
- /tpme [player ID] - Teleports a specified player to you're current location
- /tpcoords [x, y, z] - Will teleport you to the specified coordinates
- /kill [player ID] - Kills a specified player that is alive
- /freeze [player ID] - Stops the specified player from moving and doing any other actions
- NoClip - Allowing the player to fly around the world without any collision to objects
- Admin Chat Only - Only groups or admins with an ace can type in chat
- Menu Based - Commands and Features possibly in a menu?

If you have anymore ideas, please do share them or if you even want to contribute go ahead and make a pull request. You're idea doesn't have to be command based, it can be something unrelated to command but rather a feature like NoClip.

## Easy Installation Guide
Installing is as simple as downloading and throwing into your resource folder, but some may not find it easy.

1. Download the latest release via [GitHub](https://github.com/RageYT/server-utilities/releases/latest)
2. Locate you're resources folder
3. Put the provided folder in the archive into you're resources folder (Don't forget to remove the **-master** at the end of the folder name)
4. Add the line below into you're **server.cfg** file

> start server-utilites

https://github.com/RageYT/server-utilities

If you would like to restrict the commands to only certain groups such as admin or superadmin, add the following into you're **server.cfg** file.

Make sure to fill out **GroupName** and **CommandName** with the group you want and the command name from above correctly, otherwise it won't work.

> add_ace group.GroupName command.CommandName allow

**Example**
> add_ace group.superadmin command.cc allow
