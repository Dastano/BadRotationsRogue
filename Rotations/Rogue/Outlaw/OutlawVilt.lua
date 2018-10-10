local rotationName = "Vilt"

---------------
--- Toggles ---
---------------
local function createToggles()
-- Rotation Button
    RotationModes = {
        [1] = { mode = "On", value = 1 , overlay = "DPS Rotation Enabled", tip = "Enable DPS Rotation", highlight = 1, icon = br.player.spell.dispatch},
        [2] = { mode = "Off", value = 2 , overlay = "DPS Rotation Disabled", tip = "Disable DPS Rotation", highlight = 0, icon = br.player.spell.crimsonVial}
    };
    CreateButton("Rotation",1,0)
-- Cooldown Button
    CooldownModes = {
        [1] = { mode = "Auto", value = 1 , overlay = "Cooldowns Automated", tip = "Automatic Cooldowns - Boss Detection.", highlight = 1, icon = br.player.spell.adrenalineRush},
        [2] = { mode = "On", value = 2 , overlay = "Cooldowns Enabled", tip = "Cooldowns used regardless of target.", highlight = 0, icon = br.player.spell.adrenalineRush},
        [3] = { mode = "Off", value = 3 , overlay = "Cooldowns Disabled", tip = "No Cooldowns will be used.", highlight = 0, icon = br.player.spell.adrenalineRush}
    };
    CreateButton("Cooldown",2,0)
-- Blade Flurry Button
    BladeFlurryModes = {
        [1] = { mode = "On", value = 1 , overlay = "Blade Flurry Enabled", tip = "Rotation will use Blade Flurry.", highlight = 1, icon = br.player.spell.bladeFlurry},
        [2] = { mode = "Off", value = 2 , overlay = "Blade Flurry Disabled", tip = "Rotation will not use Blade Flurry.", highlight = 0, icon = br.player.spell.bladeFlurry}
    };
    CreateButton("BladeFlurry",3,0)
-- Defensive Button
    DefensiveModes = {
        [1] = { mode = "On", value = 1 , overlay = "Defensive Enabled", tip = "Includes Defensive Cooldowns.", highlight = 1, icon = br.player.spell.riposte},
        [2] = { mode = "Off", value = 2 , overlay = "Defensive Disabled", tip = "No Defensives will be used.", highlight = 0, icon = br.player.spell.riposte}
    };
    CreateButton("Defensive",4,0)
-- Interrupt Button
    InterruptModes = {
        [1] = { mode = "On", value = 1 , overlay = "Interrupts Enabled", tip = "Includes Basic Interrupts.", highlight = 1, icon = br.player.spell.kick},
        [2] = { mode = "Off", value = 2 , overlay = "Interrupts Disabled", tip = "No Interrupts will be used.", highlight = 0, icon = br.player.spell.kick}
    };
    CreateButton("Interrupt",5,0)
    MFDModes = {
        [1] = { mode = "Tgt", value = 1 , overlay = "Target", tip = "Will MFD Target", highlight = 1, icon = br.player.spell.markedForDeath},
        [2] = { mode = "Adds", value = 2 , overlay = "Adds", tip = "Will MFD Adds", highlight = 1, icon = br.player.spell.markedForDeath},
        [3] = { mode = "Off", value = 2 , overlay = "Off", tip = "Will not MFD", highlight = 0, icon = br.player.spell.markedForDeath}
    };
    CreateButton("MFD",6,0)
end

---------------
--- OPTIONS ---
---------------
local function createOptions()
    local optionTable

    local function rotationOptions()
        -----------------------
        --- GENERAL OPTIONS ---
        -----------------------
        section = br.ui:createSection(br.ui.window.profile,  "General")
            -- Opening Attack
            br.ui:createCheckbox(section, "Opener")
            -- mfd prepull
            br.ui:createCheckbox(section, "Marked For Death - Precombat")
            -- RTb Prepull
            br.ui:createCheckbox(section, "RTB Prepull")
            -- Stealth
            br.ui:createDropdown(section, "Stealth", {"|cff00FF00Always", "|cffFF000020Yards"},  2, "Stealthing method.")
        br.ui:checkSectionState(section)
        ------------------------
        --- OFFENSIVE OPTIONS ---
        ------------------------
        section = br.ui:createSection(br.ui.window.profile,  "Offensive")
            -- Trinkets
            br.ui:createCheckbox(section, "Trinkets")
            -- Agi Pot
            br.ui:createCheckbox(section, "Agi-Pot")
            -- Marked For Death
            --br.ui:createDropdown(section, "Marked For Death", {"|cff00FF00Target", "|cffFFDD00Lowest"}, 1)
            -- Vanish
            br.ui:createCheckbox(section, "Vanish")
            -- Racial
            br.ui:createCheckbox(section, "Racial")
            -- Pistol Shot OOR
            br.ui:createSpinner(section, "Pistol Shot out of range", 85,  5,  100,  5,  "|cffFFFFFFCheck to use Pistol Shot out of range and energy to use at.")
            -- AR
            br.ui:createCheckbox(section, "Adrenaline Rush")
            -- KS
            br.ui:createCheckbox(section, "Killing Spree")
            -- BR
            br.ui:createCheckbox(section, "Blade Rush")
            -- RTB
            br.ui:createCheckbox(section, "RTB/Slice and Dice")
            -- MFD Sniping
            br.ui:createSpinnerWithout(section, "MFD Sniping",  1,  0.5,  3,  0.1,  "|cffFFBB00Increase to have BR cast MFD on dying units quicker, too high might cause suboptimal casts")
        br.ui:checkSectionState(section)
        -------------------------
        --- DEFENSIVE OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Defensive")
            -- Healthstone
            br.ui:createSpinner(section, "Healing Potion/Healthstone",  60,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Crimson Vial
            br.ui:createSpinner(section, "Crimson Vial",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Feint
            br.ui:createSpinner(section, "Feint", 75, 0, 100, 5, "|cffFFBB00Health Percentage to use at.")
            -- Riposte
            br.ui:createSpinner(section, "Riposte",  50,  0,  100,  5,  "|cffFFBB00Health Percentage to use at.")
            -- Cloak with KS
            br.ui:createCheckbox(section, "Cloak Killing Spree")
        br.ui:checkSectionState(section)
        -------------------------
        --- INTERRUPT OPTIONS ---
        -------------------------
        section = br.ui:createSection(br.ui.window.profile, "Interrupts")
            -- Kick
            br.ui:createCheckbox(section, "Kick")
            -- Gouge
            br.ui:createCheckbox(section, "Gouge")
            -- Blind
            br.ui:createCheckbox(section, "Blind")
            -- Between the Eyes
            br.ui:createCheckbox(section, "Between the Eyes")
            -- Interrupt Percentage
            br.ui:createSpinner(section,  "Interrupt At",  0,  0,  95,  5,  "|cffFFBB00Cast Percentage to use at.")
        br.ui:checkSectionState(section)
        ----------------------
        --- TOGGLE OPTIONS ---
        ----------------------
        section = br.ui:createSection(br.ui.window.profile,  "Toggle Keys")
            -- Single/Multi Toggle
            br.ui:createDropdown(section,  "Rotation Mode", br.dropOptions.Toggle,  4)
            --Cooldown Key Toggle
            br.ui:createDropdown(section,  "Cooldown Mode", br.dropOptions.Toggle,  3)
            --Defensive Key Toggle
            br.ui:createDropdown(section,  "Defensive Mode", br.dropOptions.Toggle,  6)
            -- Interrupts Key Toggle
            br.ui:createDropdown(section,  "Interrupt Mode", br.dropOptions.Toggle,  6)
            -- Cleave Toggle
            br.ui:createDropdown(section,  "BladeFlurry Mode", br.dropOptions.Toggle,  6)
            br.ui:createDropdown(section,  "MFD Mode", br.dropOptions.Toggle,  6)
            -- Pause Toggle
            br.ui:createDropdown(section,  "Pause Mode", br.dropOptions.Toggle,  6)
        br.ui:checkSectionState(section)
    end
    optionTable = {{
        [1] = "Rotation Options",
        [2] = rotationOptions,
    }}
    return optionTable
end



----------------
--- ROTATION ---
----------------
local function runRotation()
        --Print("Running: "..rotationName)

---------------
--- Toggles ---
---------------
        UpdateToggle("Rotation",0.25)
        UpdateToggle("Cooldown",0.25)
        UpdateToggle("Defensive",0.25)
        UpdateToggle("Interrupt",0.25)
        UpdateToggle("BladeFlurry",0.25)
        br.player.mode.bladeflurry = br.data.settings[br.selectedSpec].toggles["BladeFlurry"]
        UpdateToggle("MFD",0.25)
        br.player.mode.mfd = br.data.settings[br.selectedSpec].toggles["MFD"]

--------------
--- Locals ---
--------------
        if profileStop == nil then profileStop = false end
        local attacktar                                     = UnitCanAttack("target","player")
        local buff                                          = br.player.buff
        local cast                                          = br.player.cast
        local cd                                            = br.player.cd
        local combo, comboDeficit, comboMax                 = br.player.power.comboPoints.amount(), br.player.power.comboPoints.deficit(), br.player.power.comboPoints.max()
        local cTime                                         = getCombatTime()
        local debuff                                        = br.player.debuff
        local enemies                                       = br.player.enemies
        local gcd                                           = br.player.gcd
        local hastar                                        = GetObjectExists("target")
        local healPot                                       = getHealthPot()
        local inCombat                                      = isInCombat("player")
        local lastSpell                                     = lastSpellCast
        local level                                         = br.player.level
        local mode                                          = br.player.mode
        local php                                           = br.player.health
        local power, powerDeficit, powerRegen               = br.player.power.energy.amount(), br.player.power.energy.deficit(), br.player.power.energy.regen()
        local race                                          = br.player.race
        local racial                                        = br.player.getRacial()
        local solo                                          = #br.friend < 2
        local spell                                         = br.player.spell
        local stealth                                       = br.player.buff.stealth.exists()
        local stealthingAll                                 = br.player.buff.stealth.exists() or br.player.buff.vanish.exists() or br.player.buff.shadowmeld.exists()
        local stealthingRogue                               = br.player.buff.stealth.exists() or br.player.buff.vanish.exists()
        local stealthingMantle                              = br.player.buff.stealth.exists() or br.player.buff.vanish.exists()
        local talent                                        = br.player.talent
        local ttd                                           = getTTD
        local ttdtarget                                     = HeroLib and HeroLib.Unit.Target:TimeToDie(5) or getTTD("target")
        local ttm                                           = br.player.power.energy.ttm()
        local units                                         = br.player.units
        local lootDelay                                     = getOptionValue("LootDelay")

        local HeroLibEnabled = HeroLib and true or false
        if HeroLibNotified == nil then HeroLibNotified = false end
        if not HeroLibEnabled and not HeroLibNotified then
            Print("Consider installing and downloading HeroLib for more accurate TimeToDie calculations.")
            Print("You can find it on Curse/Twitch app, or on Github.")
            HeroLibNotified = true
        end

        units.get(5)
        units.get(30)
        enemies.get(5)
        enemies.get(7)
        enemies.get(8)
        enemies.get(20)
        enemies.get(30)

        if talent.acrobaticStikes then rangeMod = 3 else rangeMod = 0 end
        if leftCombat == nil then leftCombat = GetTime() end
        if vanishTime == nil then vanishTime = GetTime() end

        if buff.rollTheBones == nil then buff.rollTheBones = {} end
        buff.rollTheBones.count    = 0
        buff.rollTheBones.duration = 0
        buff.rollTheBones.remain   = 0
        for k,v in pairs(spell.buffs.rollTheBones) do
            if UnitBuffID("player",v) ~= nil then
                buff.rollTheBones.count    = buff.rollTheBones.count + 1
                buff.rollTheBones.duration = getBuffDuration("player",v)
                buff.rollTheBones.remain   = getBuffRemain("player",v)
            end
        end

        local function rtbReroll()
            --rtb_reroll,value=rtb_buffs<2&(buff.loaded_dice.up|!buff.grand_melee.up&!buff.ruthless_precision.up)
            return (buff.rollTheBones.count < 2 and (buff.loadedDice.exists() or (not buff.grandMelee.exists() and not buff.ruthlessPrecision.exists()))) and true or false
        end

        local function ambushCondition()
            return comboDeficit >= 2 + 2 * ((talent.ghostlyStrike and cd.ghostlyStrike.remain() < 1) and 1 or 0) + (buff.broadside.exists() and 1 or 0) and power > 60 and not buff.skullAndCrossbones.exists()
        end

        local function bladeFlurrySync()
            return not mode.bladeflurry == 1 or #enemies.yards7 < 2 or buff.bladeFlurry.exists()
        end
        -- finish,if=combo_points>=cp_max_spend-(buff.broadside.up+buff.opportunity.up)*(talent.quick_draw.enabled&(!talent.marked_for_death.enabled|cooldown.marked_for_death.remains>1))
        local combospend = ComboMaxSpend()
        function shouldFinish()
            if br.player.talent.quickDraw and (not br.player.talent.markedForDeath or br.player.cd.markedForDeath.remain() > 1) then
                if buff.broadside.exists() then
                    combospend = combospend - 1
                end
                if buff.opportunity.exists() then
                    combospend = combospend - 1
                end
            end
            if combo >= combospend then
                return true
            else 
                return false
            end
        end
--------------------
--- Action Lists ---
--------------------
    -- Action List - Extras
        --[[local function actionList_Extras()
        end -- End Action List - Extras]]
    -- Action List - DefensiveModes
        local function actionList_Defensive()
            if useDefensive() and not stealth then
            -- Health Pot/Healthstone
                if isChecked("Healing Potion/Healthstone") and php <= getOptionValue("Healing Potion/Healthstone")
                    and inCombat and (hasHealthPot() or hasItem(5512))
                then
                    if canUse(5512) then
                        useItem(5512)
                    elseif canUse(healPot) then
                        useItem(healPot)
                    end
                end
            -- Crimson Vial
                if cast.able.crimsonVial() and isChecked("Crimson Vial") and php < getOptionValue("Crimson Vial") then
                    if cast.crimsonVial() then return end
                end
            -- Feint
                if cast.able.feint() and isChecked("Feint") and php <= getOptionValue("Feint") and inCombat and not buff.feint then
                    if cast.feint() then return end
                end
            -- Riposte
                if cast.able.riposte() and isChecked("Riposte") and php <= getOptionValue("Riposte") and inCombat then
                    if cast.riposte() then return end
                end
            end
        end -- End Action List - Defensive
    -- Action List - Interrupts
        local function actionList_Interrupts()
            if useInterrupts() and not stealth then
                for i = 1, #enemies.yards20 do
                    local thisUnit = enemies.yards20[i]
                    local distance = getDistance(thisUnit)
                    if canInterrupt(thisUnit,getOptionValue("Interrupt At")) and hasThreat(thisUnit) then
                        if distance < 5 then
        -- Kick
                            -- kick
                            if cast.able.kick() and isChecked("Kick") then
                                if cast.kick(thisUnit) then return end
                            end
                            if cd.kick.remain() ~= 0 or not cast.able.kick() then
        -- Gouge
                                if cast.able.gouge() and isChecked("Gouge") and getFacing(thisUnit,"player") then
                                    if cast.gouge(thisUnit) then return end
                                end
                            end
                        end
                        if (cd.kick.remain() ~= 0 and cd.gouge.remain() ~= 0) or (distance >= 5 and distance < 15) or (not cast.able.kick() or not cast.able.gouge()) then
        -- Blind
                            if cast.able.blind() and isChecked("Blind") then
                                if cast.blind(thisUnit) then return end
                            end
                        end
        -- Between the Eyes
                        if (((cd.kick.remain() ~= 0 and cd.gouge.remain() ~= 0) or distance >= 5) and (cd.blind.remain() ~= 0 or level < 38 or distance >= 15)) or not (cast.able.kick() or cast.able.gouge() or cast.able.blind()) then
                            if cast.able.betweenTheEyes() and isChecked("Between the Eyes") then
                                if cast.betweenTheEyes(thisUnit) then return end
                            end
                        end
                    end
                end
            end -- End Interrupt and No Stealth Check
        end -- End Action List - Interrupts
    -- Action List - Cooldowns
        local function actionList_Cooldowns()
        -- Trinkets
            if isChecked("Trinkets") then
                if hasBloodLust() or ttdtarget <= 20 or comboDeficit <= 2 then
                    if canUse(13) then
                        useItem(13)
                    end
                    if canUse(14) then
                        useItem(14)
                    end
                end
            end
    -- Pots
            if isChecked("Agi-Pot") then
                if ttdtarget <= 25 or buff.adrenalineRush.exists() or hasBloodLust() then
                    if canUse(127844) and inRaid then
                        useItem(127844)
                    end
                    else
                    if canUse(142117) and inRaid then
                        useItem(142117)
                    end
                end
            end
    -- Non-NE Racial
            --blood_fury
            --berserking
            --arcane_torrent,if=energy.deficit>40
            if isChecked("Racial") and (race == "Orc" or race == "Troll" or (race == "BloodElf" and powerDeficit > 15 + powerRegen)) then
                if castSpell("player",racial,false,false,false) then return end
            end
    -- Adrenaline Rush
            -- adrenaline_rush,if=!buff.adrenaline_rush.up&energy.time_to_max>1
            if cast.able.adrenalineRush() and isChecked("Adrenaline Rush") and not buff.adrenalineRush.exists() and ttm >= gcd then
                if cast.adrenalineRush() then return end
            end    
    -- Ghostly Strike
            -- actions.cds+=/ghostly_strike,if=variable.blade_flurry_sync&combo_points.deficit>=1+buff.broadside.up
            if cast.able.ghostlyStrike() and isChecked("Ghostly Strike") and bladeFlurrySync() and comboDeficit >= (1 + (buff.broadside.exists() and 1 or 0)) then
                if cast.ghostlyStrike("target") then return end
            end
    -- Killing Spree
            -- killing_spree,if=variable.blade_flurry_sync&(energy.time_to_max>5|energy<15)
            if cast.able.killingSpree() and isChecked("Killing Spree") and bladeFlurrySync() and (ttm > 5 or power < 15) then
                if isChecked("Cloak Killing Spree") and cd.killingSpree.remain() == 0 then
                    if cast.cloakOfShadows() then cast.killingSpree(); return end
                end
                if cast.killingSpree() then return end
            end
    -- Blade Rush
            -- blade_rush,if=variable.blade_flurry_sync&energy.time_to_max>1
            if cast.able.bladeRush() and isChecked("Blade Rush") and bladeFlurrySync() and ttm > 1 and getDistance("target") <= 8 then
                if cast.bladeRush("target") then return end
            end
        end -- End Action List - Cooldowns
    -- Action List - PreCombat
        local function actionList_PreCombat()
        -- Stealth
            if not inCombat and not stealth and cast.able.stealth() then
                if isChecked("Stealth") and (not IsResting() or isDummy("target")) then
                    if getOptionValue("Stealth") == 1 then
                        if cast.stealth("player") then return end
                    end
                    if #enemies.yards20 > 0 and getOptionValue("Stealth") == 2 and not IsResting() and GetTime()-leftCombat > lootDelay then
                        for i = 1, #enemies.yards20 do
                            local thisUnit = enemies.yards20[i]
                            if UnitIsEnemy(thisUnit,"player") or isDummy("target") then
                                if cast.stealth("player") then return end
                            end
                        end
                    end
                end
            end
        -- Marked for Death
            -- marked_for_death
            if cast.able.markedForDeath() and not inCombat and isChecked("Marked For Death - Precombat") and getDistance("target") < 15 and isValidUnit("target") then
                if cast.markedForDeath("target") then return end
            end
        -- Roll The Bones
            -- roll_the_bones,if=!talent.slice_and_dice.enabled
            if cast.able.rollTheBones() and not inCombat and isChecked("RTB Prepull") and not talent.sliceAndDice and buff.rollTheBones.count == 0 and isValidUnit("target") and getDistance("target") <= 10 then
                if cast.rollTheBones() then return end
            end
        end -- End Action List - PreCombat
    -- Action List - Finishers
        local function actionList_Finishers()        
            if isChecked("RTB/Slice and Dice") then
        -- Slice and Dice
                if talent.sliceAndDice and cast.able.sliceAndDice() then
                    -- slice_and_dice,if=buff.slice_and_dice.remains<target.time_to_die&buff.slice_and_dice.remains<(1+combo_points)*1.8
                    if buff.sliceAndDice.remain() < ttdtarget and buff.sliceAndDice.refresh() then
                        if cast.sliceAndDice() then return end
                    end
                end
        -- Roll the Bones
                if not talent.sliceAndDice and cast.able.rollTheBones() then
                    -- roll_the_bones,if=(buff.roll_the_bones.remains<=3|variable.rtb_reroll)&(target.time_to_die>20|buff.roll_the_bones.remains<target.time_to_die)
                    if (buff.rollTheBones.remain < 3 or rtbReroll()) and (ttdtarget > 20 or buff.rollTheBones.remain < ttdtarget or buff.rollTheBones.remain == 0) then
                        if cast.rollTheBones() then return end
                    end
                end
            end
        -- Between the Eyes
            -- between_the_eyes,if=buff.ruthless_precision.up
            if cast.able.betweenTheEyes() and buff.ruthlessPrecision.exists() then
                if cast.betweenTheEyes() then return end
            end
        -- Run Through
            -- actions.finish+=/dispatch
            if cast.able.dispatch() then
                if cast.dispatch() then return end
            end
        end -- End Action List - Finishers
    -- Action List - Build
        local function actionList_Build()
        -- Ambush
            if cast.able.ambush() and stealthingAll and ambushCondition() then
                if cast.ambush() then return end
            end
        -- Pistol Shot
            -- pistol_shot,if=combo_points.deficit>=1+buff.broadside.up+talent.quick_draw.enabled&buff.opportunity.up
            if cast.able.pistolShot() and comboDeficit >= (1 + (buff.broadside.exists() and 1 or 0) + (talent.quickDraw and 1 or 0)) and buff.opportunity.exists() then
                if cast.pistolShot("target") then return end
            end
        -- Sinister Strike
            -- sinister_strike
            if cast.able.sinisterStrike() then
                if cast.sinisterStrike() then return end
            end
        end -- End Action List - Build
    -- Action List - Opener
        local function actionList_Opener()                    
        -- Opener
            if not inCombat then
                if combo >= 5 then
                    if cast.able.dispatch() then
                        if cast.dispatch("target") then return end
                    end
                elseif stealthingAll then
                    if cast.able.ambush() then
                        if cast.ambush("target") then return end
                    end
                else
                    if cast.able.sinisterStrike() then
                        if cast.sinisterStrike("target") then return end
                    end
                end
            end
    -- StartAttack
            if getDistance("target") <= 5 and not stealthingAll and not StartAttack() then
                StartAttack()
            end
        end
    -- Action List - Stealth
        local function actionList_Stealth()            
        -- Ambush
            --ambush,if=variable.ambush_condition
            if stealthingAll then
                if ambushCondition() and cast.able.ambush() then
                    if cast.ambush() then return end
                elseif not ambushCondition() or not cast.able.ambush() then
                    if cast.sinisterStrike() then return end
                end
            else
        -- Vanish
                if cd.global.remain() <= getLatency() and not solo and ambushCondition() and isValidUnit("target") and getDistance("target") <= 5 then
                    -- vanish,if=variable.ambush_condition
                    if cast.able.vanish() and cd.vanish.remain() == 0 and useCDs() and isChecked("Vanish") and GetTime() >= vanishTime + cd.global.remain() then
                        if cast.vanish() then 
                            vanishTime = GetTime(); 
                            cast.ambush(); 
                            return 
                        end
        -- Shadowmeld
                    -- shadowmeld,if=variable.ambush_condition
                    elseif cast.able.shadowmeld() and cd.shadowmeld.remain() == 0 and useCDs() and isChecked("Racial") and GetTime() >= vanishTime + cd.global.remain() and race == "NightElf" and not isMoving("player") then
                        if cast.shadowmeld() then 
                            vanishTime = GetTime(); 
                            cast.ambush(); 
                            return 
                        end
                    end
                end
            end
        end
---------------------
--- Begin Profile ---
---------------------
    --Profile Stop | Pause
        if not inCombat and not hastar and profileStop==true then
            profileStop = false
        elseif (inCombat and profileStop == true) or pause() or (IsMounted() or IsFlying()) or mode.rotation == 2 then
            return true
        else
-----------------------
--- Extras Rotation ---
-----------------------
            --if actionList_Extras() then return end
--------------------------
--- Defensive Rotation ---
--------------------------
            if actionList_Defensive() then return end
------------------------------
--- Out of Combat Rotation ---
------------------------------
            if actionList_PreCombat() then return end
----------------------------
--- Out of Combat Opener ---
----------------------------
            if isValidUnit("target") and isChecked("Opener") then
                if actionList_Opener() then return end
            end
--------------------------------
--- In Combat - Blade Flurry ---
--------------------------------
            -- Blade Flurry
            -- blade_flurry,if=spell_targets>=2&!buff.blade_flurry.up&(!raid_event.adds.exists|raid_event.adds.remains>8|cooldown.blade_flurry.charges=1&raid_event.adds.in>(2-cooldown.blade_flurry.charges_fractional)*25)
            if cast.able.bladeFlurry() and mode.bladeflurry == 1 and #enemies.yards7 >= 2 and not buff.bladeFlurry.exists() then
                if cast.bladeFlurry() then return end
            end
--------------------------
--- In Combat Rotation ---
--------------------------
            if inCombat and isValidUnit(units.dyn5) then
                if not stealthingAll or level < 5 then
------------------------------
--- In Combat - Interrupts ---
------------------------------
                    if actionList_Interrupts() then return end
                end
-----------------------------
--- In Combat - Cooldowns ---
-----------------------------
                if useCDs() and getDistance("target") <= 6 and attacktar then
                    if actionList_Cooldowns() then return end
                end
---------------------------
--- In Combat - Stealth ---
---------------------------
                    -- call_action_list,name=stealth,if=stealthed.rogue|cooldown.vanish.up|cooldown.shadowmeld.up
                if (stealthingAll or cd.vanish.remain() == 0 or cd.shadowmeld.remain() == 0) then
                    if actionList_Stealth() then return end
                end
----------------------------------
--- In Combat - Begin Rotation ---
----------------------------------
                -- if not buff.stealth and not buff.vanish and not buff.shadowmeld and GetTime() > vanishTime + 2 and getDistance(units.dyn5) < 5 then
                if not stealthingAll then
                -- Marked for Death
                    if cast.able.markedForDeath() then
                        if mode.mfd == 1 then                            
                            if comboDeficit >= ComboMaxSpend() - 1 then
                                if cast.markedForDeath("target") then return end
                            end
                        elseif mode.mfd == 2 then
                            for i = 1, #enemies.yards30 do
                            local ThisTTD = 99
                            local LowestTTD = units.dyn5
                            local thisUnit = enemies.yards30[i]
                            if comboDeficit >= 6 then comboDeficit = ComboMaxSpend() end
                            if ttd(thisUnit) < ThisTTD then
                                ThisTTD = ttd(thisUnit)
                                LowestTTD = thisUnit
                            end
                            if ttd(LowestTTD) > 0 and ttd(LowestTTD) <= 100 then
                                if ttd(LowestTTD) < comboDeficit * getOptionValue("MFD Sniping") then
                                    if cast.markedForDeath(LowestTTD) then return end
                                end
                            end
                        end
                        end
                    end
                    
    -- Finishers
                    -- call_action_list,name=finish,if=combo_points>=cp_max_spend-(buff.broadside.up+buff.opportunity.up)*(talent.quick_draw.enabled&(!talent.marked_for_death.enabled|cooldown.marked_for_death.remains>1))
                    if shouldFinish() then
                        if actionList_Finishers() then return end
                    end

    -- Build
                    -- call_action_list,name=build
                    if GetTime() >= vanishTime + cd.global.remain() then
                        if actionList_Build() then return end
                    end

    -- Pistol Shot OOR
                    if cast.able.pistolShot() and isChecked("Pistol Shot out of range") and isValidUnit("target") and #enemies.yards8 == 0 and not stealthingAll and power >= getOptionValue("Pistol Shot out of range") and (comboDeficit >= 1 or ttm <= gcd) then
                        if cast.pistolShot("target") then return end
                    end
                end
            end -- End In Combat
        end -- End Profile
end -- runRotation
local id = 260
if br.rotations[id] == nil then br.rotations[id] = {} end
tinsert(br.rotations[id],{
    name = rotationName,
    toggles = createToggles,
    options = createOptions,
    run = runRotation,
})