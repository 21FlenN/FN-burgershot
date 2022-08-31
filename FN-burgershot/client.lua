local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = true
PlayerJob = {}
local onDuty = false
local ocupied = false
local done = false
local bike = false
local veh = QBCore.Functions.GetClosestVehicle()
local nome = ''
local items = ''
local deliverydoor =  math.random(1, config.quantportas)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "burgershot" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function()
    Blip = AddBlipForCoord(config.coordsblip)
    SetBlipSprite (Blip, 106)
    SetBlipDisplay(Blip, 4)
    SetBlipScale  (Blip, 0.5)
    SetBlipAsShortRange(Blip, true)
    SetBlipColour(Blip, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BurgerShot")
    EndTextCommandSetBlipName(Blip)
end) 

RegisterNetEvent("FN-burgershot:entrar_servico")
AddEventHandler("FN-burgershot:entrar_servico", function()
    if onDuty ~= true then
        QBCore.Functions.Progressbar('entrar_servico', Lang.Enteringservice, 1500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            onDuty = not onDuty
            TriggerServerEvent("QBCore:ToggleDuty")
        end, function ()
        end)
    else
        QBCore.Functions.Progressbar('sair_serviço', Lang.Leavingservice, 1500, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            onDuty = not onDuty
            TriggerServerEvent("QBCore:ToggleDuty")
        end, function ()
        end)
    end
end)

RegisterNetEvent("FN-burgershot:tabuleiro1")
AddEventHandler("FN-burgershot:tabuleiro1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro1", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:tabuleiro2")
AddEventHandler("FN-burgershot:tabuleiro2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro2", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:tabuleiro3")
AddEventHandler("FN-burgershot:tabuleiro3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "Tabuleiro3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Tabuleiro3", {
        maxweight = 20000,
        slots = 6,
    })
end)

RegisterNetEvent("FN-burgershot:congelador")
AddEventHandler("FN-burgershot:congelador", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Congelador")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Congelador", {
        maxweight = 100000,
        slots = 10,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico1")
AddEventHandler("FN-burgershot:Frigorifico1", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico1")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico1", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico2")
AddEventHandler("FN-burgershot:Frigorifico2", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico2")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico2", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:Frigorifico3")
AddEventHandler("FN-burgershot:Frigorifico3", function()
    if onDuty == true then
        TriggerEvent("inventory:client:SetCurrentStash", "Frigorifico3")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Frigorifico3", {
        maxweight = 150000,
        slots = 20,
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end    
    end
end)

RegisterNetEvent("FN-burgershot:MoneyShot")
AddEventHandler("FN-burgershot:MoneyShot", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrmoneyshot', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
				QBCore.Functions.Progressbar("fazer_moneyshot", Lang.Makemoneyshot, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
					TriggerServerEvent('FN-burgershot:server:moneyshot')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:Torpedo")
AddEventHandler("FN-burgershot:Torpedo", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrtorpedo', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
				QBCore.Functions.Progressbar("fazer_Torpedo", Lang.Maketorpedo, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:torpedo')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:heartstopper")
AddEventHandler("FN-burgershot:heartstopper", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrheartstopper', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
				QBCore.Functions.Progressbar("fazer_heartstopper", Lang.Makeheartstopper, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:heartstopper')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end	
    end
end)

RegisterNetEvent("FN-burgershot:bleeder")
AddEventHandler("FN-burgershot:bleeder", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbleeder', function(HasItems)
    		if HasItems then
				Working = true
				TriggerEvent('inventory:client:busy:status', true)
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
				QBCore.Functions.Progressbar("fazer_bleeder", Lang.Makebleeder, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:bleeder')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:fazerbatatas")
AddEventHandler("FN-burgershot:fazerbatatas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_batatas", Lang.Makefries, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:batatas_fritas')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end	
    end
end)

RegisterNetEvent("FN-burgershot:fazer_hamburgers")
AddEventHandler("FN-burgershot:fazer_hamburgers", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrcarne', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"bbq"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_hamburger", Lang.Makehamburgers, 5000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    TriggerServerEvent('FN-burgershot:server:carne_feita')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.dontingr, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.dontingr)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:cortar_tomates")
AddEventHandler("FN-burgershot:cortar_tomates", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrtomate', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"cozinheiro"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("Cortar_tomates", Lang.CuttingTomatoes, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:tomate_cortado')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavetomatos, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavetomatos)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)


RegisterNetEvent("FN-burgershot:cortar_batatas")
AddEventHandler("FN-burgershot:cortar_batatas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata_cortar', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"cozinheiro"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("Cortar_batata", Lang.CuttingPotatoes, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:batata_cortada')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavepotatoes, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavepotatoes)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:lavar_merdas")
AddEventHandler("FN-burgershot:lavar_merdas", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:ingrbatata_lavar', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"petting"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("lavar_batatas", Lang.WashingPotatoes, 4000, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:batata_suja')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.potatoestowash, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.potatoestowash)
                end
			end
		end)
	else
        if config.notify == 'qbcore' then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == 'mythic' then
             exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tamanhobebidas")
AddEventHandler("FN-burgershot:tamanhobebidas", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "• Grande",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:menubebidasgrande",
                }
            },
            {
                header = "• Pequeno",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:menubebidaspequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:menubebidasgrande")
AddEventHandler("FN-burgershot:menubebidasgrande", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "Make drinks",
                isMenuHeader = true,
            },
            {
                header = "• Coca cola",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:fazer_colagrande",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:menubebidaspequeno")
AddEventHandler("FN-burgershot:menubebidaspequeno", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "Make drinks",
                isMenuHeader = true,
            },
            {
                header = "• Coca cola",
                txt = "You need a cup",
                params = {
                    event ="FN-burgershot:fazer_colapequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)


RegisterNetEvent("FN-burgershot:fazer_colagrande")
AddEventHandler("FN-burgershot:fazer_colagrande", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:copobebida', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_cola", Lang.Makelargecocacola, 3500, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:colagrande')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavecup, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavecup)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:fazer_colapequeno")
AddEventHandler("FN-burgershot:fazer_colapequeno", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('FN-burgershot:server:get:copobebidapequeno', function(HasItems)
    		if HasItems then
				Working = true
                TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
				TriggerEvent('inventory:client:busy:status', true)
				QBCore.Functions.Progressbar("fazer_cola", Lang.Makesmallcocacola, 3500, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = false,
				}, {
				}, {}, {}, function()
					Working = false
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
					TriggerEvent('inventory:client:busy:status', false)
                    TriggerServerEvent('FN-burgershot:server:colapequena')
				end, function()
					TriggerEvent('inventory:client:busy:status', false)
					Working = false
				end)
			else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.donthavecup, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.donthavecup)
                end
			end
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tirarcopos")
AddEventHandler("FN-burgershot:tirarcopos", function()
    if onDuty then
        exports['qb-menu']:openMenu({
            {
                header = "• Grande",
                txt = "Take a big cup",
                params = {
                    event ="FN-burgershot:copogrande",
                }
            },
            {
                header = "• Pequeno",
                txt = "Take a small cup",
                params = {
                    event ="FN-burgershot:copopequeno",
                }
            }
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:copogrande")
AddEventHandler("FN-burgershot:copogrande", function()
    if onDuty then
		Working = true
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		TriggerEvent('inventory:client:busy:status', true)
		QBCore.Functions.Progressbar("tirar_copo", Lang.TakingaLargecup, 5000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
		}, {
		}, {}, {}, function()
			Working = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			TriggerEvent('inventory:client:busy:status', false)
            TriggerServerEvent('FN-burgershot:server:copogrande')
		end, function()
			TriggerEvent('inventory:client:busy:status', false)
			Working = false
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:copopequeno")
AddEventHandler("FN-burgershot:copopequeno", function()
    if onDuty then
		Working = true
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		TriggerEvent('inventory:client:busy:status', true)
		QBCore.Functions.Progressbar("tirar_copo", Lang.TakingaSmallcup, 5000, false, true, {
			disableMovement = true,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = false,
		}, {
		}, {}, {}, function()
			Working = false
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
			TriggerEvent('inventory:client:busy:status', false)
            TriggerServerEvent('FN-burgershot:server:copopequeno')
		end, function()
			TriggerEvent('inventory:client:busy:status', false)
			Working = false
		end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:fazerhamburguer")
AddEventHandler("FN-burgershot:fazerhamburguer", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Make hamburgers",
                isMenuHeader = true,
            },
            {
                header = "• Moneyshot",
                txt = "Bread, Meat, Tomato, Lettuce",
                params = {
                    event ="FN-burgershot:MoneyShot",
                }
            },
            {
                header = "• Torpedo",
                txt = "bread, meat",
                params = {
                    event ="FN-burgershot:Torpedo",
                }
            },
            {
                header = "• Bleeder",
                txt = "Bread, Tomato, Lettuce, Meat",
                params = {
                    event ="FN-burgershot:bleeder",
                }
            },
            {
                header = "• Heartstopper",
                txt = "Bread, Tomato, Lettuce, Meat",
                params = {
                    event ="FN-burgershot:heartstopper",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:cortarmerdas")
AddEventHandler("FN-burgershot:cortarmerdas", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Cut shit",
                isMenuHeader = true,
            },
            {
                header = "• Tomato",
                txt = "Cut the tomato",
                params = {
                    event ="FN-burgershot:cortar_tomates",
                }
            },
            {
                header = "• Potatoes",
                txt = "Cut the potatoes",
                params = {
                    event ="FN-burgershot:cortar_batatas",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:lavarmerdas")
AddEventHandler("FN-burgershot:lavarmerdas", function()
    if onDuty == true then
        exports['qb-menu']:openMenu({
            {
                header = "Wash shit",
                isMenuHeader = true,
            },
            {
                header = "• Potato",
                txt = "Wash the potato",
                params = {
                    event ="FN-burgershot:lavar_merdas",
                }
            },
        })
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent('FN-burgershot:client:dinheiro', function(args)
    local dialog = exports['qb-input']:ShowInput({
        header = "Invoice",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'paypal id'
            }
        }
    })
    if dialog then
        if args == 1 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[1].preco)
        elseif args == 2 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[2].preco)
        elseif args == 3 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[3].preco)
        elseif args == 4 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, config.precos[4].preco)
        end
    end
end)

RegisterNetEvent('FN-burgershot:client:dinheiro2', function(args)
    local dialog = exports['qb-input']:ShowInput({
        header = "Invoice",
        submitText = "Bill Player",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'preco',
                text = 'Price'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'id',
                text = 'Paypal ID'
            }
        }
    })
    if dialog then
        if args == 5 then
            TriggerServerEvent("FN-burgershot:server:fatura:jogador", dialog.id, dialog.preco)
        end
    end
end)

RegisterNetEvent('FN-burgershot:menuentregas', function()
    exports['qb-menu']:openMenu({
        {
            header = "Do you have a vehicle to do the home deliverys?",
            isMenuHeader = true,
        },
        {
            header = "No",
            txt = "If you dont have we will provide a vehicle",
            params = {
                event ="FN-burgershot:entregas",
                args = 1,
            }
        },
        {
            header = "Yes",
            txt = "If you have, then run because the customer is waiting",
            params = {
                event = "FN-burgershot:entregas",
                args = 2
            }
        }
    })
end)

RegisterNetEvent("FN-burgershot:entregas", function(args)
    local args = tonumber(args)
    if onDuty then
        if ocupied == false then
            ocupied = true
                TriggerEvent('animations:client:EmoteCommandStart', {"wait6"})
                QBCore.Functions.Progressbar("espera_entrega", Lang.Waitingfororder, math.random(5000, 10000), false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {
                }, {}, {}, function()
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.ride, 'success', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('inform', Lang.ride)
                    end
                    if args == 1 then
                        Spawncar()
                        bike = true
                    end
                    newdoor()
                    TriggerServerEvent('qb-phone:server:sendNewMail', {
                        sender = config.Sender,
                        subject = config.subject,
                        message = Lang.teste.. ' ' ..items,
                    })
                    Wait(120000)
                    if done == false then
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.outoftime, 'error', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.outoftime)
                        end
                        ocupied = false
                    else
                        done = false
                        ocupied = false
                    end
                end, function()
                    TriggerEvent('inventory:client:busy:status', false)
                    ocupied = false
                end)
        else
            if config.notify == "qbcore" then
                QBCore.Functions.Notify(Lang.endfirst, 'error', 7500)
            elseif config.notify == "mythic" then
                exports['mythic_notify']:DoHudText('error', Lang.endfirst)
            end
        end
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:tirar_donut1")
AddEventHandler("FN-burgershot:tirar_donut1", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", Lang.Takingnormaldonut, 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('FN-burgershot:server:donut1')
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:entregar_mota")
AddEventHandler("FN-burgershot:entregar_mota", function()
    local veh1 = QBCore.Functions.GetClosestVehicle()
    if onDuty then
        if GetEntityModel(veh1) == GetHashKey(config.vehicle) then
            if bike == true then
                QBCore.Functions.Progressbar('entregar_mota', Lang.Deliverthevehicle, 3000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {}, {}, {}, function()
                    DeleteVehicle(veh1)
                    bike = false
                end)
            else
                if config.notify == "qbcore" then
                    QBCore.Functions.Notify(Lang.notours, 'error', 7500)
                elseif config.notify == "mythic" then
                    exports['mythic_notify']:DoHudText('error', Lang.notours)
                end
            end
        else
            if config.notify == "qbcore" then
                QBCore.Functions.Notify(Lang.nobike, 'error', 7500)
            elseif config.notify == "mythic" then
                exports['mythic_notify']:DoHudText('error', Lang.nobike)
            end
        end
    else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
    end
end)

RegisterNetEvent("FN-burgershot:tirar_donut2")
AddEventHandler("FN-burgershot:tirar_donut2", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", Lang.Takingstrawberrydonut, 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('FN-burgershot:server:donut2')
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

RegisterNetEvent("FN-burgershot:tirar_donut3")
AddEventHandler("FN-burgershot:tirar_donut3", function()
    if onDuty then
			Working = true
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
			TriggerEvent('inventory:client:busy:status', true)
			QBCore.Functions.Progressbar("tirar_donut", Lang.Takingchocolatdonut, 3500, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = false,
			}, {
			}, {}, {}, function()
				Working = false
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
				TriggerEvent('inventory:client:busy:status', false)
                TriggerServerEvent('FN-burgershot:server:donut3')
			end, function()
				TriggerEvent('inventory:client:busy:status', false)
				Working = false
			end)
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)
RegisterNetEvent("FN-burgershot:tirardonut")
AddEventHandler("FN-burgershot:tirardonut", function()
    exports['qb-menu']:openMenu({
        {
            header = "Donuts",
            isMenuHeader = true,
        },
        {
            header = "Donut",
            txt = "Normal Donut",
            params = {
                event ="FN-burgershot:tirar_donut1",
            }
        },
        {
            header = "Strawberry donut",
            txt = "Strawberry donut with nuggets",
            params = {
                event ="FN-burgershot:tirar_donut2",
            }
        },
        {
            header = "Chocolate donut",
            txt = "Chocolate donut with nuggets",
            params = {
                event ="FN-burgershot:tirar_donut3",
            }
        },
    })
end)

RegisterNetEvent("FN-burgershot:fatura")
AddEventHandler("FN-burgershot:fatura", function()
    exports['qb-menu']:openMenu({
        {
            header = "Cash Registers",
            isMenuHeader = true,
        },
        {
            header = "HeartStopper Menu",
            txt = "1x Heartstopper, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 1
            }
        },
        {
            header = "Bleeder Menu",
            txt = "1x Bleeder, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 2
            }
        },
        {
            header = "Moneyshot Menu",
            txt = "1x Moneyshot, 1x Chips, 1x drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 3
            }
        },
        {
            header = "Torpedo Menu",
            txt = "1x Torpedo, 1x Chips, 1x Drink",
            params = {
                event ="FN-burgershot:client:dinheiro",
                args = 4
            }
        },
        {
            header = "Extra option",
            txt = "If the customer asks for something that is not above",
            params = {
                event ="FN-burgershot:client:dinheiro2",
                args = 5
            }
        },
        {
            header = "Close menu",
            event = "qb-menu:closeMenu",
            icon = "fas fa-times-circle",
        },
    })
end)

RegisterNetEvent("FN-burgershot:tirarfaca")
AddEventHandler("FN-burgershot:tirarfaca", function()
    if onDuty then
            TriggerServerEvent('FN-burgershot:server:faca_cozinha')
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

function Spawncar()
    local veiculo = config.vehicle
    local coords = config.vehiclespawn
    QBCore.Functions.SpawnVehicle(veiculo, function(veh)
        exports['ps-fuel']:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
    end, coords, true)
end

RegisterNetEvent("FN-burgershot:entregarhamburgers")
AddEventHandler("FN-burgershot:entregarhamburgers", function()
    if onDuty then
        if deliverydoor == 1 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor1', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door1', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor1')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        elseif deliverydoor == 2 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor2', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door2', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor2')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        elseif deliverydoor == 3 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor3', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door3', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor3')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        elseif deliverydoor == 4 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor4', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door4', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor4')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        elseif deliverydoor == 5 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor5', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door5', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor5')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        elseif deliverydoor == 6 then
            QBCore.Functions.TriggerCallback('FN-burgershot:server:itemsdoor6', function(HasItems)
                if HasItems then
                    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
                    QBCore.Functions.Progressbar('entregar_door6', Lang.Entregarcomida, math.random(1500, 3000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent('FN-burgershot:server:removeitemsdoor6')
                        exports['qb-target']:RemoveZone(nome)
                        if config.notify == "qbcore" then
                            QBCore.Functions.Notify(Lang.gj, 'inform', 7500)
                        elseif config.notify == "mythic" then
                            exports['mythic_notify']:DoHudText('inform', Lang.gj)
                        end
                        done = true
                    end, function ()
                    end)
                else
                    if config.notify == "qbcore" then
                        QBCore.Functions.Notify(Lang.donthaveallprods, 'error', 7500)
                    elseif config.notify == "mythic" then
                        exports['mythic_notify']:DoHudText('error', Lang.donthaveallprods)
                    end
                end
            end)
        end
	else
        if config.notify == "qbcore" then
            QBCore.Functions.Notify(Lang.needduty, 'error', 7500)
        elseif config.notify == "mythic" then
            exports['mythic_notify']:DoHudText('error', Lang.needduty)
        end
	end
end)

function newdoor()

    if deliverydoor == 1 then
        SetNewWaypoint(config.door1)
        exportdoor1()
        nome = 'door1'
        items = config.door1items
    elseif deliverydoor == 2 then
        SetNewWaypoint(config.door2)
        exportdoor2()
        nome = 'door2'
        items = config.door2items
    elseif deliverydoor == 3 then
        SetNewWaypoint(config.door3)
        exportdoor3()
        nome = 'door3'
        items = config.door3items
    elseif deliverydoor == 4 then
        SetNewWaypoint(config.door4)
        exportdoor4()
        nome = 'door4'
        items = config.door4items
    elseif deliverydoor == 5 then
        SetNewWaypoint(config.door5)
        exportdoor5()
        nome = 'door5'
        items = config.door5items
    elseif deliverydoor == 6 then
        SetNewWaypoint(config.door6)
        exportdoor6()
        nome = 'door6'
        items = config.door6items
    end
end

CreateThread(function()
    RequestModel(`a_m_m_farmer_01`)
      while not HasModelLoaded(`a_m_m_farmer_01`) do
      Wait(1)
    end
      Ped = CreatePed(2, `a_m_m_farmer_01`, config.DeliverBike, false, false)
      SetPedFleeAttributes(Ped, 0, 0)
      SetPedDiesWhenInjured(Ped, false)
      TaskStartScenarioInPlace(Ped, "missheistdockssetup1clipboard@base", 0, true)
      SetPedKeepTask(Ped, true)
      SetBlockingOfNonTemporaryEvents(Ped, true)
      SetEntityInvincible(Ped, true)
      FreezeEntityPosition(Ped, true)

      exports['qb-target']:AddBoxZone("entregarmota", vector3(-1174.37, -898.72, 13.75), 0.8, 0.6, {
        name = "entregarmota",
        heading = 310,
        minZ=10.55,
        maxZ=14.55,
    }, {
        options = {
            {
                event = "FN-burgershot:entregar_mota",
                icon = "fa-solid fa-box-archive",
                label = "Deliver the bike",
            }
        },
        distance = 3
    })
end)

Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("Burgershot_serviço", vector3(-1195.65, -901.24, 14.5), 0.1, 0.2, {
        name = "Burgershot_serviço",
        heading = 305,
        minZ=14.40,
        maxZ=14.77,
    }, {
        options = {
            {
                event = "FN-burgershot:entrar_servico",
                icon = "far fa-file",
                label = "Enter/Exit Service",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_congelador", vector3(-1199.77, -903.93, 13.97), 0.6, 1.6, {
        name = "Burgershot_congelador",
        heading = 305,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:congelador",
                icon = "fa-solid fa-box-archive",
                label = "Freezer",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico1", vector3(-1200.77, -902.85, 13.97), 1.0, 1.2, {
        name = "Burgershot_frigorifico1",
        heading = 305,
        minZ=11.17,
        maxZ=15.17,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico1",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico2", vector3(-1201.4, -901.82, 13.97), 1.0, 1.2, {
        name = "Burgershot_frigorifico2",
        heading = 305,
        minZ=11.17,
        maxZ=15.17,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico2",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("Burgershot_frigorifico3", vector3(-1202.15, -900.83, 13.97), 1, 1.2, {
        name = "Burgershot_frigorifico3",
        heading = 305,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:Frigorifico3",
                icon = "fa-solid fa-box-archive",
                label = "Fridge",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro1", vector3(-1194.5, -893.76, 14.1), 0.4, 0.4, {
        name = "tabuleiro1",
        heading = 305,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro1",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro2", vector3(-1193.38, -895.46, 14.1), 0.4, 0.4, {
        name = "tabuleiro2",
        heading = 305,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro2",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tabuleiro3", vector3(-1192.38, -896.94, 14.1), 0.4, 0.4, {
        name = "tabuleiro3",
        heading = 305,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:tabuleiro3",
                icon = "fa-solid fa-box-archive",
                label = "Board",
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora3", vector3(-1192.93, -896.26, 14.1), 0.4, 0.4, {
        name = "caixa_registradora3",
        heading = 305,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora2", vector3(-1193.94, -894.8, 14.1), 0.4, 0.4, {
        name = "caixa_registradora2",
        heading = 305,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("caixa_registradora1", vector3(-1194.95, -893.18, 14.1), 0.4, 0.4, {
        name = "caixa_registradora1",
        heading = 305,
        minZ=14,
        maxZ=14.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fatura",
                icon = "fas fa-credit-card",
                label = "Cash register",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_hamburger", vector3(-1196.55, -899.28, 13.89), 1, 0.4, {
        name = "fazer_hamburger",
        heading = 305,
        minZ=11.37,
        maxZ=15.37,
    }, {
        options = {
            {
                event = "FN-burgershot:fazerhamburguer",
                icon = "fas fa-burger",
                label = "Burgers",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_batatas", vector3(-1200.93, -896.76, 13.97), 0.6, 1.6, {
        name = "fazer_batatas",
        heading = 35,
        minZ=10.17,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:fazerbatatas",
                icon = "fas fa-fries",
                label = "Make chips",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_hamburgers", vector3(-1198.25, -895.04, 13.97), 0.8, 1.4, {
        name = "fazer_hamburgers",
        heading = 35,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:fazer_hamburgers",
                icon = "fas fa-burger",
                label = "Make hamburgers",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("cortarmerdas", vector3(-1197.08, -898.17, 13.97), 0.6, 1.4, {
        name = "cortarmerdas",
        heading = 215,
        minZ=10.17,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:cortarmerdas",
                icon = "fas fa-burger",
                label = "Use counter",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("lavar_merdas", vector3(-1197.58, -902.82, 13.97), 0.6, 0.8, {
        name = "lavar_merdas",
        heading = 215,
        minZ=9.97,
        maxZ=13.97,
    }, {
        options = {
            {
                event = "FN-burgershot:lavarmerdas",
                icon = "fas fa-water",
                label = "Wash shit",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tirar_copos", vector3(-1196.43, -894.9, 13.97), 0.2, 1, {
        name = "tirar_copos",
        heading = 305,
        minZ=13.80,
        maxZ=14.17,
    }, {
        options = {
            {
                event = "FN-burgershot:tirarcopos",
                icon = "",
                label = "Take cups",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("fazer_bebida", vector3(-1196.92, -894.96, 14.3), 0.5, 0.8, {
        name = "fazer_bebida",
        heading = 300, 
        minZ=13.77,
        maxZ=14.77
    }, {
        options = {
            {
                event = "FN-burgershot:tamanhobebidas",
                icon = "",
                label = "Make drinks",
                job = config.bsjob
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddBoxZone("tirar_donut", vector3(-1196.39, -895.67, 14.5), 0.2, 0.8, {
        name = "tirar_donut",
        heading = 305, 
        minZ=13.77,
        maxZ=14.77,
    }, {
        options = {
            {
                event = "FN-burgershot:tirardonut",
                icon = "fas fa-donut",
                label = "Take Donut's",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
    exports['qb-target']:AddCircleZone("phone", vector3(-1196.68, -902.17, 14.02), 0.25, {
        name = "phone",
        useZ=true,
    }, {
        options = {
            {
                event = "FN-burgershot:menuentregas",
                icon = "fas fa-phone",
                label = "Deliver some food",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end)

function exportdoor1()
    exports['qb-target']:AddBoxZone("door1", vector3(-667.02, 471.18, 114.14), 0.2, 1.6, {
        name="door1",
        heading=15,
        minZ=112.14,
        maxZ=116.14,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end

function exportdoor2()
    exports['qb-target']:AddBoxZone("door2", vector3(386.53, -993.52, 29.42), 1.4, 0.2, {
        name="door2",
        heading=15,
        minZ=26.82,
        maxZ=30.82,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end

function exportdoor3()
    exports['qb-target']:AddBoxZone("door3", vector3(-2015.43, 499.89, 107.17), 1.0, 0.6, {
        name="door3",
        heading=165,
        minZ=104.37,
        maxZ=108.37,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end

function exportdoor4()
    exports['qb-target']:AddBoxZone("door4", vector3(431.62, -1725.02, 29.6), 0.8, 1.4, {
        name="door4",
        heading=320,
        minZ=26.8,
        maxZ=30.8,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end

function exportdoor5()
    exports['qb-target']:AddBoxZone("door5", vector3(-1913.24, -573.83, 11.44), 0.6, 1.0, {
        name="door5",
        heading=320,
        minZ=8.44,
        maxZ=12.44,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end

function exportdoor6()
    exports['qb-target']:AddBoxZone("door6", vector3(-3105.71, 246.49, 12.5), 0.4, 1.4, {
        name="door6",
        heading=290,
        minZ=9.7,
        maxZ=13.7,
    }, {
        options = {
            {
                event = "FN-burgershot:entregarhamburgers",
                icon = "fas fa-phone",
                label = "Deliver the order",
                job = config.bsjob
            }
        },
        distance = 1.5
    })
end