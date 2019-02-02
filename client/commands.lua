local server = config.prefix

-- Basic Commands

RegisterCommand("cc", function() 
    cc()
end)

RegisterCommand("suicide", function()
    local player = GetPlayerPed(-1)

    SetEntityHealth(player, 0)
end)

RegisterCommand("weapon", function(source, args)
    local weapon = args[1]
    local player = GetPlayerPed(-1)

    if args[1] then
        if IsWeaponValid(weapon) then
            TriggerEvent('chat:addMessage', {
                args = { server .. 'The weapon ^3' .. weapon .. ' ^7has been given to you.'}})
            GiveWeaponToPed(player, weapon, 0, false, true)
        else
            TriggerEvent('chat:addMessage', {
                args = { server .. "This is not a valid weapon hash."}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            args = { server .. ' ^7You have been given the default weapon.'}})
        GiveWeaponToPed(player, 'weapon_knife', 0, false, true)
    end
end)

RegisterCommand("ammo", function(source, args)
    local count = args[1]
    local player = GetPlayerPed(-1)
    local found,weapon = GetCurrentPedWeapon(GetPlayerPed(-1), true)

    if GetWeaponClipSize(weapon) > 0 then
        if args[1] then
            AddAmmoToPed(player, weapon, tonumber(count))
            TriggerEvent('chat:addMessage', {
                args = { server .. 'You have been given ^3' .. count .. ' ^7ammo for your current weapon.'}
            })
        else
            TriggerEvent('chat:addMessage', {
                args = { server .. 'Please enter a valid amount.'}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            args = { server .. 'This weapon does not require ammo.'}})
    end
end)

RegisterCommand("vehicle", function(source, args)
    local player = GetPlayerPed(-1)
    local vehicle = args[1]
    local coords = GetEntityCoords(player, true)

    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do Citizen.Wait(0) end

    local heading = GetEntityHeading(player)
    local spawnedVeh = CreateVehicle(vehicle, coords, heading, false, false)
    if args[1] then
        if IsPedSittingInAnyVehicle(player) then
            local curVehicle = GetVehiclePedIsIn(player, false)
            DeleteEntity(curVehicle)
            SetPedIntoVehicle(player, spawnedVeh, -1)
            SetModelAsNoLongerNeeded(vehicle)
        else
            SetPedIntoVehicle(player, spawnedVeh, -1)
            SetModelAsNoLongerNeeded(vehicle)
        end
    end
end)

RegisterCommand("dv", function()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    --local coords = GetEntityCoords(GetPlayerPed(-1), true)
    local player = GetPlayerPed(-1)

    if IsPedSittingInAnyVehicle(player) then
        DeleteEntity(vehicle)
    else
        --ClearAreaOfVehicles(coords, 100.0, false, false, false, false, false)
        TriggerEvent('chat:addMessage', {
            args = { server .. " You must be in a vehicle to do this." }
        })
    end
end)
