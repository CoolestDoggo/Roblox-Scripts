while wait(.1) do
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"GainMuscle"})
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer({"SellMuscle"})
end