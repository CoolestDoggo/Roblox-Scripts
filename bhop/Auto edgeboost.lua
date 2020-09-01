local scroll = false

-- Dont change anything under here unless you know what your doing

local movement
local plr =  game.Players.LocalPlayer
local sqrt = math.sqrt
local last = math.huge

for _, t in pairs(getreg()) do
	if type(t) == 'table' and t.GetVelocity then
		movement = t
	end
end

local function getVel()
	return sqrt(movement.GetVelocity(plr).x ^ 2 + movement.GetVelocity(plr).z ^ 2)
end

game:GetService('RunService').RenderStepped:Connect(function()
	local speed = getVel()
	
	if speed - last > 2 then
		if scroll then
			mousescroll(10)
		else
			keypress(0x20)
			wait()
			keyrelease(0x20)
		end
	end
	
	last = speed
end)