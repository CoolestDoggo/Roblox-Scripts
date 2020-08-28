local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:wait()
local walkSpeed = 50
local jumpPower = 100

local properties = {
	"WalkSpeed",
	"JumpPower"
}

local function doThing(c)
	wait(.1) -- just incase the connection is not made immediately
	
	for _, property in pairs(properties) do
		for _, signal in pairs(getconnections(c.Humanoid:GetPropertyChangedSignal(property))) do
			signal:Disable()
		end
	end
	
	c.Humanoid.WalkSpeed = walkSpeed
	c.Humanoid.JumpPower = jumpPower
end

doThing(character)

player.CharacterAdded:Connect(doThing)