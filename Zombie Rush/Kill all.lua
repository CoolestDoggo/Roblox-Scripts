local player = game.Players.LocalPlayer

while wait(.1) do
    spawn(function()
        for i,v in pairs(game.Workspace['Zombie Storage']:GetChildren()) do
            local gunController = player.Character:FindFirstChild('GunController', true)
            local weapon = (gunController and gunController.Parent) or nil

            if weapon and v:FindFirstChild('Humanoid') then
                local humanoid = v.Humanoid
                weapon.GunController.RemoteFunction:InvokeServer({['Name'] = weapon.Name, ['HumanoidTables'] = {{['HeadHits'] = 1, ['THumanoid'] = humanoid, ['BodyHits'] = 0}}})
            end
        end
    end)
end