hook.Add("PlayerSpawn", "Stuff", function(ply) 
	print(ply:Name() .." just spawned")
end)