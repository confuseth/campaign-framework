SWEP.Instructions	= "Use by aiming at an entity\nReload to open the menu\nLeft click to get vector of HitPos\nRight click to get info of HitEntity"

SWEP.Spawnable			= true
SWEP.AdminOnly			= true
SWEP.UseHands			= true

SWEP.ViewModel			= "models/weapons/c_pistol.mdl"
SWEP.WorldModel			= "models/weapons/w_pistol.mdl"

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.PrintName			= "Developer-Mode Gun"
SWEP.Slot				= 3
SWEP.SlotPos			= 1
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true
SWEP.UseHands			= true

--local ShootSound = Sound( "Metal.SawbladeStick" )
local selectMat = Material("gui/pos.png")
function SWEP:DrawHUD()
	surface.SetDrawColor( 255, 255, 255, 100 )
	surface.DrawRect( ScrW()/2-2, ScrH()/2-2, 4, 4 )
	if self.trEntity and IsValid(self.trEntity) then
		local position = self.trEntity:LocalToWorld(self.trEntity:OBBCenter()):ToScreen()
		local x, y = position.x, position.y
		draw.TextShadow({
			text = "Selected: "..self.trEntity:GetClass() .. " ["..self.trEntity:EntIndex().."]",
			font = "Trebuchet18",
			pos = { x, y + 45},
			color = Color(155,155,255),
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER
		}, 1, 255)
	end

	if self.selectPos then
		local position = self.selectPos:ToScreen()
		local x, y = position.x, position.y
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetMaterial(selectMat)
		surface.DrawTexturedRect( x - 16, y - 16, 32, 32 )
	end
end

function SWEP:Reload()
	if self.ReloadingTime and CurTime() <= self.ReloadingTime then return end
	if CLIENT then
		local devgui = {}
		devgui.f = vgui.Create("DFrame")
		devgui.f:SetPos(300, ScrH() / 2 - 150)
		devgui.f:SetSize(300, 300)
		devgui.f:SetTitle("")
		devgui.f:MakePopup()
		devgui.f.OnClose = function()
			for k, v in pairs(devgui) do
				v:Remove()
			end
		end

		local b = vgui.Create("DButton", devgui.f)
		b:Dock(TOP)
		b:DockMargin(10, 5, 10, 10)
		b:SetText("Clear Selections")
		b.DoClick = function() self.selectPos = nil self.trEntity = nil end

		local a = vgui.Create("DButton", devgui.f)
		a:Dock(TOP)
		a:DockMargin(10, 5, 10, 10)
		a:SetText("Item List")
		a.DoClick = function() 
			if !it then
				devgui.it = vgui.Create("DFrame")
				devgui.it:SetPos(ScrW() / 2 + 150, ScrH() / 2 - 150)
				devgui.it:SetSize(ScrW()/2 - 300, 300)
				devgui.it:SetTitle("")
				devgui.it:MakePopup()
				devgui.it.OnClose = function()  end

				local sc = vgui.Create( "DScrollPanel", devgui.it )
				sc:Dock(FILL)

				local ls = vgui.Create( "DIconLayout", sc )
				ls:Dock( FILL )
				ls:SetSpaceY( 5 )
				ls:SetSpaceX( 5 )

				for k, v in pairs(Items) do
					local item = ls:Add( "DPanel" )
					item:SetSize( devgui.it:GetWide()/4 - 12, 120 )

					local md = vgui.Create("DModelPanel", item)
					md:SetSize(60, 60)
					md:SetText("")
					md:Dock(FILL)
					md:DockMargin(0,0,0,0)
					md:SetModel( v.Model )
					local mn, mx = md.Entity:GetRenderBounds()
					local size = 0
					size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
					size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
					size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

					md:SetFOV( 35 )
					md:SetCamPos( Vector( size, size, size ) )
					md:SetLookAt( ( mn + mx ) * 0.5 )
					function md:LayoutEntity( ent ) return end
					local es = vgui.Create( "DButton", item )
					es:Dock(FILL)
					es:SetText("")
					es.Col = Color(255,255,255)
					local l = 255
					es.Paint = function(s, w, h)
						if s:IsHovered() then
							l = Lerp(0.1, l, 255)
							es.Col = Color(255,255,255, l)
						else
							l = Lerp(0.1, l, 0)
							es.Col = Color(255,255,255, l)
						end
						draw.RoundedBox(0,0,0,w,h, s.Col)
					end

					es.DoClick = function()
						net.Start("ITEM_SPAWN")
						net.WriteString(tostring(k))
						net.SendToServer()
					end

					local bt = vgui.Create("DLabel", item)
					bt:SetPos(2,2)
					bt:SetTextColor(Color(100,100,100))
					bt:SetText( "Name: " .. v.Name)
					bt:SizeToContents()

					local bt1 = vgui.Create("DLabel", item)
					bt1:SetPos(2,bt:GetTall() + 2)
					bt1:SetTextColor(Color(100,100,100))
					bt1:SetText( "Item: " .. tostring(k))
					bt1:SizeToContents()

					local bt2 = vgui.Create("DLabel", item)
					bt2:SetPos(2,bt1:GetTall() * 2 + 2)
					bt2:SetTextColor(Color(100,100,100))
					bt2:SetText( "EntClass: " .. v.Class)
					bt2:SizeToContents()

					local bt3 = vgui.Create("DLabel", item)
					bt3:SetPos(2,bt1:GetTall() * 3 + 2)
					bt3:SetTextColor(Color(100,100,100))
					bt3:SetText( "Desc: " .. v.Description)
					bt3:SizeToContents()
				end
			end
		end

		local s = vgui.Create("DNumSlider", devgui.f)
		s:Dock(TOP)
		s:DockMargin(10, 5, 0, 10)
		s:SetMin( 0 )
		s:SetMax( 1000000 )
		s:SetDecimals( 0 )
		s:SetText("ESP RADIUS")
		s:SetValue(GAMEMODE.Config.developerESPRadius)
		s.OnValueChanged = function(value) GAMEMODE.Config.developerESPRadius = s:GetValue() end
		s.PerformLayout = function() end
		s.Label:SetWide(60)

		local sa = vgui.Create("DButton", devgui.f)
		sa:Dock(TOP)
		sa:DockMargin(10, 5, 10, 10)
		sa:SetText("Reset ESP Radius")
		sa.DoClick = function() s:SetValue(500) end

	end
	self.ReloadingTime = CurTime() + 1
end

function SWEP:PrimaryAttack()
	local tr = self.Owner:GetEyeTrace()
	self.selectPos = tr.HitPos
	GAMEMODE:FrameworkPrint("DEV" , "Marked:" .. " Vector(" .. self.selectPos.x .. ", " .. self.selectPos.y .. ", " .. self.selectPos.z .. ")")
	self:SetNextPrimaryFire(1)
end

function SWEP:SecondaryAttack()
	local tr = self.Owner:GetEyeTrace()
	if ( tr.HitWorld ) then return end
	self.trEntity = tr.Entity
	GAMEMODE:FrameworkPrint("DEV" , "["..self.trEntity:EntIndex().. "][" .. self.trEntity:GetClass() .. "] Vector(" .. self.trEntity:GetPos().x .. ", " .. self.trEntity:GetPos().y .. ", " .. self.trEntity:GetPos().z .. ") 	Angle(" .. tostring(self.trEntity:GetAngles())..")")
	self:SetNextSecondaryFire(1)
end

function SWEP:ShouldDropOnDie()
	return false
end
