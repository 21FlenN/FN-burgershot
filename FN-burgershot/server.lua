local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("FN-burgershot:server:fatura:jogador")
AddEventHandler("FN-burgershot:server:fatura:jogador", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                MySQL.Async.execute('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (@citizenid, @amount, @society, @sender)', {
                    ['@citizenid'] = billed.PlayerData.citizenid,
                    ['@amount'] = amount,
                    ['@society'] = biller.PlayerData.job.name,
                    ['@sender'] = biller.PlayerData.charinfo.firstname
                })
                TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Invoice sent'})
                TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'You receive an invoice')
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You cannot send an invoice to yourself'})
            end
        else
           TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This person is not online'})
        end
end)


QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrmoneyshot', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local lettuce = player.Functions.GetItemByName("alface")
    local meat = player.Functions.GetItemByName("carne_feita")
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrtorpedo', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local meat = player.Functions.GetItemByName("carne_feita")
    local bun = player.Functions.GetItemByName("pao_hamburger")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrheartstopper', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    local meat = player.Functions.GetItemByName("carne_feita")
    local lettuce = player.Functions.GetItemByName("alface")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbleeder', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local bun = player.Functions.GetItemByName("pao_hamburger")
    local tomato = player.Functions.GetItemByName("tomate_cortado")
    local meat = player.Functions.GetItemByName("carne_feita")
    local lettuce = player.Functions.GetItemByName("alface")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil and meat ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_cortada")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrcarne', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local carne = player.Functions.GetItemByName("carne_crua")
    if carne ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrtomate', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local tomate = player.Functions.GetItemByName("tomate")
    local faca = player.Functions.GetItemByName("faca_cozinha")
    if tomate ~= nil and faca ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata_cortar', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_crua")
    local faca = player.Functions.GetItemByName("faca_cozinha")
    if batata ~= nil and faca ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:ingrbatata_lavar', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("batata_suja")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:copobebida', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("copogrande")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:get:copobebidapequeno', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local batata = player.Functions.GetItemByName("copopequeno")
    if batata ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:moneyshot', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('carne_feita', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_feita'], "remove")
    Player.Functions.RemoveItem('alface', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['alface'], "remove")
    Player.Functions.RemoveItem('pao_hamburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pao_hamburger'], "remove")
    Player.Functions.RemoveItem('tomate_cortado', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomate_cortado'], "remove")
    Player.Functions.AddItem('moneyshot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['moneyshot'], "add")
end)

RegisterServerEvent('FN-burgershot:server:torpedo', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('carne_feita', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_feita'], "remove")
    Player.Functions.RemoveItem('pao_hamburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pao_hamburger'], "remove")
    Player.Functions.AddItem('torpedo', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['torpedo'], "add")
end)

RegisterServerEvent('FN-burgershot:server:heartstopper', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('carne_feita', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_feita'], "remove")
    Player.Functions.RemoveItem('alface', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['alface'], "remove")
    Player.Functions.RemoveItem('pao_hamburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pao_hamburger'], "remove")
    Player.Functions.RemoveItem('tomate_cortado', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomate_cortado'], "remove")
    Player.Functions.AddItem('heartstopper', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['heartstopper'], "add")
end)

RegisterServerEvent('FN-burgershot:server:bleeder', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('carne_feita', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_feita'], "remove")
    Player.Functions.RemoveItem('alface', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['alface'], "remove")
    Player.Functions.RemoveItem('pao_hamburger', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pao_hamburger'], "remove")
    Player.Functions.RemoveItem('tomate_cortado', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomate_cortado'], "remove")
    Player.Functions.AddItem('bleeder', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bleeder'], "add")
end)

RegisterServerEvent('FN-burgershot:server:batatas_fritas', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('batata_cortada', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batata_cortada'], "remove")
    Player.Functions.AddItem('batatas_fritas', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batatas_fritas'], "add")
end)

RegisterServerEvent('FN-burgershot:server:carne_feita', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('carne_crua', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_crua'], "remove")
    Player.Functions.AddItem('carne_feita', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carne_feita'], "add")
end)

RegisterServerEvent('FN-burgershot:server:tomate_cortado', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('tomate', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomate'], "remove")
    Player.Functions.AddItem('tomate_cortado', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tomate_cortado'], "add")
end)

RegisterServerEvent('FN-burgershot:server:batata_cortada', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('batata_crua', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batata_crua'], "remove")
    Player.Functions.AddItem('batata_cortada', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batata_cortada'], "add")
end)

RegisterServerEvent('FN-burgershot:server:batata_suja', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('batata_suja', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batata_suja'], "remove")
    Player.Functions.AddItem('batata_crua', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batata_crua'], "add")
end)

RegisterServerEvent('FN-burgershot:server:colagrande', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('copogrande', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copogrande'], "remove")
    Player.Functions.AddItem('bebida_pequena', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bebida_pequena'], "add")
end)

RegisterServerEvent('FN-burgershot:server:colapequena', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('copopequeno', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copopequeno'], "remove")
    Player.Functions.AddItem('cocacola', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cocacola'], "add")
end)

RegisterServerEvent('FN-burgershot:server:copogrande', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('copogrande', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copogrande'], "add")
end)


RegisterServerEvent('FN-burgershot:server:copopequeno', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('copopequeno', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copopequeno'], "add")
end)

RegisterServerEvent('FN-burgershot:server:donut1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('donut1', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut1'], "add")
end)

RegisterServerEvent('FN-burgershot:server:donut2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('donut2', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut2'], "add")
end)

RegisterServerEvent('FN-burgershot:server:donut3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('donut3', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut3'], "add")
end)

RegisterServerEvent('FN-burgershot:server:faca_cozinha', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('faca_cozinha', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['faca_cozinha'], "add")
end)

--Doors

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor1', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("moneyshot")
    local item2 = player.Functions.GetItemByName("batatas_fritas")
    local item3 = player.Functions.GetItemByName("bebida_pequena")
    local item4 = player.Functions.GetItemByName("donut3")

    if item1 ~=nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor1', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('moneyshot', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['moneyshot'], "remove")
    Player.Functions.RemoveItem('batatas_fritas', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batatas_fritas'], "remove")
    Player.Functions.RemoveItem('bebida_pequena', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bebida_pequena'], "remove")
    Player.Functions.RemoveItem('donut3', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut3'], "remove")
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor2', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("torpedo")
    local item2 = player.Functions.GetItemByName("heartstopper")
    local item3 = player.Functions.GetItemByName("cocacola")
    local item4 = player.Functions.GetItemByName("donut1")

    if item1 ~=nil and item2 ~= nil and item3 ~= nil and item4 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('torpedo', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['torpedo'], "remove")
    Player.Functions.RemoveItem('heartstopper', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['heartstopper'], "remove")
    Player.Functions.RemoveItem('cocacola', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cocacola'], "remove")
    Player.Functions.RemoveItem('donut1', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut1'], "remove")
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor3', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("torpedo")
    local item2 = player.Functions.GetItemByName("bebida_pequena")
    local item3 = player.Functions.GetItemByName("donut2")

    if item1 ~=nil and item2 ~= nil and item3 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('torpedo', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['torpedo'], "remove")
    Player.Functions.RemoveItem('bebida_pequena', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bebida_pequena'], "remove")
    Player.Functions.RemoveItem('donut2', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut2'], "remove")
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor4', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("batatas_fritas")
    local item2 = player.Functions.GetItemByName("bebida_pequena")
    local item3 = player.Functions.GetItemByName("donut1")

    if item1 ~=nil and item2 ~= nil and item3 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('batatas_fritas', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batatas_fritas'], "remove")
    Player.Functions.RemoveItem('bebida_pequena', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bebida_pequena'], "remove")
    Player.Functions.RemoveItem('donut1', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['donut1'], "remove")
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor5', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("cocacola")
    local item2 = player.Functions.GetItemByName("batatas_fritas")

    if item1 ~=nil and item2 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor5', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('cocacola', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cocacola'], "remove")
    Player.Functions.RemoveItem('batatas_fritas', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['batatas_fritas'], "remove")
end)

QBCore.Functions.CreateCallback('FN-burgershot:server:itemsdoor6', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)

    local item1 = player.Functions.GetItemByName("cocacola")
    local item2 = player.Functions.GetItemByName("bebida_pequena")

    if item1 ~=nil and item2 ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterServerEvent('FN-burgershot:server:removeitemsdoor6', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('cocacola', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cocacola'], "remove")
    Player.Functions.RemoveItem('bebida_pequena', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bebida_pequena'], "remove")
end)