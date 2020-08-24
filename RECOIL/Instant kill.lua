local env = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Shockwave)
local dialog = env.Dialog
local callServer = debug.getupvalue(dialog, 2)
local hook

hook = hookfunction(callServer, function(...)
	local t = {...}
   
	if t[1] == "YWHY" then
		for i = 1, 100 do
			pcall(hook, ...)
		end
	else
		return hook(...)
	end
end)