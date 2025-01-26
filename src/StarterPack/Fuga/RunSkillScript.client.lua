local tool = script.Parent
local _COOLDOWN_TIME = 5
local hasClicked = false
local _SKILLCOST = 100
local MANA_EVENT = game.ReplicatedStorage.mana.ManaEvent
local MANA_FUNCTION_EVENT = game.ReplicatedStorage.mana.GetManaFunction

local function PlaySkillSound()
	local sound = Instance.new("Sound")
	sound.Parent = tool
	sound.SoundId = "rbxassetid://78637547122675"
	sound:Play()
end

tool.Activated:Connect(function() 
	local manaValue = MANA_FUNCTION_EVENT:InvokeServer() -- Getting the amount of mana from the server rather than the client

	if manaValue and hasClicked ~= true then
		if manaValue >= _SKILLCOST then
			hasClicked = true
			print("Fuga activated")
			MANA_EVENT:FireServer(_SKILLCOST, false) -- Removing the amount of mana required for the skill
			PlaySkillSound()
			task.wait(_COOLDOWN_TIME)
			hasClicked = false
		else
			print("You need " .. (_SKILLCOST - manaValue) .. " mana")
		end
	else
		print("This ability is in cooldown")
	end
end)