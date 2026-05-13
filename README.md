# sven-every-custom-weapon
Joining every custom weapons pack I've found on the internet. Feel free to post suggestions of other weapons I haven't seen yet

## Dedicated Server Plugin

This repository now includes a unified Sven Co-op plugin entrypoint at `scripts/plugins/sven_every_custom_weapon.as`.

Place this inside `default_plugins.txt`:

```txt
	"plugin"
	{
		"name" "sven_every_custom_weapon"
		"script" "sven_every_custom_weapon"
		"adminlevel" "ADMIN_NO"
	}
```

`ADMIN_NO` is important here so the `ClientSay` hook can react to `!buy` for normal players too.

After adding or reloading the plugin, change map or restart the server once so `MapInit()` runs and the three shop lists are populated.

If your server uses a different plugin list format, the script name you need to reference is still `sven_every_custom_weapon`.

Load that plugin from your server plugin list and the pack will register all three weapon sets together:

- Cry of Fear
- Counter-Strike 1.6
- Insurgency

When a player writes `!buy` in chat, the plugin opens a category selector first, then forwards the player to the corresponding weapon shop.

## Thanks

Special thanks to KernCore, original author and maintainer of these custom weapon packs, and to the original games that inspired each set of weapons:

- Cry of Fear
- Counter-Strike 1.6
- Insurgency
