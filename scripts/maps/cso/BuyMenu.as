CSOBuyMenu::BuyMenu g_CSOMenu;

namespace CSOBuyMenu
{

final class BuyableItem
{
	private string m_szDescription;
	private string m_szEntityName;
	private string m_szCategory;
	private uint m_uiCost = 0;

	string Description
	{
		get const { return m_szDescription; }
	}

	string EntityName
	{
		get const { return m_szEntityName; }
	}

	string Category
	{
		get const { return m_szCategory; }
	}

	uint Cost
	{
		get const { return m_uiCost; }
	}

	BuyableItem( const string& in szDescription, const string& in szEntityName, const uint uiCost, const string& in szCategory )
	{
		m_szDescription = "$" + string( uiCost ) + " " + szDescription;
		m_szEntityName = szEntityName;
		m_uiCost = uiCost;
		m_szCategory = szCategory;
	}

	void Buy( CBasePlayer@ pPlayer = null ) const
	{
		if( pPlayer is null )
			return;

		if( pPlayer.HasNamedPlayerItem( m_szEntityName ) !is null )
		{
			g_PlayerFuncs.ClientPrint( pPlayer, HUD_PRINTTALK, "You already have that item!\n" );
			return;
		}

		const uint uiMoney = uint( pPlayer.pev.frags );
		if( uiMoney < m_uiCost )
		{
			g_PlayerFuncs.ClientPrint( pPlayer, HUD_PRINTTALK, "Not enough money (frags) - Cost: $" + m_uiCost + "\n" );
			return;
		}

		pPlayer.pev.frags -= m_uiCost;
		pPlayer.GiveNamedItem( m_szEntityName );
		pPlayer.SelectItem( m_szEntityName );
	}
}

final class BuyMenu
{
	array<BuyableItem@> m_Items;

	private CTextMenu@ m_pMenu = null;
	private CTextMenu@ m_pMeleeMenu = null;
	private CTextMenu@ m_pPistolMenu = null;
	private CTextMenu@ m_pShotgunMenu = null;
	private CTextMenu@ m_pSmgMenu = null;
	private CTextMenu@ m_pRifleMenu = null;
	private CTextMenu@ m_pSniperMenu = null;
	private CTextMenu@ m_pMachineGunMenu = null;
	private CTextMenu@ m_pSpecialMenu = null;

	void RemoveItems()
	{
		if( m_Items !is null )
			m_Items.removeRange( 0, m_Items.length() );

		@m_pMenu = null;
	}

	void AddItem( BuyableItem@ pItem )
	{
		if( pItem is null )
			return;

		if( m_Items.findByRef( @pItem ) != -1 )
			return;

		m_Items.insertLast( pItem );
		@m_pMenu = null;
	}

	void Show( CBasePlayer@ pPlayer = null )
	{
		if( m_pMenu is null )
			CreateMenu();

		if( pPlayer !is null )
			m_pMenu.Open( 0, 0, pPlayer );
	}

	private void CreateMenu()
	{
		@m_pMenu = CTextMenu( TextMenuPlayerSlotCallback( this.MainCallback ) );
		m_pMenu.SetTitle( "Counter-Strike Online:\n" );
		m_pMenu.AddItem( "Melee" );
		m_pMenu.AddItem( "Pistols" );
		m_pMenu.AddItem( "Shotguns" );
		m_pMenu.AddItem( "SMGs" );
		m_pMenu.AddItem( "Rifles" );
		m_pMenu.AddItem( "Sniper Rifles" );
		m_pMenu.AddItem( "Machine Guns" );
		m_pMenu.AddItem( "Special" );
		m_pMenu.Register();

		@m_pMeleeMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pMeleeMenu.SetTitle( "CSO Melee:\n" );
		@m_pPistolMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pPistolMenu.SetTitle( "CSO Pistols:\n" );
		@m_pShotgunMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pShotgunMenu.SetTitle( "CSO Shotguns:\n" );
		@m_pSmgMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pSmgMenu.SetTitle( "CSO SMGs:\n" );
		@m_pRifleMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pRifleMenu.SetTitle( "CSO Rifles:\n" );
		@m_pSniperMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pSniperMenu.SetTitle( "CSO Sniper Rifles:\n" );
		@m_pMachineGunMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pMachineGunMenu.SetTitle( "CSO Machine Guns:\n" );
		@m_pSpecialMenu = CTextMenu( TextMenuPlayerSlotCallback( this.WeaponCallback ) );
		m_pSpecialMenu.SetTitle( "CSO Special:\n" );

		for( uint i = 0; i < m_Items.length(); ++i )
		{
			BuyableItem@ pItem = m_Items[i];
			if( pItem.Category == "melee" )
				m_pMeleeMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "pistol" )
				m_pPistolMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "shotgun" )
				m_pShotgunMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "smg" )
				m_pSmgMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "rifle" )
				m_pRifleMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "sniper" )
				m_pSniperMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "machinegun" )
				m_pMachineGunMenu.AddItem( pItem.Description, any( @pItem ) );
			else if( pItem.Category == "special" )
				m_pSpecialMenu.AddItem( pItem.Description, any( @pItem ) );
		}

		m_pMeleeMenu.Register();
		m_pPistolMenu.Register();
		m_pShotgunMenu.Register();
		m_pSmgMenu.Register();
		m_pRifleMenu.Register();
		m_pSniperMenu.Register();
		m_pMachineGunMenu.Register();
		m_pSpecialMenu.Register();
	}

	private void MainCallback( CTextMenu@ menu, CBasePlayer@ pPlayer, int iSlot, const CTextMenuItem@ pItem )
	{
		if( pItem is null || pPlayer is null )
			return;

		string szChoice = pItem.m_szName;
		if( szChoice == "Melee" )
			m_pMeleeMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Pistols" )
			m_pPistolMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Shotguns" )
			m_pShotgunMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "SMGs" )
			m_pSmgMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Rifles" )
			m_pRifleMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Sniper Rifles" )
			m_pSniperMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Machine Guns" )
			m_pMachineGunMenu.Open( 0, 0, pPlayer );
		else if( szChoice == "Special" )
			m_pSpecialMenu.Open( 0, 0, pPlayer );
	}

	private void WeaponCallback( CTextMenu@ menu, CBasePlayer@ pPlayer, int iSlot, const CTextMenuItem@ pItem )
	{
		if( pItem is null || pPlayer is null )
			return;

		BuyableItem@ pBuyItem = null;
		pItem.m_pUserData.retrieve( @pBuyItem );

		if( pBuyItem !is null )
		{
			pBuyItem.Buy( pPlayer );
			menu.Open( 0, 0, pPlayer );
		}
	}
}

}