local atk_position = {
    {x = 367.96, y = -1036.27, z = 29.19, h = 88.23},
    {x = -250.38, y = -595.44, z = 34.30, h = 157.35}, 
    {x = -194.08, y = -524.24, z = 34.17, h = 335.73}, 
    {x = -214.58, y = -76.37, z = 50.44, h = 249.13}, 
    {x = 26.21, y = -130.90, z = 55.86, h = 69.84}, 
    {x = -224.33, y = -42.54, z = 49.64, h = 71.31}, 
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
        spawnedatk = CreateVehicle(vehicle, item.x, item.y, item.z, item.h, true, true)
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