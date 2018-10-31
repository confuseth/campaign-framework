AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

GM.Config = {}
AddCSLuaFile("framework/config.lua")
include("framework/config.lua")
function GM:SchemaPrint(p , msg)
	MsgC(Color(255,155,20), "[SCHEMA:"..p.."] "..msg.."\n")
end
GM:SchemaPrint("INIT" , "Initialising Schema..")

local fol = GM.FolderName .. "/gamemode/schema/"
local files, folders = file.Find(fol .. "*", "LUA")

for _, v in pairs(files) do
    if string.GetExtensionFromFilename(v) == "lua" then
        include(fol .. v)
    end
end

for _, folder in SortedPairs(folders, true) do
    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.lua", "LUA"), true) do
        AddCSLuaFile(fol .. folder .. "/" .. File)
        include(fol .. folder .. "/" .. File)
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/sv_*.lua", "LUA"), true) do
        include(fol .. folder .. "/" .. File)
    end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/cl_*.lua", "LUA"), true) do
        AddCSLuaFile(fol .. folder .. "/" .. File)
    end
end
