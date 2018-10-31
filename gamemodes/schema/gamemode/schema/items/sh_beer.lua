local ITEM = {}
ITEM.Name = "Beer"
ITEM.Description = "This sum beer."
ITEM.Class = "item_base"
ITEM.Model = "models/props_junk/garbage_glassbottle003a.mdl"

function ITEM:OnUse(entity, activator, caller)
	-- if ( activator:IsPlayer() ) then
	-- 	if ( entity:IsPlayerHolding() ) then return end
		
	-- 	activator:PickupObject( entity )
	-- end
	entity:Remove()

end

SCHEMA:addItem( "item_beer" , ITEM )