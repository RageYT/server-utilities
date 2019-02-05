-- Server sided commands, provides ace support

RegisterCommand('weapon', function(source, args, raw)
    if args[1] == nil then return end
    TriggerClientEvent('server-utilities:giveWeapon', source, args[1])
end, true)

RegisterCommand('vehicle', function(source, args, raw)
    if args[1] == nil then return end
    TriggerClientEvent("server-utilities:spawnVehicle", source, args[1])
end, true)

RegisterCommand('ad', function(source, args, raw)
    local ad_type = args[1]
    
    if ad_type == nil or config.ads[ad_type] == nil then
        return TriggerClientEvent('chat:addMessage', source, {args = {'^1Error^7: Invalid  usage! Correct syntax is \"/ad  <type> <message>\".'}})
    end
    
    local ad_image, ad_name = table.unpack(config.ads[ad_type])
    --So, command args breaks when people enter characters such as #. So in order to get the full message entred by the user no matter what they put in, we'll have to
    --Get it from the raw command. But in order to do that, we have to cut the command part and type out.
    --+1 Index for /, +2 for the command name "ad", + 1 for the space that follows it, and + 1 for the space that follows after the ad_type
    local cut_index = 5 + ad_type:len()
    --Slice the raw command, starting from the cut index, and finising at the length of the string.
    local message = raw:sub(cut_index, raw:len())
    
    TriggerClientEvent('server-utilities:Notify_Advanced', -1, ad_image, 1, ad_name, 'Advertisement', message)
end)
