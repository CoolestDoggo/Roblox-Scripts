local call

for _, t in pairs(getreg()) do
	if type(t) == 'table' and rawget(t, 'Call') then
		call = rawget(t, 'Call')
		break
	end
end

for _, t in pairs(getgc(true)) do
	if type(t) == 'table' and rawget(t, 'AssetId') then
		wait() -- if no wait then some of the maps wont show in chat
		call('NominateMap', t['AssetId'])
	end
end