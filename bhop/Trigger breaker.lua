for _,t in pairs(getgc(true)) do 
	if type(t) == 'table' and t['data'] and t['data']['Trigger'] then
		t.data.Trigger = ''
	end
end