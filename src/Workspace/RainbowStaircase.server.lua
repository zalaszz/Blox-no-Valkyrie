local function GenerateRainbowStairCase()
	local spawn = game.Workspace.SpawnLocation
	for counter = 1, 100, 1 do
		local size = 10
		local XPos = spawn.Position.X
		local YPos = 3 * counter
		local ZPos = spawn.Position.Z - 20 - counter * 10
		local part = Instance.new("Part", workspace)
		if counter == 100 then
			size = size * 10
			YPos = 3 * (counter - 1)
			ZPos = ZPos - (size / 2) + 5
		end
		part.Anchored = true
		part.Name = "Platform" .. counter
		part.CanCollide = true
		part.Reflectance = 1
		part.Size = Vector3.new(size, 1, size)
		part.Position = Vector3.new(XPos, YPos, ZPos)
		part.Material = Enum.Material.Metal
		part.Color = Color3.fromRGB(counter * 23, counter * 2, counter * 44)
	end
end

GenerateRainbowStairCase()

--[[ame.workspace.Platform3.Touched:Connect(function(otherPart)
	local humanoid = otherPart.Parent:FindFirstChild("Humanoid")
	humanoid.Health = humanoid.Health - 5
end)]]
