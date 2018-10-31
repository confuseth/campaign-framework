local ITEM = {}
ITEM.Name = "Pot"
ITEM.Description = "This is a basic item."
ITEM.Class = "item_base"
ITEM.Model = "models/props_interiors/pot02a.mdl"

function ITEM:OnUse(entity, activator, caller)
	-- if ( activator:IsPlayer() ) then
	-- 	if ( entity:IsPlayerHolding() ) then return end
		
	-- 	activator:PickupObject( entity )
	-- end
	entity.Used = true
	entity:Remove()

end

SCHEMA:addItem( "item_pot" , ITEM )