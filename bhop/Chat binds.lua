local uis = game:GetService("UserInputService")
local player = game:GetService("Players").LocalPlayer
local binds = {}
local commands = {}
local call

for _, t in next, getreg() do
	if type(t) == "table" and t["Call"] then
		call = t["Call"]
		break
	end
end

local function checkChatting()
	local QBox = player.PlayerGui:FindFirstChild("QBox")

	if QBox then
		for _, v in next, QBox:GetDescendants() do
			if v:IsA("TextBox") and v.BackgroundColor3 == Color3.new(1, 1, 1) and v.BackgroundTransparency < 1 then
				return true
			end
		end
	end

	return false
end

-- Definitely better than looping through it like i was before
uis.InputBegan:Connect(function(input)
	if not checkChatting() and binds[input.KeyCode.Name] then
		call("Chatted", binds[input.KeyCode.Name])
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