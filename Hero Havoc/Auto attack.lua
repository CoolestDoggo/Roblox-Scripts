local battleClick = game:GetService("ReplicatedStorage").RemoteEvents.BattleEvents.BattleClick
local player = game:GetService("Players").LocalPlayer

while wait(.1) do
	local playerFolder = game:GetService("ReplicatedStorage").PlayerFolder:FindFirstChild(player.Name)
	local curBattle = playerFolder and playerFolder:FindFirstChild("CurrentBattle")
	
	if curBattle then
		for i,v in pairs(curBattle:GetChildren()) do
			if v.Name:find("Enemy") and v.Health.Value > 0 then
				battleClick:InvokeServer(v)
			end
		end
	end
end