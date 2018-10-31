--[[-------------------------------------------------------------------------
Default Configuration
---------------------------------------------------------------------------]]
-- Launch the game in developer mode
GM.Config.enableDeveloper = false;
GM.Config.developerESPRadius = 500;
-- Save progress on player
GM.Config.saveProgress = false;
-- Allow skipping of scenes
GM.Config.allowSkipScene = false;
-- Set walk speed
GM.Config.WalkSpeed = 200;
-- Set run speed
GM.Config.RunSpeed = 250;
-- Set crouch walk speed
GM.Config.CrouchWalkSpeed = 100;
-- Set jump power (default: 200)
GM.Config.JumpPower = 200;
-- Enable Flashlight
GM.Config.enableFlashlight = false;
-- Enable Context Menu
GM.Config.disableContextMenu = false;
-- Enable Spawn Menu
GM.Config.disableSpawnMenu = false;
-- Wheter the scoreboard can be opened or not
GM.Config.disableScoreboard = false;
-- Wheter the chatbox can be opened or not
GM.Config.disableChatBox = false;
-- Wheter the chatbox can be opened or not
GM.Config.disableDefaultHUD = true;
-- if disableDefaultHUD is true, remove following HUD elements
GM.Config.disabledHUDElements = {
	["CHudHealth"] = false,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudCrosshair"] = true,
	["CHudCloseCaption"] = true,
	["CHudDamageIndicator"] = true,
	["CHudGeiger"] = true,
	["CHudDeathNotice"] = true,
	["CHudMessage"] = true,
	["CHudPoisonDamageIndicator"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudSquadStatus"] = true,
	["CHudVehicle"] = true,
	["CHudWeapon"] = false,
	["CHudWeaponSelection"] = false,
	["CHudZoom"] = false,
};
-- Equipment that the player starts with
GM.Config.defaultEquip = {
    "weapon_physcannon",
    "gmod_tool",
};