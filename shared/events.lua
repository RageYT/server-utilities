--======================================================================
-- This is a basic notification setup, only meant to send a message and
-- show a dialog box above the minimap.
--======================================================================
RegisterNetEvent('server-utilities:Notify_Standard')
AddEventHandler('server-utilities:Notify_Standard', function(notification_message)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringWebsite(notification_message)
    DrawNotification(false, true)
end)

--=========================================================================================================================================
-- Code provided by Titch2000 via FiveM Forums, thanks Titch2000 (https://forum.fivem.net/t/help-lua-icon-notifications-in-fivem/138085/5)
--=========================================================================================================================================
-- This is an advanced notification setup, made as a template to work with any style.
-- Possible future feature may be added with this to include more functionality.
--====================================================================================
RegisterNetEvent('server-utilities:Notify_Advanced')
AddEventHandler('server-utilities:Notify_Advanced', function(icon, type, sender, title, text)
    Citizen.CreateThread(function()
        Wait(1)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        SetNotificationMessage(icon, icon, true, type, sender, title, text)
        DrawNotification(false, true)
        Citizen.Wait(60000)
    end)
end)

--======================================================================
-- This will give a weapon specified from the user with the list of
-- weapons in the configuration file.
--======================================================================
RegisterNetEvent('server-utilities:giveWeapon')
AddEventHandler('server-utilities:giveWeapon', function(weaponName)
    local player = GetPlayerPed(-1)
    local weapons = config.weapons
    local prefix = config.prefix

    -- If the weapon name provided by the player is in the config.weapons table, it will continue otherwise return an error
    if weapons[weaponName] then
        local weapon = weapons[weaponName]
        TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Weapon Delivery', _('weapon_dealer_weap_success'))
        GiveWeaponToPed(player, weapon, 0, false, true)
    else
        TriggerEvent('server-utilities:Notify_Advanced', 'CHAR_ARTHUR', 1, 'Annonymous', 'Weapon Delivery', _('weapon_dealer_weap_invalid'))
    end
end)

--======================================================================
-- Spawns a vehicle that the player specifies and places them into it.
--======================================================================
RegisterNetEvent("server-utilities:spawnVehicle")
AddEventHandler("server-utilities:spawnVehicle", function(vehicleModel)
    local model = GetHashKey(vehicleModel)
    local ped = GetPlayerPed(-1)
    local prefix = config.prefix

    -- If the model name provided by the player is valid it will continue; Checks if the model is valid in the first if
    if IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(0) end

        local spawnPosition = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, 0.0)
        local spawnHeading = GetEntityHeading(ped)
        local vehicle = CreateVehicle(model, spawnPosition.x, spawnPosition.y, spawnPosition.z, spawnHeading, true, false)

        if IsPedInAnyVehicle(ped, false) then
            local inVehicle = GetVehiclePedIsIn(ped, false)
            SetEntityAsMissionEntity(inVehicle, true, true)
            DeleteVehicle(inVehicle)
        end
        SetPedIntoVehicle(ped, vehicle, -1)
    end
end)
