-- This is the primary uybb gamemode script and should be used to assist in initializing your game mode


-- Set this to true if you want to see a complete debug output of all events/processes done by barebones
-- You can also change the cvar 'barebones_spew' at any time to 1 or 0 for output/no output
BAREBONES_DEBUG_SPEW = false 

if GameMode == nil then
    DebugPrint( '[UYBB] creating barebones game mode' )
    _G.GameMode = class({})
end

-- This library allow for easily delayed/timed actions
require('libraries/timers')
-- This library can be used for advancted physics/motion/collision of units.  See PhysicsReadme.txt for more information.
require('libraries/physics')
-- This library can be used for advanced 3D projectile systems.
require('libraries/projectiles')
-- This library can be used for sending panorama notifications to the UIs of players/teams/everyone
require('libraries/notifications')
-- This library can be used for starting customized animations on units from lua
require('libraries/animations')
-- This library can be used for performing "Frankenstein" attachments on units
require('libraries/attachments')


-- These internal libraries set up uybb's events and processes.  Feel free to inspect them/change them if you need to.
require('internal/gamemode')
require('internal/events')

-- settings.lua is where you can specify many different properties for your game mode and is one of the core barebones files.
require('settings')
-- events.lua is where you can specify the actions to be taken when any event occurs and is one of the core barebones files.
require('events')

--[[
  This function should be used to set up Async precache calls at the beginning of the gameplay.

  In this function, place all of your PrecacheItemByNameAsync and PrecacheUnitByNameAsync.  These calls will be made
  after all players have loaded in, but before they have selected their heroes. PrecacheItemByNameAsync can also
  be used to precache dynamically-added datadriven abilities instead of items.  PrecacheUnitByNameAsync will 
  precache the precache{} block statement of the unit and all precache{} block statements for every Ability# 
  defined on the unit.

  This function should only be called once.  If you want to/need to precache more items/abilities/units at a later
  time, you can call the functions individually (for example if you want to precache units in a new wave of
  holdout).

  This function should generally only be used if the Precache() function in addon_game_mode.lua is not working.
]]
function GameMode:PostLoadPrecache()
  DebugPrint("[UYBB] Performing Post-Load precache")    
  --PrecacheItemByNameAsync("item_example_item", function(...) end)
  --PrecacheItemByNameAsync("example_ability", function(...) end)

  --PrecacheUnitByNameAsync("npc_dota_hero_viper", function(...) end)
  --PrecacheUnitByNameAsync("npc_dota_hero_enigma", function(...) end)
end

--[[
  This function is called once and only once as soon as the first player (almost certain to be the server in local lobbies) loads in.
  It can be used to initialize state that isn't initializeable in InitGameMode() but needs to be done before everyone loads in.
]]
function GameMode:OnFirstPlayerLoaded()
  DebugPrint("[UYBB] First Player has loaded")
end

--[[
  This function is called once and only once after all players have loaded into the game, right as the hero selection time begins.
  It can be used to initialize non-hero player state or adjust the hero selection (i.e. force random etc)
]]
function GameMode:OnAllPlayersLoaded()
  DebugPrint("[UYBB] All Players have loaded into the game")
end

--[[
  This function is called once and only once for every player when they spawn into the game for the first time.  It is also called
  if the player's hero is replaced with a new hero for any reason.  This function is useful for initializing heroes, such as adding
  levels, changing the starting gold, removing/adding abilities, adding physics, etc.

  The hero parameter is the hero entity that just spawned in
]]

function GameMode:OnHeroInGame(hero)
  DebugPrint("[UYBB] Hero spawned in game for first time -- " .. hero:GetUnitName())

end


--[[
  This function is called once and only once when the game completely begins (about 0:00 on the clock).  At this point,
  gold will begin to go up in ticks if configured, creeps will spawn, towers will become damageable etc.  This function
  is useful for starting any game logic timers/thinkers, beginning the first round, etc.
]]
function GameMode:OnGameInProgress()
  DebugPrint("[UYBB] The game has officially begun")

  Timers:CreateTimer(30, -- Start this timer 30 game-time seconds later
    function()
      DebugPrint("This function is called 30 seconds after the game begins, and every 30 seconds thereafter")
      return 30.0 -- Rerun this timer every 30 game-time seconds 
    end)
end

 -- This function initializes the game mode and is called before anyone loads into the game
-- It can be used to pre-initialize any values/tables that will be needed later
function GameMode:InitGameMode()
  GameMode = self
  DebugPrint('[UYBB] Starting to load UYBB gamemode...')

  -- Call the internal function to set up the rules/behaviors specified in constants.lua
  -- This also sets up event hooks for all event handlers in events.lua
  -- Check out internals/gamemode to see/modify the exact code
  GameMode:_InitGameMode()

  -- Commands can be registered for debugging purposes or as functions that can be called by the custom Scaleform UI
  Convars:RegisterCommand( "command_example", Dynamic_Wrap(GameMode, 'ExampleConsoleCommand'), "A console command example", FCVAR_CHEAT )
  
  DebugPrint('[UYBB] Done loading UYBB gamemode!\n\n')
  
	if GetMapName() == "dota_682_newbloom_1v1" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
	elseif GetMapName() == "dota_682_newbloom_3v3" then
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 3 )
		GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 3 )
	end
 
	GameRules:SetCustomGameSetupAutoLaunchDelay( 20 )
	GameRules:LockCustomGameSetupTeamAssignment( true )
	GameRules:EnableCustomGameSetupAutoLaunch( true )
	GameRules:GetGameModeEntity():SetBotThinkingEnabled(true)
	GameRules:GetGameModeEntity():SetFreeCourierModeEnabled( false )
	GameRules:SetPreGameTime( 60 )
	
	-- Remove bonus armor modifier from all towers
	local allTowers = Entities:FindAllByClassname('npc_dota_tower')
	for i = 1, #allTowers, 1 do
		local tower = allTowers[i]
		if tower:HasModifier('modifier_tower_aura') then
			tower:RemoveModifierByName('modifier_tower_aura')
		end
	end
 end

-- This is an example console command
--[[ function GameMode:ExampleConsoleCommand()
  print( '******* Example Console Command ***************' )
  local cmdPlayer = Convars:GetCommandClient()
  if cmdPlayer then
    local playerID = cmdPlayer:GetPlayerID()
    if playerID ~= nil and playerID ~= -1 then
      -- Do something here for the player who called this command
      PlayerResource:ReplaceHeroWith(playerID, "npc_dota_hero_viper", 1000, 1000)
    end
  end

  print( '*********************************************' )
end
]]

function GameMode:CreateHeroes()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_HERO_SELECTION then
	end
end

-- callback for event 'game_rules_state_change'
function GameMode:OnGameRulesStateChange(keys)
	local newState = GameRules:State_Get()
	
	-- Enable bots and fill empty slots
	if newState == DOTA_GAMERULES_STATE_STRATEGY_TIME then
        local num = 0
		local used_hero_name = "npc_dota_hero_io"
		local delay = 5.0
		
		for i=0, DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
				print(i)
				
                used_hero_name = PlayerResource:GetSelectedHeroName(i)
				num = num + 1
            end
        end
		
        self.numPlayers = num
        print("Number of players:", num)
		
		Timers:CreateTimer(delay, function()
		print( 'Timer for 1v1 created' )
			-- If 1v1 map and max player is 2, then set mid bots
			if IsServer() == true and 2 - self.numPlayers > 0 then	
				if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
				print("Adding bots in empty slots")
			
					if GetMapName() == "dota_682_newbloom_1v1" then
				
						local Difficulty = BOTS_DIFFICULTY

						local GoodBeast = "npc_dota_hero_viper"
						local BadBeast = "npc_dota_hero_visage"

						self.Bots_PlayerIDStart = PlayerResource:GetPlayerCount()
	

						local CurrentRadiantPlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS)
						local CurrentDirePlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS)

						for i=1, DOTA_MAX_TEAM - CurrentRadiantPlayers do
							Tutorial:AddBot(GoodBeast,"mid", Difficulty, true)
						end

						for i=1, DOTA_MAX_TEAM - CurrentDirePlayers do
							Tutorial:AddBot(BadBeast,"mid", Difficulty, false)
						end
					end
			
				end
			end 
		end)
		
		Timers:CreateTimer(delay, function()
		print( 'Timer for 5v5 created' )
			-- Enable bots and fill empty slots
			if IsServer() == true and 10 - self.numPlayers > 0 then	
				if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
				print("Adding bots in empty slots")
					if GetMapName() == "dota_682_newbloom" then
						local CurrentRadiantPlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS)
						local CurrentDirePlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS)
						
						local Difficulty = BOTS_DIFFICULTY

						local GoodBeast = "npc_dota_hero_viper"
						local BadBeast = "npc_dota_hero_visage"

						
						for i=1, DOTA_MAX_TEAM - CurrentRadiantPlayers do
							Tutorial:AddBot(GoodBeast,"", Difficulty, true)
						end
						for i=1, DOTA_MAX_TEAM - CurrentDirePlayers do
							Tutorial:AddBot(BadBeast,"", Difficulty, false)
						end
					end
				Tutorial:StartTutorialMode()
				end
			end
		end)
		
		Timers:CreateTimer(delay, function()
		print( 'Timer for 3v3 created' )
			if IsServer() == true and 6 - self.numPlayers > 0 then	
				if GameRules:IsCheatMode() == CHEATSBOTS and IsInToolsMode() == TOOLSBOTS then
					print("Adding bots in empty slots")
					if GetMapName() == "dota_682_newbloom_3v3" then
						local CurrentRadiantPlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_GOODGUYS)
						local CurrentDirePlayers = PlayerResource:GetPlayerCountForTeam(DOTA_TEAM_BADGUYS)
						
						local Difficulty = BOTS_DIFFICULTY

						local GoodBeast = "npc_dota_hero_viper"
						local BadBeast = "npc_dota_hero_visage"

						
						for i=1, DOTA_MAX_TEAM - CurrentRadiantPlayers do
							Tutorial:AddBot(GoodBeast,"", Difficulty, true)
						end
						for i=1, DOTA_MAX_TEAM - CurrentDirePlayers do
							Tutorial:AddBot(BadBeast,"", Difficulty, false)
						end
					end
				Tutorial:StartTutorialMode()
				end
			end
		end)
	
	
		if GameRules:IsCheatMode() == true then
			GameRules:SetSafeToLeave( true )
			SendToServerConsole( "sv_cheats 1" )
		elseif GameRules:IsCheatMode() == false then
			GameRules:SetSafeToLeave( false )
			SendToServerConsole( "sv_cheats 0" )
		end
	
		for i=0, DOTA_MAX_TEAM_PLAYERS do
            if PlayerResource:IsValidPlayer(i) then
                print(i)

				-- Random heroes for people who have not picked
				if PlayerResource:HasSelectedHero(i) == false then
                    print("Randoming hero for:", i)

                    local player = PlayerResource:GetPlayer(i)
                    player:MakeRandomHeroSelection()

                    local hero_name = PlayerResource:GetSelectedHeroName(i)

                    print("Randomed:", hero_name)
                end
            end
        end
	end
	
	if newState == DOTA_GAMERULES_STATE_HERO_SELECTION then
	-- this will skip hero selection screen
	-- iterate over all players and give them their hero depending on their team  
	local playerCnt = PlayerResource:GetPlayerCount()
	for playerID = 0, playerCnt - 1 do 
		local player = PlayerInstanceFromIndex(playerID + 1) -- index = playerID + 1
		local team   = player:GetTeamNumber()
			if team == 2 then
				hero = CreateHeroForPlayer('npc_dota_hero_viper', player) -- does create 2 heros?!
				UTIL_Remove( hero )
			elseif team == 3 then
				hero = CreateHeroForPlayer('npc_dota_hero_visage', player)
				UTIL_Remove( hero )
			end
		end
	end

	if newState == DOTA_GAMERULES_STATE_PRE_GAME then
		local spawn_delay = 60.0
		
		Timers:CreateTimer(spawn_delay, function()
			SpawnGoldGranter()
		end)
	end
end

function SpawnGoldGranter()
    local point = Entities:FindByName( nil, "gold_granter_target"):GetAbsOrigin()
    local unit = CreateUnitByName("npc_dota_gold_granter", point, true, nil, nil, DOTA_TEAM_NEUTRALS)
end