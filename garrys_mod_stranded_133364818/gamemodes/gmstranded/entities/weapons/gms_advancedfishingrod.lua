
AddCSLuaFile()

SWEP.Slot = 3
SWEP.SlotPos = 1

SWEP.Base = "gms_base_weapon"
SWEP.PrintName = "Advanced Fishing Rod"
SWEP.ViewModel = "models/Weapons/v_hands.mdl"
SWEP.WorldModel = "models/props_junk/harpoon002a.mdl"

SWEP.Purpose = "Used for fishing"
SWEP.Instructions = "Primary fire: Fish from the water"

SWEP.HoldType = "revolver"
SWEP.NoTraceFix = true
SWEP.HitDistance = 512
SWEP.Mask = bit.bor( MASK_WATER, MASK_SOLID )

function SWEP:PlaySwingSound()
	self:PlaySound( "npc/vort/claw_swing" .. math.random( 1, 2 ) .. ".wav" )
end

function SWEP:OnHit( tr )
	if ( CLIENT ) then return end

	if ( tr.Hit && ( tr.MatType == MAT_SLOSH || string.find( tr.HitTexture, "water" ) ) ) then
		self.Owner:DoProcess( "AdvancedFishing", 6, {
			Chance = 70
		} )
	end

end

SWEP.FixWorldModel = true
SWEP.FixWorldModelPos = Vector( 30, 2.5, -1 )
SWEP.FixWorldModelAng = Angle( 90, 0, 90 )
SWEP.FixWorldModelScale = 1
