-- NOTE: this script sits under a tool in StarterPack
-- Can be seen in use: https://www.roblox.com/games/5727187297/
local tool = script.Parent
	-- function is created for when the sword touches a part that belongs to an avatar (a person)
	local function whenTouched(otherPart)
	local otherHumanoid = otherPart.Parent:FindFirstChild("Humanoid")

	if not otherHumanoid then return end
	
	if otherHumanoid.Parent == tool then return end
-- The value of TakeDamage can be adjusted 
otherHumanoid:TakeDamage(100)
end
	
	local function slash()
	local str = Instance.new("StringValue")
	str.Name = "toolAnimation"
	str.Value = "Slash"
	str.Parent = tool
	end

tool.Activated:Connect(slash)
tool.Handle.Touched:Connect(whenTouched)
