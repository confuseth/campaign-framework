include( "shared.lua" )
GM.Config = {}
include("framework/config.lua")

local root = GM.FolderName .. "/gamemode/schema/"
local _, folders = file.Find(root .. "*", "LUA")
for _, folder in SortedPairs(folders, true) do
    for _, File in SortedPairs(file.Find(root .. folder .. "/sh_*.lua", "LUA"), true) do
        include(root .. folder .. "/" .. File)
    end
    for _, File in SortedPairs(file.Find(root .. folder .. "/cl_*.lua", "LUA"), true) do
        include(root .. folder .. "/" .. File)
    end
end


