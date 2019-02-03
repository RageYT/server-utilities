-- Basic Commands

RegisterCommand("cc", function() 
    clearChat()
end)

RegisterCommand("suicide", function()
    local player = GetPlayerPed(-1)

    RequestAnimDict('mp_suicide')
    while not HasAnimDictLoaded('mp_suicide') do Wait(0) end

    TaskPlayAnim(player, 'mp_suicide', 'pill', 8.0, 1.0, 5000, 0, 1, true, true, true)
    Wait(4600)
    SetEntityHealth(player, 0)
    Wait(4500)
    TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_PLANESITE', 1, 'Epsilon', 'Suicidal Prevention', _('epsilon_suicide_message'))
end)

RegisterCommand("ammo", function(source, args)
    local count = args[1]
    local player = GetPlayerPed(-1)
    local found,weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)

    if GetWeaponClipSize(weapon) > 0 then
        if count then
            AddAmmoToPed(player, weapon, tonumber(count))
            TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Ammo Delivery', _('weapon_dealer_ammo_success'))
        else
            TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Ammo Delivery', _('weapon_dealer_ammo_invalid'))
        end
    else
        TriggerEvent('server-utilities:Notify_Standard', _('weapon_dealer_ammo_nonweap'))
    end
end)

RegisterCommand("dv", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local player = GetPlayerPed(-1)

    if IsPedSittingInAnyVehicle(player) then
        SetEntityAsMissionEntity(curVehicle, true, true)
        DeleteEntity(vehicle)
        TriggerEvent('server-utilities:Notify_Standard', _('delete_vehicle_success'))
    else
        TriggerEvent('server-utilities:Notify_Standard', _('delete_vehicle_error'))
    end
end)
