#include "BuyMenu"

#include "../../custom_weapons/cso/csobaseweapon"
#include "../../custom_weapons/cso/csocommon"

// Safe subset: excludes entities that collide with the existing CS16 pack
// and the flame projectile weapons that previously conflicted with external CSO plugins.

// Melee
#include "../../custom_weapons/cso/weapon_balrog9"
#include "../../custom_weapons/cso/weapon_dragonclaw"
#include "../../custom_weapons/cso/weapon_janus9"
#include "../../custom_weapons/cso/weapon_thanatos9"
#include "../../custom_weapons/cso/weapon_dualwaki"
#include "../../custom_weapons/cso/weapon_beamsword"
#include "../../custom_weapons/cso/weapon_ripper"
#include "../../custom_weapons/cso/weapon_dualsword"

// Pistols
#include "../../custom_weapons/cso/weapon_glock18"
#include "../../custom_weapons/cso/weapon_elites"
#include "../../custom_weapons/cso/weapon_desperado"
#include "../../custom_weapons/cso/weapon_m950"
#include "../../custom_weapons/cso/weapon_skull2"
#include "../../custom_weapons/cso/weapon_bloodhunter"
#include "../../custom_weapons/cso/weapon_gunkata"
#include "../../custom_weapons/cso/weapon_m1887craft"
#include "../../custom_weapons/cso/weapon_crow1"

// Shotguns
#include "../../custom_weapons/cso/weapon_usas12"
#include "../../custom_weapons/cso/weapon_m1887"
#include "../../custom_weapons/cso/weapon_qbarrel"
#include "../../custom_weapons/cso/weapon_skull11"
#include "../../custom_weapons/cso/weapon_volcano"
#include "../../custom_weapons/cso/weapon_mk3a1"
#include "../../custom_weapons/cso/weapon_blockas"
#include "../../custom_weapons/cso/weapon_crow11"

// SMGs
#include "../../custom_weapons/cso/weapon_thompson"
#include "../../custom_weapons/cso/weapon_crow3"

// Rifles
#include "../../custom_weapons/cso/weapon_guitar"
#include "../../custom_weapons/cso/weapon_ethereal"
#include "../../custom_weapons/cso/weapon_csocrossbow"
#include "../../custom_weapons/cso/weapon_plasmagun"
#include "../../custom_weapons/cso/weapon_augex"
#include "../../custom_weapons/cso/weapon_buffak"
#include "../../custom_weapons/cso/weapon_csobow"
#include "../../custom_weapons/cso/weapon_failnaught"
#include "../../custom_weapons/cso/weapon_crow5"

// Sniper Rifles
#include "../../custom_weapons/cso/weapon_m400"
#include "../../custom_weapons/cso/weapon_svd"
#include "../../custom_weapons/cso/weapon_svdex"
#include "../../custom_weapons/cso/weapon_m95"
#include "../../custom_weapons/cso/weapon_savery"
#include "../../custom_weapons/cso/weapon_m95tiger"

// Machine Guns
#include "../../custom_weapons/cso/weapon_m134hero"
#include "../../custom_weapons/cso/weapon_m2"
#include "../../custom_weapons/cso/weapon_crow7"

// Special
#include "../../custom_weapons/cso/weapon_at4"
#include "../../custom_weapons/cso/weapon_at4ex"

const uint CSO_COST_MELEE = 20;
const uint CSO_COST_PISTOL = 35;
const uint CSO_COST_SHOTGUN = 60;
const uint CSO_COST_SMG = 55;
const uint CSO_COST_RIFLE = 75;
const uint CSO_COST_SNIPER = 90;
const uint CSO_COST_MACHINEGUN = 95;
const uint CSO_COST_SPECIAL = 110;

void AddCSOItem( const string& in szLabel, const string& in szEntityName, const uint uiCost, const string& in szCategory )
{
	g_CSOMenu.AddItem( CSOBuyMenu::BuyableItem( szLabel, szEntityName, uiCost, szCategory ) );
}

void CSOPluginInit()
{
	g_Hooks.RegisterHook( Hooks::Player::PlayerSpawn, @cso::PlayerSpawn );
}

void CSOMapInit()
{
	CSORegister();
}

void CSORegister()
{
	g_CSOMenu.RemoveItems();
	cso::ReadCSOPlayerModels();

	cso_balrog9::Register();
	cso_dragonclaw::Register();
	cso_janus9::Register();
	cso_thanatos9::Register();
	cso_dualwaki::Register();
	cso_beamsword::Register();
	cso_ripper::Register();
	cso_dualsword::Register();

	cso_glock18::Register();
	cso_elites::Register();
	cso_desperado::Register();
	cso_m950::Register();
	cso_skull2::Register();
	cso_bloodhunter::Register();
	cso_gunkata::Register();
	cso_m1887craft::Register();
	cso_crow1::Register();

	cso_usas12::Register();
	cso_m1887::Register();
	cso_qbarrel::Register();
	cso_skull11::Register();
	cso_volcano::Register();
	cso_mk3a1::Register();
	cso_blockas::Register();
	cso_crow11::Register();

	cso_thompson::Register();
	cso_crow3::Register();

	cso_guitar::Register();
	cso_ethereal::Register();
	cso_crossbow::Register();
	cso_plasmagun::Register();
	cso_augex::Register();
	cso_buffak::Register();
	cso_bow::Register();
	cso_failnaught::Register();
	cso_crow5::Register();

	cso_m400::Register();
	cso_svd::Register();
	cso_svdex::Register();
	cso_m95::Register();
	cso_savery::Register();
	cso_m95tiger::Register();

	cso_m134hero::Register();
	cso_m2::Register();
	cso_crow7::Register();

	cso_at4::Register();
	cso_at4ex::Register();

	AddCSOItem( "Balrog-IX", "weapon_balrog9", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Dragon Claw", "weapon_dragonclaw", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Janus-9", "weapon_janus9", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Thanatos-9", "weapon_thanatos9", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Dual Wakizashi", "weapon_dualwaki", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Beam Sword", "weapon_beamsword", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Ripper", "weapon_ripper", CSO_COST_MELEE, "melee" );
	AddCSOItem( "Dual Sword", "weapon_dualsword", CSO_COST_MELEE, "melee" );

	AddCSOItem( "Glock 18C", "weapon_glock18", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Dual Infinity", "weapon_elites", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Desperado", "weapon_desperado", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "M950", "weapon_m950", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Skull-2", "weapon_skull2", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Blood Hunter", "weapon_bloodhunter", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Gunkata", "weapon_gunkata", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "M1887 Craft", "weapon_m1887craft", CSO_COST_PISTOL, "pistol" );
	AddCSOItem( "Crow-1", "weapon_crow1", CSO_COST_PISTOL, "pistol" );

	AddCSOItem( "USAS-12", "weapon_usas12", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Winchester M1887", "weapon_m1887", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Quad Barrel", "weapon_qbarrel", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Skull-11", "weapon_skull11", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Volcano", "weapon_volcano", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "MK3A1", "weapon_mk3a1", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Block AS", "weapon_blockas", CSO_COST_SHOTGUN, "shotgun" );
	AddCSOItem( "Crow-11", "weapon_crow11", CSO_COST_SHOTGUN, "shotgun" );

	AddCSOItem( "Thompson", "weapon_thompson", CSO_COST_SMG, "smg" );
	AddCSOItem( "Crow-3", "weapon_crow3", CSO_COST_SMG, "smg" );

	AddCSOItem( "Guitar Gun", "weapon_guitar", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Ethereal", "weapon_ethereal", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "CSO Crossbow", "weapon_csocrossbow", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Plasma Gun", "weapon_plasmagun", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "AUG EX", "weapon_augex", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Buff AK-47", "weapon_buffak", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Compound Bow", "weapon_csobow", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Failnaught", "weapon_failnaught", CSO_COST_RIFLE, "rifle" );
	AddCSOItem( "Crow-5", "weapon_crow5", CSO_COST_RIFLE, "rifle" );

	AddCSOItem( "M400", "weapon_m400", CSO_COST_SNIPER, "sniper" );
	AddCSOItem( "SVD", "weapon_svd", CSO_COST_SNIPER, "sniper" );
	AddCSOItem( "SVD EX", "weapon_svdex", CSO_COST_SNIPER, "sniper" );
	AddCSOItem( "Barrett M95", "weapon_m95", CSO_COST_SNIPER, "sniper" );
	AddCSOItem( "Savery", "weapon_savery", CSO_COST_SNIPER, "sniper" );
	AddCSOItem( "M95 Tiger", "weapon_m95tiger", CSO_COST_SNIPER, "sniper" );

	AddCSOItem( "M134 Hero", "weapon_m134hero", CSO_COST_MACHINEGUN, "machinegun" );
	AddCSOItem( "M2 Browning", "weapon_m2", CSO_COST_MACHINEGUN, "machinegun" );
	AddCSOItem( "Crow-7", "weapon_crow7", CSO_COST_MACHINEGUN, "machinegun" );

	AddCSOItem( "AT4", "weapon_at4", CSO_COST_SPECIAL, "special" );
	AddCSOItem( "AT4EX", "weapon_at4ex", CSO_COST_SPECIAL, "special" );
}

namespace cso
{

HookReturnCode PlayerSpawn( CBasePlayer@ pPlayer )
{
	CustomKeyvalues@ pCustom = pPlayer.GetCustomKeyvalues();
	pCustom.SetKeyvalue( cso::KVN_CSO_HAS_SHIELD, 0 );

	return HOOK_CONTINUE;
}

void AddShield( CBasePlayer@ pPlayer )
{
	CustomKeyvalues@ pCustom = pPlayer.GetCustomKeyvalues();
	pCustom.SetKeyvalue( cso::KVN_CSO_HAS_SHIELD, 1 );
}

void RemoveShield( CBasePlayer@ pPlayer )
{
	CustomKeyvalues@ pCustom = pPlayer.GetCustomKeyvalues();
	pCustom.SetKeyvalue( cso::KVN_CSO_HAS_SHIELD, 0 );
}

}