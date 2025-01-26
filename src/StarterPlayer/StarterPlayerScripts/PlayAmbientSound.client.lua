local function PlayAmbientSound()
	local sound = Instance.new("Sound")
	--sound.SoundId = "rbxassetid://124213172154123"
	sound.SoundId = "rbxassetid://1840020395"
	sound.Looped = true
	sound.Parent = game.Workspace
	sound.Volume = 0.6
	sound:Play()
end

local ambientSoundEvent = game.ReplicatedStorage.sound.PlayAmbientSoundEvent
ambientSoundEvent.OnClientEvent:Connect(function(plr)
	PlayAmbientSound()	
end)