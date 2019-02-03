local prefix = config.prefix

-- Basic Commands

RegisterCommand("cc", function() 
    clearChat()
end)

RegisterCommand("suicide", function()
    local player = GetPlayerPed(-1)

    SetEntityHealth(player, 0)
    Citizen.Wait(4500)
    TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_PLANESITE', 1, 'Epsilon', 'Suicidal Prevention', 'Kifflom, it seems as if you tried to take your own life. No worries we are here to help.')
end)

RegisterCommand("ammo", function(source, args)
    local count = args[1]
    local player = GetPlayerPed(-1)
    local found,weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)

    if GetWeaponClipSize(weapon) > 0 then
        if count then
            AddAmmoToPed(player, weapon, tonumber(count))
            TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Ammo Delivery', 'Need some ammo? Here I have a cache of ammo, have some.')
        else
            TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Ammo Delivery', 'I need an amount, how much do you want damnit?')
        end
    else
        TriggerEvent('server-utilities:Notify_Standard', 'This weapon does not need ammo.')
    end
end)

RegisterCommand("dv", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local player = GetPlayerPed(-1)

    if IsPedSittingInAnyVehicle(player) then
        SetEntityAsMissionEntity(curVehicle, true, true)
        DeleteEntity(vehicle)
        TriggerEvent('server-utilities:Notify_Standard', 'The vehicle has been successfully deleted.')
    else
        TriggerEvent('server-utilities:Notify_Standard', 'You must be in a vehicle to do this.')
    end
end)
