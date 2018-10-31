local fol = GM.FolderName .. "/gamemode/modules/"
local files, folders = file.Find(fol .. "*", "LUA")
local modules = modules or {}

GM:SchemaPrint("CORE" , "Loading Modules..")

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


GM:SchemaPrint("CORE" , "Modules loaded.")
GM:SchemaPrint("INIT" , "Schema ".. [["]] .. GM.Name .. [["]] .. " loaded.")

