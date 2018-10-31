Scenes = Scenes or {}
CurrentScene = CurrentScene or {}
SCHEMA = SCHEMA or {}
function SCHEMA:addScene(scene, num)
	local ta = table.Copy(scene)
	Scenes[num] = ta
end

function SCHEMA:nextScene(num)
	CurrentScene = table.Copy(Scenes[num])
	CurrentScene:OnStart()
end


Items = Items or {}
function SCHEMA:addItem(unique_name, item)
	local ta = table.Copy(item)
	Items[unique_name] = ta
end

function SCHEMA:spawnItem(item, pos)
	local item = Items[item]
	local ent = ents.Create(item.Class)
	function ent:Initialize()
 
		self:SetModel( item.Model )
		self:PhysicsInit( SOLID_VPHYSICS )      
		self:SetMoveType( MOVETYPE_VPHYSICS )   
		self:SetSolid( SOLID_VPHYSICS )
		self:SetUseType(SIMPLE_USE)        
	 	self.Item = item
	    local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
		end
	end
	ent:Spawn()
	ent:SetPos(pos)
	function ent:Use(a, c)
		self.Item:OnUse(self, a, c)
	end
	return ent
end



