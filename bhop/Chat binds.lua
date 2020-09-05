local uis = game:GetService("UserInputService")
local binds = {}
local commands = {}
local call

for _, t in pairs(getreg()) do
	if type(t) == "table" and t["Call"] then
		call = t["Call"]
		break
	end
end

uis.InputBegan:Connect(function(input)
	for key, text in pairs(binds) do
		if input.KeyCode.Name == key then
			call("Chatted", text)
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