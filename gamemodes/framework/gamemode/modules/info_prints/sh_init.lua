function GM:FrameworkPrint(p , msg)
	if SERVER then
		MsgC(Color(255,200,10), "[FRAMEWORK:"..p.."] "..msg.."\n")
	end
end