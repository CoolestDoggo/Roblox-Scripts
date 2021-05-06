local battleClick = game:GetService("ReplicatedStorage").RemoteEvents.BattleEvents.BattleClick
local player = game:GetService("Players").LocalPlayer

while wait(.1) do
	local playerFolder = game:GetService("ReplicatedStorage").PlayerFolder:FindFirstChild(player.Name)
	local curBattle = playerFolder and playerFolder:FindFirstChild("CurrentBattle")
	
	if curBattle then
		for _, enemy in next, curBattle:GetChildren() do
			if enemy.Name:find("Enemy") and enemy.Health.Value > 0 then
				battleClick:InvokeServer(enemy)
			end
		end
	end
end