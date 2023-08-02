--[[
Dota PvP game mode
]]

print( "Dota PvP game mode loaded." )

if DotaUYBB == nil then
	DotaUYBB = class({})
end

require("timers")
require("physics")
--require( 'spell_shop_UI' )
--require( 'util' )
--------------------------------------------------------------------------------
-- ACTIVATE
--------------------------------------------------------------------------------
function Activate()
    GameRules.DotaUYBB = DotaUYBB()
    GameRules.DotaUYBB:InitGameMode()
end

function Precache( context )
	--[[
		This function is used to precache resources/units/items/abilities that will be needed
		for sure in your game and that cannot or should not be precached asynchronously or 
		after the game loads.

		See GameMode:PostLoadPrecache() in barebones.lua for more information
		]]

		-- Precache models
		PrecacheResource( "model", v, context )
		
		print("[UYBB] Performing pre-load precache")

		-- Particles can be precached individually or by folder
		-- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
		PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
		PrecacheResource("particle", "particles/items_fx/item_sheepstick.vpcf", context)
		PrecacheResource("particle", "particles/generic_gameplay/generic_stunned.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_nyx_assassin/nyx_assassin_spiked_carapace_hit.vpcf", context)
		PrecacheResource("particle", "particles/status_fx/status_effect_beserkers_call.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_axe/axe_beserkers_call_owner.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_centaur/centaur_stampede_overhead.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_centaur/centaur_stampede.vpcf", context)
		PrecacheResource("particle", "particles/items2_fx/smoke_of_deceit.vpcf", context)
		PrecacheResource("particle", "particles/units/heroes/hero_witchdoctor/witchdoctor_voodoo_restoration.vpcf", context)
		PrecacheResource("particle",  "particles/items2_fx/smoke_of_deceit.vpcf", context)
		PrecacheResource("particle_folder", "particles/test_particle", context)

		-- Models can also be precached by folder or individually
		-- PrecacheModel should generally used over PrecacheResource for individual models
		--PrecacheResource("model", "particles/heroes/sand_king/sand_king.vmdl", context)
		PrecacheModel("models/heroes/viper/viper.vmdl", context)
		PrecacheModel("models/heroes/phoenix/phoenix_bird.vmdl", context)
		PrecacheModel("models/hero/nian/nian_hero.vmdl", context)
		PrecacheModel("models/hero/nian_dire/nian_hero_dire.vmdl", context)
		--PrecacheModel("models/creeps/nian/nian.vmdl", context)
		--PrecacheModel("models/creeps/nian/nian_horn.vmdl", context)
		--PrecacheModel("models/creeps/nian/nian_tail.vmdl", context)
		PrecacheUnitByNameSync("npc_dota_cny_beast", context)

		-- Sounds can precached here like anything else
		--PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_viper.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_cny.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_centaur.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_nyx_assassin.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_items.vsndevts", context)

		-- Entire items can be precached by name
		-- Abilities can also be precached in this way despite the name
		--PrecacheItemByNameSync("example_ability", context)
		--PrecacheItemByNameSync("item_example_item", context)

		-- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
		-- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
		--PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
		--PrecacheUnitByNameSync("npc_dota_hero_enigma", context)
	end

--------------------------------------------------------------------------------
-- INIT
--------------------------------------------------------------------------------
function DotaUYBB:InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()

	-- Enable the standard Dota PvP game rules
	GameRules:GetGameModeEntity():SetTowerBackdoorProtectionEnabled( true )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )

	-- Register Think
	GameMode:SetContextThink( "DotaPvP:GameThink", function() return self:GameThink() end, 0.25 )

	-- Register Game Events
	-- Listener 
--	ListenToGameEvent( "npc_spawned", Dynamic_Wrap( DotaUYBB, "OnNPCSpawned" ), self )

	
end

--------------------------------------------------------------------------------
function DotaUYBB:GameThink()
	return 0.25
end

-- Evaluate the state of the game
function DotaUYBB:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

function DotaUYBB:OnNPCSpawned( keys )
--
--		Learned Abilities
		
	--	local spawnedUnit2 = EntIndexToHScript( keys.entindex )		
		
	--	if spawnedUnit2:GetUnitName() == "npc_dota_hero_visage" then		
		
--		//=================================================================================================================
--		// Ability: Year Beast Bash
--		//=================================================================================================================
	--	local spell = spawnedUnit2:FindAbilityByName("beast_bash")
	--	 spell:SetLevel(4)
	
--		//=================================================================================================================
--		// Beast: Attack Speed Aura
--		//=================================================================================================================
	--	spell = spawnedUnit2:FindAbilityByName("beast_attack_speed_aura")
	--	spell:SetLevel(1)
		
--		//=================================================================================================================
--		// Beast: Healing Aura
--		//=================================================================================================================
	--	spell = spawnedUnit2:FindAbilityByName("beast_healing_aura")
	--	spell:SetLevel(1)
	
--		//=================================================================================================================
--		// Beast: Healing Aura
--		//=================================================================================================================
  	--	spell = spawnedUnit2:FindAbilityByName("beast_aegis")
	--	spell:SetLevel(1)
		
 -- end
		
	--	local spawnedUnit = EntIndexToHScript( keys.entindex )		

	--	if spawnedUnit:GetUnitName() == "npc_dota_hero_viper" then		
		
--		//=================================================================================================================
--		// Ability: Year Beast Bash
--		//=================================================================================================================
	--	local spell = spawnedUnit:FindAbilityByName("beast_bash")
	--	 spell:SetLevel(4)
	
--		//=================================================================================================================
--		// Beast: Attack Speed Aura
--		//=================================================================================================================
	--	spell = spawnedUnit:FindAbilityByName("beast_attack_speed_aura")
	--	spell:SetLevel(1)
		
--		//=================================================================================================================
--		// Beast: Healing Aura
--		//=================================================================================================================
	--	spell = spawnedUnit:FindAbilityByName("beast_healing_aura")
	--	spell:SetLevel(1)
	
--		//=================================================================================================================
--		// Beast: Healing Aura
--		//=================================================================================================================
  	--	spell = spawnedUnit:FindAbilityByName("beast_aegis")
	--	spell:SetLevel(1)
		
  --end
end