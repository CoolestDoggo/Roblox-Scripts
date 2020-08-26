local function fire(...)
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({...})
end

while wait(.1) do
    fire("GainMuscle")
    fire("SellMuscle")
end