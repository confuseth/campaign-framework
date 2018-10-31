local function MasterMind()
    if GAMEMODE.Config.enableDeveloper then
        for k, v in pairs(ents.GetAll()) do
            if v:GetClass() == "func_door" then
                v:Fire("color", "255 0 255", 0)
            end

            if v:GetClass() == "prop_dynamic" then
                v:Fire("color", "255 0 255", 0)
            end

            if v:GetClass() == "prop_door_rotating" then
                v:Fire("color", "255 0 255", 0)
            end
        end
    end
end

hook.Add("Think", "MasterMind", MasterMind)
util.AddNetworkString("ITEM_SPAWN")

local function MMSpawnItem(l, p)
    local s = net.ReadString()
    SCHEMA:spawnItem(s, p:GetEyeTrace().HitPos + Vector(0, 0, 10))
end

net.Receive("ITEM_SPAWN", MMSpawnItem)