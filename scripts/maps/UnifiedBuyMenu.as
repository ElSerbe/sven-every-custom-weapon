namespace UnifiedBuyMenu
{

CTextMenu@ g_pUnifiedMenu = null;

void CreateUnifiedMenu()
{
	@g_pUnifiedMenu = CTextMenu( @UnifiedMenuCallback );
	g_pUnifiedMenu.SetTitle( "Select Weapon Pack:\n" );
	g_pUnifiedMenu.AddItem( "Cry of Fear Weapons" );
	g_pUnifiedMenu.AddItem( "Counter-Strike Online Weapons" );
	g_pUnifiedMenu.AddItem( "Counter-Strike 1.6 Weapons" );
	g_pUnifiedMenu.AddItem( "Insurgency Weapons" );
	g_pUnifiedMenu.Register();
}

void ShowUnifiedMenu( CBasePlayer@ pPlayer )
{
    if( pPlayer is null )
        return;

	if( g_pUnifiedMenu is null )
		CreateUnifiedMenu();

	g_pUnifiedMenu.Open( 0, 0, pPlayer );
}

void RegisterUnifiedBuyMenu()
{
	if( g_pUnifiedMenu is null )
		CreateUnifiedMenu();

    g_Hooks.RegisterHook( Hooks::Player::ClientSay, @UnifiedClientSay );
}

void UnifiedMenuCallback( CTextMenu@ menu, CBasePlayer@ pPlayer, int iSlot, const CTextMenuItem@ pItem )
{
	if( pItem is null || pPlayer is null )
		return;

	string szChoice = pItem.m_szName;
	if( szChoice == "Cry of Fear Weapons" )
	{
		g_CoFMenu.Show( pPlayer );
	}
	else if( szChoice == "Counter-Strike Online Weapons" )
	{
		g_CSOMenu.Show( pPlayer );
	}
	else if( szChoice == "Counter-Strike 1.6 Weapons" )
	{
		g_CS16Menu.Show( pPlayer );
	}
	else if( szChoice == "Insurgency Weapons" )
	{
		g_Ins2Menu.Show( pPlayer );
	}
}

HookReturnCode UnifiedClientSay( SayParameters@ pParams )
{
    CBasePlayer@ pPlayer = pParams.GetPlayer();
    const CCommand@ args = pParams.GetArguments();

    if( args.ArgC() == 1 && (args.Arg(0).ToLowercase() == "buy" || args.Arg(0).ToLowercase() == "/buy" || args.Arg(0).ToLowercase() == "!buy" || args.Arg(0).ToLowercase() == ".buy" || args.Arg(0).ToLowercase() == "\\buy" || args.Arg(0).ToLowercase() == "#buy") )
    {
        pParams.ShouldHide = true;
		ShowUnifiedMenu( pPlayer );
		return HOOK_HANDLED;
    }

    return HOOK_CONTINUE;
}

void UnifiedBuy( const CCommand@ args )
{
	if( args.ArgC() != 1 )
		return;

	CBasePlayer@ pPlayer = g_ConCommandSystem.GetCurrentPlayer();
	ShowUnifiedMenu( pPlayer );
}

CClientCommand buy( "buy", "Opens the unified buy menu", @UnifiedBuy );

}
