local uis = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local binds = {}
local commands = {}
local call

for _, t in pairs(getreg()) do
	if type(t) == "table" and t["Call"] then
		call = t["Call"]
		break
	end
end

local function checkChatting()
	local QBox = player.PlayerGui:FindFirstChild("QBox")

	if QBox then
		for _, v in pairs(QBox:GetDescendants()) do
			if v:IsA("TextBox") and v.BackgroundColor3 == Color3.new(1, 1, 1) and v.BackgroundTransparency < 1 then
				return true
			end
		end
	end

	return false
end


uis.InputBegan:Connect(function(input)
	if not checkChatting() then
		for key, text in pairs(binds) do
			if input.KeyCode.Name == key then
				call("Chatted", text)
			end
		end
	end
end)

function commands:add(key, text)
	if not binds[key] then
		binds[key] = text
	end
end

function commands:replace(key, text)
	if binds[key] then
		binds[key] = text
	end
end

function commands:remove(key)
	binds[key] = nil
end

return commands