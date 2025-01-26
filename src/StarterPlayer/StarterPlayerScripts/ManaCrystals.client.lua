local playManaCrystalSoundEvent = game.ReplicatedStorage.sound.PlayDestroyManaCrystalSoundEvent
local destroyManaCrystalEvent = game.ReplicatedStorage.manacrystal.DestroyManaCrystalEvent
local manaEvent = game.ReplicatedStorage.mana.ManaEvent

local function DestroyManaCrystalOnSoundCompletion(sound, manaCrystal)
	sound.Ended:Connect(function(soundId)
		destroyManaCrystalEvent:FireServer(manaCrystal)
	end)
end

local function PlayManaCrystalSound(manaCrystal)
	local sound = Instance.new("Sound")
	sound.Parent = manaCrystal
	sound.SoundId = "rbxassetid://160772554"
	sound.Volume = 0.2
	sound:Play()
	DestroyManaCrystalOnSoundCompletion(sound, manaCrystal)
end

playManaCrystalSoundEvent.OnClientEvent:Connect(function(manaCrystal)
	manaEvent:FireServer(5, true)
	PlayManaCrystalSound(manaCrystal)
end)