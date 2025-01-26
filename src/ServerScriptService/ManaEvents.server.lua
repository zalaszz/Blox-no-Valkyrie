local LeaderStats = require(game.ServerScriptService.Leaderstats)
-- Creating LeaderStats such as Mana
game.Players.PlayerAdded:Connect(function(player)
	LeaderStats.CreateLeaderstat(player, "IntValue", "Mana", 100)
	
	local ambientSoundEvent = game.ReplicatedStorage.sound.PlayAmbientSoundEvent
	ambientSoundEvent:FireClient(player)
end)

-- Mana Related events
local manaEvent = game.ReplicatedStorage.mana.ManaEvent
manaEvent.OnServerEvent:Connect(function(player, manaAmount, isAdding)
	local playerMana = LeaderStats.GetLeaderstatValue(player, "Mana")
	if isAdding then
		LeaderStats.AddLeaderstatValue(player, "Mana", manaAmount)
	elseif isAdding ~= true and playerMana >= manaAmount then
		LeaderStats.RemoveLeaderstatValue(player, "Mana", manaAmount)		
	end
end)

local manaFunctionEvent = game.ReplicatedStorage.mana.GetManaFunction
manaFunctionEvent.OnServerInvoke = function(player)
	return LeaderStats.GetLeaderstatValue(player, "Mana")
end