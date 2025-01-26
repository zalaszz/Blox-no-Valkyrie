local LeaderStats = {}

local function CreateLeaderStatFolderIfRequired(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then
		leaderstats = Instance.new("Folder")
		leaderstats.Name = "leaderstats"
		leaderstats.Parent = player
	end
	return leaderstats
end 

function LeaderStats.CreateLeaderstat(player, statType, statName, statValue)
	local leaderstats = CreateLeaderStatFolderIfRequired(player)
	local stat = Instance.new(statType)
	stat.Name = statName
	stat.Value = statValue
	stat.Parent = leaderstats
end

local function GetLeaderstat(player, statName)
	local leaderstats = CreateLeaderStatFolderIfRequired(player)
	return leaderstats:FindFirstChild(statName)
end

function LeaderStats.GetLeaderstatValue(player, statName)
	local stat = GetLeaderstat(player, statName)
	if stat then
		return stat.Value
	end
	return nil
end

function LeaderStats.SetLeaderstatValue(player, statName, statValue)
	local stat = GetLeaderstat(player, statName)
	if stat then
		stat.Value = statValue
	end
end

function LeaderStats.AddLeaderstatValue(player, statName, statValue)
	local stat = GetLeaderstat(player, statName)
	if stat then
		stat.Value += statValue
	end
end

function LeaderStats.RemoveLeaderstatValue(player, statName, statValue)
	local stat = GetLeaderstat(player, statName)
	if stat then
		stat.Value -= statValue
	end
end

return LeaderStats
