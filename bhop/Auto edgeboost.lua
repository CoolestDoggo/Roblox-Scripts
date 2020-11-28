local scroll = false

-- Dont change anything under here unless you know what your doing

local getVelocity
local plr =  game.Players.LocalPlayer
local sqrt = math.sqrt
local last = math.huge

for _, t in pairs(getreg()) do
	if type(t) == 'table' and t.GetVelocity then
		movement = t.GetVelocity
	end
end

game:GetService('RunService').RenderStepped:Connect(function()
	local velocity = getVelocity(plr)
	local speed = sqrt(velocity.x * velocity.x + velocity.z * velocity.z)

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
