--[[local untouchedColor = Color3.fromRGB(26, 255, 0)
local part = Instance.new("Part", workspace)
game.Players.PlayerAdded:Connect(function(player)
	local spawn = game.Workspace.SpawnLocation
	print("Chupapi munyanyo has joined the game!", player.DisplayName)
	part.Anchored = true
	part.Color = untouchedColor
	part.CanCollide = true
	part.CanTouch = false
	part.Reflectance = 1
	part.Size = Vector3.new(10, 1, 10)
	part.Position = Vector3.new(spawn.Position.X, spawn.Position.Y + 5, spawn.Position.Z - 20)
	part.Material = Enum.Material.Metal
end)


local function ChangeTouchedPart(otherPart)
	print("I was touched lil bruh ", otherPart.Name)
	part.Color = Color3.fromRGB(255, 11, 27)
	part.Position = Vector3.new(part.Position.X - math.random(-1, 1), part.Position.Y - math.random(-1, 1), part.Position.Z - math.random(-1, 1)) 
end

local function ChangeUntouchedPart(otherPart)
	part.Color = untouchedColor
	part.Position = Vector3.new(part.Position.X + math.random(-1, 1), part.Position.Y + math.random(-1, 1), part.Position.Z + math.random(-1, 1))
end

part.Touched:Connect(ChangeTouchedPart)
part.TouchEnded:Connect(ChangeUntouchedPart)


local bp = game.Workspace.Baseplate
local counter = 1
while counter <= 255 and counter > 0 do
	if counter == 255 then
		counter = 1	
	end
	
	--print("Counter is at: ", counter)
	bp.Color = Color3.fromRGB(counter + 5, counter, 255 - counter)
	counter = counter + 1
	wait(0.005)
end]]