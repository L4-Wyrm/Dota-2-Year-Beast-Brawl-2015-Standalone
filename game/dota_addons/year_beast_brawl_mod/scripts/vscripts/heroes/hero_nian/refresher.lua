--[[
Author: Noya
Date: 2014.
Edited: July 2015

Edited by: Wyrm
For gamemode Year Beast Brawl Standalone
Date: 01.02.2016]]

function refresh_cooldowns( event )
    print("refreshing cooldowns")

    local hero = event.caster

    for i=0,4 do
        local ability = hero:GetAbilityByIndex(i)
        ability:EndCooldown()
    end
end