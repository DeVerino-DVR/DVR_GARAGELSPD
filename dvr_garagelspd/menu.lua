----------------- V2 DVR  MERCI MRV--------------------
---- Liste des vehicules pour la lspd (pas le job) ----
-------------------------------------------------------

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("~w~LSPD","~w~Garage de la ~b~LSPD")
_menuPool:Add(mainMenu)

ESX = nil
local PlayerData = {}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


AddCarMenu = function(menu)
    local carsubmenu = _menuPool:AddSubMenu(menu,"~b~Vehicules","~w~Liste des vehicules")

    for _, vehicles in pairs(Config.Vehicles) do
        local vehicleItem = NativeUI.CreateItem(vehicles.Label, "")
        carsubmenu.SubMenu:AddItem(vehicleItem)

        carsubmenu.SubMenu.OnItemSelect = function(_, _, index)
            spawnCar(Config.Vehicles[index].Hash)
            notify("~r~vous avez sorti un véhicule")
        end
    end
end
            
        
AddCarMenu(mainMenu)
_menuPool:RefreshIndex()


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end



Citizen.CreateThread(function()
    local playerPed = PlayerPedId()
    while true do
        Wait(0)
        _menuPool:ProcessMenus()
        _menuPool:MouseEdgeEnabled (false);

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            if IsEntityAtCoord(PlayerPedId(), 459.21, -1008.07, 28.26, 1.5, 1.5, 1.5, 0, 1, 0) then 

                    if PlayerData.job ~= nil and PlayerData.job.name == 'police' then    
                        ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au Garage~s~")
                        if IsControlJustPressed(1,51) then
                            mainMenu:Visible(not mainMenu:Visible())
                        end
                    end
                end    
            end
        end)



spawnCar = function(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(car, 452.84, -1019.61, 28.24, 90.89, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleNumberPlateText(vehicle, "LSPD911")
end

print("DVR Garage LSPD fais avec amour merci a mrv")
------ enjoy ;)






