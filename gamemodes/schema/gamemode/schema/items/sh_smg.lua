local ITEM = {}
ITEM.Name = "SMG"
ITEM.Description = "A very cool gun."
ITEM.Class = "weapon_smg1"
ITEM.Model = "models/weapons/w_smg1.mdl"

function ITEM:OnUse(entity, activator, caller)
	-- if ( activator:IsPlayer() ) then
	-- 	if ( entity:IsPlayerHolding() ) then return end
		
	-- 	activator:PickupObject( entity )
	-- end
	entity.Used = true
	entity:Remove()

end

SCHEMA:addItem( "item_smg" , ITEM )