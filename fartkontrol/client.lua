local atk_position = {
    {x = 367.96, y = -1036.27, z = 29.19, h = 88.23}, -- PD kryds 1
    {x = 373.59, y = -1066.74, z = 29.47, h = 266.17}, -- PD kryds 2

    {x = -250.38, y = -595.44, z = 34.30, h = 157.35}, 

    {x = 416.19, y = -580.15, z = 28.73, h = 319.52}, -- Hospital Udadgående
    {x = 396.36, y = -568.53, z = 28.68, h = 142.29}, -- Hospital Indadgående

    {x = 1859.38, y = 3594.53, z = 34.63, h = 291.14}, -- Sandy 1
    {x = 1838.89, y = 3599.56, z = 34.84, h = 116.10}, -- Sandy 2

    {x = 78.93, y = -1102.99, z = 29.29, h = 336.13}, -- Lyskryds ved Ud&Fix Mod midtby
    {x = 48.22, y = -1184.89, z = 29.32, h = 179.83}, -- Lyskryds ved Ud&Fix væk fra midtby
    
    {x = -1266.18, y = -488.43, z = 33.32, h = 315.27}, -- Bahama Mamas 1
    {x = -1310.27, y = -473.91, z = 33.57, h = 28.00}, -- Bahama Mamas 2
    {x = -1330.92, y = -513.23, z = 32.68, h = 122.50}, -- Bahama Mamas 3
    {x = -1288.45, y = -542.40, z = 31.54, h = 217.79}, -- Bahama Mamas 4

    {x = 148.02, y = -794.88, z = 31.01, h = 70.19}, -- Centrum 1
    {x = 145.15, y = -852.30, z = 30.68, h = 161.18}, -- Centrum 2
    {x = 203.51, y = -845.82, z = 30.54, h = 249.17}, -- Centrum 3
    {x = 199.67, y = -784.25, z = 31.92, h = 337.49}, -- Centrum 4

    {x = -90.64, y = 6302.19, z = 31.34, h = 132.86}, -- Druglab Nord 1
    {x = -99.50, y = 6261.86, z = 31.42, h = 308.06}, -- Druglab Nord 2
}

local vehicle = GetHashKey("atk")

Citizen.CreateThread(function()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(1)
    end

    for _, item in pairs(atk_position) do
        -- spawnedatk = CreateObject(vehicle, item.x, item.y, item.z, true, true, true)
        -- PlaceObjectOnGroundProperly(spawnedatk)
        -- SetEntityHeading(spawnedatk, item.h)
        -- FreezeEntityPosition(spawnedatk, true)
        -- SetEntityInvincible(spawnedatk, true)
        spawnedatk = CreateVehicle(vehicle, item.x, item.y, item.z, item.h, false, true)
        SetVehicleOnGroundProperly(spawnedatk)
        --SetEntityHeading(spawnedatk, item.h)
        SetVehicleDoorsLocked(spawnedatk, 2)
        SetVehicleUndriveable(spawnedatk, true)
        --FreezeEntityPosition(spawnedatk, true)
        SetEntityAsMissionEntity(spawnedatk, true, true)
    end
end)

function SpawnCar(x, y, z, h)
        Citizen.Wait(0)
        local vehicle = GetHashKey("atk")
        RequestModel(vehicle)
        while not HasModelLoaded(vehicle) do
            Wait(1)
        end

        local spawned_car = CreateVehicle(vehicle, x, y, z, h, false, true)
        SetVehicleOnGroundProperly(spawned_car)
        Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
        SetVehicleDoorsLocked(spawned_car, 2)
        SetVehicleUndriveable(spawned_car, true)
        FreezeEntityPosition(spawned_car, true)
        SetEntityInvincible(spawned_car, true)
        SetModelAsNoLongerNeeded(vehicle)
end