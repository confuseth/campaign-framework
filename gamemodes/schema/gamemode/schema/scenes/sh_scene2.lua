local SCENE = {}
SCENE.Name = "Scene 2"
SCENE.Description = "Testing scenes"

local gates = {
	main_gate = {
		entid = 199,
		class = "func_rot_button"
	},
	dual_gate = {
		entid = 216,
		class = "func_button"
	}
}

function SCENE:OnStart()
	if SERVER then

		Entity(gates.main_gate.entid):Fire("Press")

		timer.Create("gates_dual_gate", 1, 0, function()
			for k, v in pairs( ents.FindInSphere(Vector(-4491, -373, 2),25) ) do
				if v:IsPlayer() then
					Entity(gates.dual_gate.entid):Fire("Press")
					timer.Remove("gates_dual_gate")
				end
			end
		end)

	end
end

function SCENE:ToFinish()
	
end

SCHEMA:addScene(SCENE, 2)