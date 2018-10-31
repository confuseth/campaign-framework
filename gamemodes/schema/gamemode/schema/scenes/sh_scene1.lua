local SCENE = {}
SCENE.Name = "Scene 1"
SCENE.Description = "Testing scenes"

local key

function SCENE:OnStart()

	key = SCHEMA:spawnItem( "item_pot", Vector(-4495.8486328125, -184.6710357666, 2.03125))

end

function SCENE:ToFinish()
	
	if key.Used then 
		SCHEMA:nextScene(2)
	end

end


SCHEMA:addScene(SCENE, 1)