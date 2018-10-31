local function MasterMindHud()

	if GAMEMODE.Config.enableDeveloper then

		local radius = GAMEMODE.Config.developerESPRadius

	    for k, v in pairs(ents.FindInSphere( LocalPlayer():GetPos(), radius)) do

	            if (v:GetClass() == "class C_BaseEntity") then
	                local position = v:LocalToWorld(v:OBBCenter()):ToScreen()
	                local x, y = position.x, position.y
	                draw.TextShadow({
						text = v:GetClass() .. " ["..v:EntIndex().."]",
						font = "Trebuchet18",
						pos = { x, y },
						color = Color(255,155,20),
						xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_CENTER
					}, 1, 255)
	            end
	            

	            if (v:GetClass() == "func_button") then
	                local position = v:LocalToWorld(v:OBBCenter()):ToScreen()
	                local x, y = position.x, position.y
	                draw.TextShadow({
						text = v:GetClass() .. " ["..v:EntIndex().."]",
						font = "Trebuchet18",
						pos = { x, y },
						color = Color(155,155,255),
						xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_CENTER
					}, 1, 255)
	            end

	            if (v:GetClass() == "prop_dynamic") then
	                local position = v:LocalToWorld(v:OBBCenter()):ToScreen()
	                local x, y = position.x, position.y
	                draw.TextShadow({
						text = v:GetClass() .. " ["..v:EntIndex().."]",
						font = "Trebuchet18",
						pos = { x, y - 25 },
						color = Color(255,0,255, 100),
						xalign = TEXT_ALIGN_CENTER,
						yalign = TEXT_ALIGN_CENTER
					}, 1, 255)
	            end

	    end
	
	end

end

hook.Add("HUDPaint", "MasterMindHud", MasterMindHud)