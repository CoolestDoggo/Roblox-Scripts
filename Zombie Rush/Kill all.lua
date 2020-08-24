local player = game:GetService("Players").LocalPlayer

while wait(.1) do
	spawn(function()
		for i,v in pairs(game:GetService("Workspace")['Zombie Storage']:GetChildren()) do
			local character = player.Character or player.CharacterAdded:wait()
			local gunController = character:FindFirstChild('GunController', true)
			local weapon = (gunController and gunController.Parent) or false

			if weapon and v:FindFirstChild('Humanoid') then
				weapon.GunController.RemoteFunction:InvokeServer({['Name'] = weapon.Name, ['HumanoidTables'] = {{['HeadHits'] = 1, ['THumanoid'] = v.Humanoid, ['BodyHits'] = 0}}})
			end
		end
	end)
end