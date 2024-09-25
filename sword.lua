-- NOTE: this script sits under a tool in StarterPack
local tool = script.Parent
	local function whenTouched(otherPart)
	local otherHumanoid = otherPart.Parent:FindFirstChild("Humanoid")

	if not otherHumanoid then return end
	
	if otherHumanoid.Parent == tool then return end
	
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
