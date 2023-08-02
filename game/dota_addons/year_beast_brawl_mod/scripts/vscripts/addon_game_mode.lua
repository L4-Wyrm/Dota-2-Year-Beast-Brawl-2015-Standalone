--//////////////////////////////////////////////////////////////////////////
-- This file is created for custom gamemode: Year Beast Brawl Standalone. //
-- 			DO NOT CHANGE ANYTING THERE!	      			  			  //
--//////////////////////////////////////////////////////////////////////////

-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')

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
		PrecacheResource("particle",  "particles/items2_fx/skadi_projectile.vpcf", context)
		PrecacheResource("particle",  "particles/status_fx/status_effect_frost.vpcf", context)
		PrecacheResource("particle_folder", "particles/test_particle", context)

		-- Models can also be precached by folder or individually
		PrecacheModel("models/heroes/viper/viper.vmdl", context)
		PrecacheModel("models/heroes/phoenix/phoenix_bird.vmdl", context)
		PrecacheModel("models/hero/nian/nian_hero.vmdl", context)
		PrecacheModel("models/hero/nian_dire/nian_hero_dire.vmdl", context)
		PrecacheUnitByNameSync("npc_dota_cny_beast", context)

		-- Sounds can precached here like anything else
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_viper.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_cny.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_centaur.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_axe.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_nyx_assassin.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds_items.vsndevts", context)
		PrecacheResource("soundfile", "soundevents/game_sounds.vsndevts", context)
end

--------------------------------------------------------------------------------
-- INIT
--------------------------------------------------------------------------------
function InitGameMode()
	local GameMode = GameRules:GetGameModeEntity()
	
	-- Register Think
	GameMode:SetContextThink( "GameMode:GameThink", function() return self:GameThink() end, 0.25 )

	-- Register Game Events
	ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( BetaDota, 'OnGameStateChanged' ), self )
end

--------------------------------------------------------------------------------
-- THINK
--------------------------------------------------------------------------------
function OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Year Beast Brawl script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

--------------------------------------------------------------------------------
function GameThink()
	return 0.25
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
 end