function GM:PlayerLoadout(ply)
	ply:SetWalkSpeed(GAMEMODE.Config.WalkSpeed)
	ply:SetRunSpeed(GAMEMODE.Config.RunSpeed)
	ply:SetCrouchedWalkSpeed(GAMEMODE.Config.CrouchWalkSpeed)
	ply:SetJumpPower(GAMEMODE.Config.JumpPower)
	ply:AllowFlashlight(GAMEMODE.Config.enableFlashlight)
	ply:StripAmmo()
	ply:StripWeapons()
	for k, v in pairs(GAMEMODE.Config.defaultEquip) do
		ply:Give(v)
	end

	if GAMEMODE.Config.enableDeveloper then
		ply:Give("dev_tool")
		ply:SelectWeapon("dev_tool")
	end

end

if CLIENT then
	function GM:AddNotify(str, type, length)

	end

	function AddLegacy(text, type, length)

	end

	if GM.Config.disableContextMenu then
		function GM:ContextMenuOpen()

		end
	end

	if GM.Config.disableSpawnMenu then
		function GM:SpawnMenuOpen()

		end
	end

	
	if GM.Config.disableScoreboard then
		function GM:ScoreboardShow()

		end
		function GM:ScoreboardHide()

		end
	end

	if GM.Config.disableChatBox then
		hook.Add("HUDShouldDraw", "disableChatBox", function(n)
			if n == "CHudChat" then
				return !GM.Config.disableChatBox
			end
		end)
	end

	if GM.Config.disableDefaultHUD then
		hook.Add( "HUDShouldDraw", "disableDefaultHUD", function(n)
			if GAMEMODE.Config.disabledHUDElements[n] then return false end
		end)
	end
end