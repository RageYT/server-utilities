local prefix = config.prefix

-- Server sided command, provides ace support
RegisterCommand('weapon', function(source, args, raw)
    if args[1] == nil then return end
    TriggerClientEvent('server-utilities:giveWeapon', source, args[1])
end, true)

-- Server sided command, provides ace support
RegisterCommand("vehicle", function(source, args, raw)
    if args[1] == nil then return end
    TriggerClientEvent("server-utilities:spawnVehicle", source, args[1])
end, true)
