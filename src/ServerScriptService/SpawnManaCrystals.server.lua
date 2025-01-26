local playManaCrystalSoundEvent = game.ReplicatedStorage.sound.PlayDestroyManaCrystalSoundEvent
local destroyManaCrystalEvent = game.ReplicatedStorage.manacrystal.DestroyManaCrystalEvent
local numCrystals = 0
local _MAX_MANACRYSTALS = 15

local function SpawnManaCrystals()
	local platform = game.Workspace:FindFirstChild("Platform100")
	local platMaxX = platform.Position.X + platform.Size.X / 2
	local platMinX = platform.Position.X - platform.Size.X / 2
	local platMaxZ = platform.Position.Z + platform.Size.Z / 2
	local platMinZ = platform.Position.Z - platform.Size.Z / 2

	local PosX = math.random(platMinX, platMaxX)
	local PoxY = platform.Position.Y + 7
	local PosZ = math.random(platMinZ, platMaxZ)

	local ManaCrystal = Instance.new("Part", workspace)
	ManaCrystal.Name = "ManaCrystal"
	ManaCrystal.Color = Color3.fromRGB(60, 138, 255)
	ManaCrystal.Size = Vector3.new(5, 5, 5)
	ManaCrystal.Position = Vector3.new(PosX, PoxY, PosZ)
	ManaCrystal.Transparency = 0
	ManaCrystal.CanTouch = true
	ManaCrystal.CanCollide = false
	ManaCrystal.Anchored = true
	ManaCrystal.Material = Enum.Material.Neon
	ManaCrystal.Shape = Enum.PartType.Ball

	return ManaCrystal
end

local function HandleManaCrystalFunctionality(manaCrystal)
	local hasTouched = false
	
	manaCrystal.Touched:Connect(function(otherPart)
		local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
		if humanoid then
			local player = game.Players:GetPlayerFromCharacter(otherPart.Parent)
			if player and hasTouched ~= true then
				numCrystals = numCrystals - 1
				hasTouched = true
				playManaCrystalSoundEvent:FireClient(player, manaCrystal)

				manaCrystal.Transparency = 1
			end
		end
	end)
end

destroyManaCrystalEvent.OnServerEvent:Connect(function(player, manaCrystal)
	manaCrystal:Destroy()
end)

local watcher = coroutine.create(function()
	while(true) do
		task.wait(3)
		if numCrystals < _MAX_MANACRYSTALS then
			print("Generating mana crystal...")

			-- Generating mana crystals
			local ManaCrystal = SpawnManaCrystals()
			numCrystals = numCrystals + 1

			-- Handling touch functionality
			HandleManaCrystalFunctionality(ManaCrystal)
		end
	end	
end)

coroutine.resume(watcher)

--[[game:GetService("RunService").Heartbeat:Connect(function()	
	if numCrystals < _MAX_MANACRYSTALS then
		print("Generating mana crystal...")

		-- Generating mana crystals
		local ManaCrystal = SpawnManaCrystals()
		numCrystals = numCrystals + 1

		-- Handling touch functionality
		HandleManaCrystalFunctionality(ManaCrystal)
	end
end)]]