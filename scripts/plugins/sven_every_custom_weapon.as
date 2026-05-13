#include "../maps/cof/cofregister"
#include "../maps/cso/cso_register"
#include "../maps/cs16/cs16_register"
#include "../maps/ins2/ins2_register"
#include "../maps/UnifiedBuyMenu"

void PluginInit()
{
	g_Module.ScriptInfo.SetAuthor( "ElSerbe/KernCore contributors" );
	g_Module.ScriptInfo.SetContactInfo( "https://github.com/ElSerbe/sven-every-custom-weapon" );

	CoFPluginInit();
	CSOPluginInit();
	CS16PluginInit();
	INS2PluginInit();
	g_Game.AlertMessage( at_console, "[sven_every_custom_weapon] PluginInit loaded\n" );
}

void MapInit()
{
	CoFMapInit();
	CSOMapInit();
	CS16MapInit();
	INS2MapInit();
	UnifiedBuyMenu::RegisterUnifiedBuyMenu();
	g_Game.AlertMessage( at_console, "[sven_every_custom_weapon] MapInit ready\n" );
}
