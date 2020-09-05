local call

local function find(name)
	return game.Workspace:FindFirstChild(name, true)
end

for _, t in pairs(getreg()) do
	if type(t) == 'table' and t['Call'] then
		call = t['Call']
		break
	end
end

call('LeaveZone', find('MapFinish'), tick())
call('EnterZone', find('MapStart'), tick())
call('LeaveZone', find('MapStart'), tick())
call('EnterZone', find('MapFinish'), tick()+69.696)