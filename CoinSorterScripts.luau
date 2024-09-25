-- LocalScript in StarterGui
-- data storage to move coin values
local replicatedStorage = game:GetService("ReplicatedStorage")
local toonieVal = replicatedStorage:WaitForChild("toonieVal")
local loonieVal = replicatedStorage:WaitForChild("loonieVal")
local cent25Val = replicatedStorage:WaitForChild("cent25Val")
local cent10Val = replicatedStorage:WaitForChild("cent10Val")
local cent05Val = replicatedStorage:WaitForChild("cent05Val")
local cent01Val = replicatedStorage:WaitForChild("cent01Val")

--audio
local coinSfx = game.SoundService.mvm_money_pickup

-- pocket is the textbox
local pocket = script.Parent
local enterBtn = pocket.Parent:FindFirstChild("EnterBtn")

--checks whether player has selected or deselected textbox
pocket.Focused:Connect(function()
	print("player selected pocketbox")
end)

pocket.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		print("player hit enter key")
		local value = tonumber(pocket.Text) + 0.005
		print(value, type(value))	
		
		local cent01 = 0
		local cent05 = 0
		local cent10 = 0
		local cent25 = 0
		local loonie = 0
		local toonie = 0
		
		-- if value is a number/float, it will proceed
		if value ~= nil then
			coinSfx:Play()
			print("value is a number!")
			print("value is now:", value)
			
			--toonie
			while value > 2 do
				value -= 2
				toonie += 1
				value = tostring(value)
				print(value, toonie)
				value = tonumber(value)
			end
			
			--loonie
			while value > 1 do
				value -= 1
				loonie += 1
				value = tostring(value)
				print(value, loonie)
				value = tonumber(value)
			end
			
			--cent25
			while value > 0.25 do
				value -= 0.25
				cent25 += 1
				value = tostring(value)
				print(value, cent25)
				value = tonumber(value)
			end
			
			--cent10
			while value > 0.10 do
				value -= 0.10
				cent10 += 1
				value = tostring(value)
				print(value, cent10)
				value = tonumber(value)
			end
			
			--cent05
			while value > 0.05 do
				value -= 0.05
				cent05 += 1
				value = tostring(value)
				print(value, cent05)
				value = tonumber(value)
			end
			
			--cent01
			while value > 0.01 do
				value -= 0.01
				cent01 += 1
				value = tostring(value)
				print(value, cent01)
				value = tonumber(value)
			end
			--sends coin values to a Remote Events
			toonieVal:FireServer(toonie)
			loonieVal:FireServer(loonie)
			cent25Val:FireServer(cent25)
			cent10Val:FireServer(cent10)
			cent05Val:FireServer(cent05)
			cent01Val:FireServer(cent01)
			
			--the numbers listed on the coin signs must correspond to this receipt
			print("all sorted! Value is:", value)
			print("Change:", toonie, "toonies", loonie, "loonies", cent25, "quarters", cent10, "dimes", cent05, "nickels", cent01, "pennies!")
		end
	end
	print("player deselected pocketbox")
end)

enterBtn.MouseButton1Click:Connect(function()
	print("player hit enter key")
	local value = tonumber(pocket.Text)
	print(value, type(value))	

	local cent01 = 0
	local cent05 = 0
	local cent10 = 0
	local cent25 = 0
	local loonie = 0
	local toonie = 0

	-- if value is a number/float, it will proceed
	if value ~= nil then
		coinSfx:Play()
		print("value is a number!")
		print("value is now:", value)

		--toonie
		while value > 2 do
			value -= 2
			toonie += 1
			value = tostring(value)
			print(value, toonie)
			value = tonumber(value)
		end

		--loonie
		while value > 1 do
			value -= 1
			loonie += 1
			value = tostring(value)
			print(value, loonie)
			value = tonumber(value)
		end

		--cent25
		while value > 0.25 do
			value -= 0.25
			cent25 += 1
			value = tostring(value)
			print(value, cent25)
			value = tonumber(value)
		end

		--cent10
		while value > 0.10 do
			value -= 0.10
			cent10 += 1
			value = tostring(value)
			print(value, cent10)
			value = tonumber(value)
		end

		--cent05
		while value > 0.05 do
			value -= 0.05
			cent05 += 1
			value = tostring(value)
			print(value, cent05)
			value = tonumber(value)
		end

		--cent01
		while value > 0.01 do
			value -= 0.01
			cent01 += 1
			value = tostring(value)
			print(value, cent01)
			value = tonumber(value)
		end
		--sends coin values to a Remote Events
		toonieVal:FireServer(toonie)
		loonieVal:FireServer(loonie)
		cent25Val:FireServer(cent25)
		cent10Val:FireServer(cent10)
		cent05Val:FireServer(cent05)
		cent01Val:FireServer(cent01)

		--the numbers listed on the coin signs must correspond to this receipt
		print("all sorted! Value is:", value)
		print("Change:", toonie, "toonies", loonie, "loonies", cent25, "quarters", cent10, "dimes", cent05, "nickels", cent01, "pennies!")
	end
end)




-- Script in ServerScriptService
--defining the coins
local counters = workspace.CoinCounters
local replicatedStorage = game:GetService("ReplicatedStorage")

-- toonie
local toonieVal = replicatedStorage:WaitForChild("toonieVal")
toonieVal.OnServerEvent:Connect(function(player, textValue)
	-- it looks for the "toonie" Part under workspace
	local toonieSign = counters.toonie.SurfaceGui.Frame:FindFirstChild("number")
	toonieSign.Text = textValue
end)

-- loonie
local loonieVal = replicatedStorage:WaitForChild("loonieVal")
loonieVal.OnServerEvent:Connect(function(player, textValue)
	-- it looks for the "loonie" Part under workspace
	local loonieSign = counters.loonie.SurfaceGui.Frame:FindFirstChild("number")
	loonieSign.Text = textValue
end)

-- cent25
local cent25Val = replicatedStorage:WaitForChild("cent25Val")
cent25Val.OnServerEvent:Connect(function(player, textValue)
	-- it looks for the "cent25" Part under workspace
	local cent25Sign = counters.cent25.SurfaceGui.Frame:FindFirstChild("number")
	cent25Sign.Text = textValue
	end)

-- cent10
local cent10Val = replicatedStorage:WaitForChild("cent10Val")
cent10Val.OnServerEvent:Connect(function(player, textValue)
	-- it looks for the "cent10" Part under workspace
	local cent10Sign = counters.cent10.SurfaceGui.Frame:FindFirstChild("number")
	cent10Sign.Text = textValue
end)

-- cent05
local cent05Val = replicatedStorage:WaitForChild("cent05Val")
cent05Val.OnServerEvent:Connect(function(player, textValue)
	-- it looks for the "cent05" Part under workspace
	local cent05Sign = counters.cent05.SurfaceGui.Frame:FindFirstChild("number")
	cent05Sign.Text = textValue
end)

-- cent01
local cent01Val = replicatedStorage:WaitForChild("cent01Val")
cent01Val.OnServerEvent:Connect(function(player, textValue)

	-- it looks for the "cent01" Part under workspace
	local cent01Sign = counters.cent01.SurfaceGui.Frame:FindFirstChild("number")
	cent01Sign.Text = textValue
end)
