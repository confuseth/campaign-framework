local ITEM = {}
ITEM.Name = "Breen Statue"
ITEM.Description = "Hail combine."
ITEM.Class = "item_base"
ITEM.Model = "models/props_combine/breenbust.mdl"

function ITEM:OnUse(entity, activator, caller)
	if ( activator:IsPlayer() ) then
		if ( entity:IsPlayerHolding() ) then return end
		
	 	activator:PickupObject( entity )
	end

end

SCHEMA:addItem( "item_prop" , ITEM )