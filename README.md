Free qbcore Burgershot script made for new qbcore

dependency
qb-core
qb-target
qb-phone


mlo used : https://fivem.gnstud.io/package/4841796


Changes//add

qb-smallresources/config.lua

ConsumeablesEat

	["bleeder"] = math.random(35, 54),
	["moneyshot"] = math.random(35, 54),
	["torpedo"] = math.random(35, 54),
	["heartstopper"] = math.random(35, 54),
	["batatas_fritas"] = math.random(35, 54),
	["donut1"] = math.random(35, 54),
	["donut2"] = math.random(35, 54),
	["donut3"] = math.random(35, 54),

ConsumeablesDrink
	
	["bebida_pequena"] = math.random(40, 50),
	["milkshake"] = math.random(40, 50),
	["cocacola"] = math.random(40, 50),
	
qb-smallresources/server/consumables.lua

	QBCore.Functions.CreateUseableItem("bleeder", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:bleeder", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("moneyshot", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:moneyshot", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("torpedo", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:torpedo", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("heartstopper", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:heartstopper", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("batatas_fritas", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:batatas", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("donut1", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Eat", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("donut2", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Eat", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("donut3", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Eat", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("milkshake", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:Drink", source, item.name)
	    end
	end)


	QBCore.Functions.CreateUseableItem("bebida_pequena", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:bs_beber", source, item.name)
	    end
	end)

	QBCore.Functions.CreateUseableItem("cocacola", function(source, item)
	    local Player = QBCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
		TriggerClientEvent("consumables:client:bs_beber", source, item.name)
	    end
	end)


qb-smallresources/client/consumables.lua -- change animations

	RegisterNetEvent('consumables:client:bleeder', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"bleeder"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end)
	end)

	RegisterNetEvent('consumables:client:heartstopper', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"heartstopper"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end)
	end)

	RegisterNetEvent('consumables:client:moneyshot', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"moneyshot"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end)
	end)

	RegisterNetEvent('consumables:client:torpedo', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"torpedo"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end)
	end)

	RegisterNetEvent('consumables:client:batatas', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"batatas"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end, function ()
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	    end)
	end)

	RegisterNetEvent('consumables:client:gelado_meteorite', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"gelado_meteorite"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end, function ()
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	    end)
	end)

	RegisterNetEvent('consumables:client:gelado_laranja', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"gelado_laranja"})
	    QBCore.Functions.Progressbar("eat_something", "A comer..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
		TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
	    end, function ()
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	    end)
	end)

	RegisterNetEvent('consumables:client:bs_beber', function(itemName)
	    TriggerEvent('animations:client:EmoteCommandStart', {"bs_beber"})
	    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
		disableMovement = false,
		disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
	    }, {}, {}, {}, function() -- Done
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
	    end)
	end)


qb-core/shared/items.lua


	-- Burger Shot
		-- Food
		["bleeder"] 				= {["name"] = "bleeder", 			 	["label"] = "Bleeder", 					["weight"] = 250, 		["type"] = "item", 		["image"] = "bs_the-bleeder.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		["moneyshot"] 			 	= {["name"] = "moneyshot", 			 	["label"] = "Moneyshot", 				["weight"] = 300, 		["type"] = "item", 		["image"] = "bs_money-shot.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		["torpedo"] 				= {["name"] = "torpedo", 			 	["label"] = "Torpedo", 					["weight"] = 310, 		["type"] = "item", 		["image"] = "bs_torpedo.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		["heartstopper"] 		 	= {["name"] = "heartstopper", 			["label"] = "Heartstopper", 			["weight"] = 2500, 		["type"] = "item", 		["image"] = "bs_the-heart-stopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},
		["batatas_fritas"] 			= {["name"] = "batatas_fritas", 		["label"] = "Batatas", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_fries.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Sates Hunger."},

		-- Drinks
		["bebida_pequena"] 			 = {["name"] = "bebida_pequena", 		["label"] = "Coca cola grande", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Uma cola fresquinha"},
		["milkshake"] 			     = {["name"] = "milkshake", 			["label"] = "Batido", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_milkshake.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hand-scooped for you!"},
		["cocacola"] 			 	 = {["name"] = "cocacola", 				["label"] = "Coca cola pequena", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_copopequeno_cola.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Uma cola fresquinha"},


		--Ingredients
		["pao_hamburger"] 			= {["name"] = "pao_hamburger", 			["label"] = "Pão de hamburger",			["weight"] = 125, 		["type"] = "item",		["image"] = "bs_bun.png", 		    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["carne_crua"] 				= {["name"] = "carne_crua", 			["label"] = "Carne crua", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty_raw.png", 	        ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["carne_feita"] 			= {["name"] = "carne_feita", 			["label"] = "Carne cozinhada", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_patty.png", 		    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["alface"] 				 	= {["name"] = "alface", 			 	["label"] = "Alfaçe", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_lettuce.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["tomate"] 				 	= {["name"] = "tomate", 			 	["label"] = "Tomate", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_tomato.png", 	    		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["tomate_cortado"] 			= {["name"] = "tomate_cortado", 		["label"] = "Tomate cortado", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_tomatecortado.png", 	    ["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["batata_suja"] 			= {["name"] = "batata_suja", 			["label"] = "Batata", 					["weight"] = 1500, 		["type"] = "item", 		["image"] = "bs_batatasuja.png", 	    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["batata_crua"] 			= {["name"] = "batata_crua", 			["label"] = "Batata crua", 				["weight"] = 1500, 		["type"] = "item", 		["image"] = "bs_batatacrua.png", 	    	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["batata_cortada"] 		 	= {["name"] = "batata_cortada", 		["label"] = "Batata cortada", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_batatacortada.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["receita_milkshake"] 		= {["name"] = "receita_milkshake", 		["label"] = "Receita do batido", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_icecream.png", 	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["xarope"] 		 	 		= {["name"] = "xarope", 				["label"] = "Xarope", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_ingredients_hfcs.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["faca_cozinha"] 		 	= {["name"] = "faca_cozinha", 			["label"] = "Faca de cozinha", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_facacozinha.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["copovazio"] 		 		= {["name"] = "copovazio", 				["label"] = "Copo de milkshake", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_copovazio.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["copogrande"] 				= {["name"] = "copogrande", 			["label"] = "Copo Grande", 				["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_softdrink_empty.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["copopequeno"] 			= {["name"] = "copopequeno", 			["label"] = "Copo Pequeno", 			["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_copobebidavazio.png", 		["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["donut1"] 					= {["name"] = "donut1", 				["label"] = "Donut", 					["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_donut1.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["donut2"] 					= {["name"] = "donut2", 				["label"] = "Donut de morango", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_donut2.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},
		["donut3"] 					= {["name"] = "donut3", 				["label"] = "Donut de chocolate", 		["weight"] = 125, 		["type"] = "item", 		["image"] = "bs_donut3.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Ingredient"},


qb-core/shared/jobs.lua

	["burgershot"] = {
			label = "Burgershot Employee",
			defaultDuty = true,
			grades = {
		    ['0'] = {
			name = "Trainee",
			payment = 50
		    },
				['1'] = {
			name = "Employee",
			payment = 75
		    },
				['2'] = {
			name = "Burger Flipper",
			payment = 100
		    },
				['3'] = {
			name = "Manager",
			payment = 125
		    },
				['4'] = {
			name = "CEO",
					isboss = true,
			payment = 150
		    },
		},
		},
