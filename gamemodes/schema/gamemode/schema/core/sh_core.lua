function GM:InitPostEntity()
    CurrentScene = table.Copy(Scenes[0])
    CurrentScene:OnStart();
end

function GM:Think()
    if IsValid(Entity(1)) then
        CurrentScene:ToFinish();
    end
end
