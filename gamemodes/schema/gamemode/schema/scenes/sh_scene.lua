local SCENE = {}
SCENE.Name = "Scene Start"
SCENE.Description = "Testing scenes"

local gate = {
	entid = 199,
	class = "func_rot_button"
}

function SCENE:OnStart()

end

function SCENE:ToFinish()
 	if SERVER then
 		SCHEMA:nextScene(1)
 	end
end

SCHEMA:addScene(SCENE, 0)