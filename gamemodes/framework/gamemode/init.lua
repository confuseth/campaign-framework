AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

GM.Config = GM.Config or {}

AddCSLuaFile("framework/config.lua")
include("framework/config.lua")

AddCSLuaFile("framework/scenes.lua")
include("framework/scenes.lua")

AddCSLuaFile("framework/core.lua")
include("framework/core.lua")

local fol = GM.FolderName .. "/gamemode/modules/"
local files, folders = file.Find(fol .. "*", "LUA")

for _, v in pairs(files) do
    if string.GetExtensionFromFilename(v) == "lua" then
        include(fol .. v)
    end
end

for _, folder in SortedPairs(folders, true) do
    for _, File in SortedPairs(file.Find(fol .. folder .. "/sh_*.LUA", "LUA"), true) do
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
