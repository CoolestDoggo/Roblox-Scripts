local distance = 5

local mt = getrawmetatable(game)
local newindex = mt.__newindex
local camera = game:GetService("Workspace").Camera

setreadonly(mt, false)

mt.__newindex = newcclosure(function(obj, prop, val)
	if prop == "CoordinateFrame" and obj == camera then
		val += val.LookVector * -distance
	end

	return newindex(obj, prop, val)
end)

-- Make player visible

for _, part in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
	if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
		part.Transparency = 0
	end
end