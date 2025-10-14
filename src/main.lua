---@meta _
mozzarellathicc_RerollHammers = mozzarellathicc_RerollHammers or {}

---@diagnostic disable-next-line: undefined-global
local mods = rom.mods

---@module 'SGG_Modding-ENVY-auto'
mods['SGG_Modding-ENVY'].auto()

---@diagnostic disable: lowercase-global

---@diagnostic disable-next-line: undefined-global
rom = rom
---@diagnostic disable-next-line: undefined-global
_PLUGIN = _PLUGIN

---@module 'game'
game = rom.game

---@module 'game-import'
import_as_fallback(game)

---@module 'SGG_Modding-SJSON'
sjson = mods['SGG_Modding-SJSON']
---@module 'SGG_Modding-ModUtil'
modutil = mods['SGG_Modding-ModUtil']

---@module 'SGG_Modding-Chalk'
chalk = mods["SGG_Modding-Chalk"]
---@module 'SGG_Modding-ReLoad'
reload = mods['SGG_Modding-ReLoad']

---@module 'config'
config = chalk.auto 'config.lua'
public.config = config

local function on_ready()
	if config.enabled == false then return end
	
	import 'Scripts/MetaUpgradeData.lua'
end

local function on_reload()
	if config.enabled == false then return end
end

local loader = reload.auto_single()

modutil.once_loaded.game(function()
	loader.load(on_ready, on_reload)
end)
