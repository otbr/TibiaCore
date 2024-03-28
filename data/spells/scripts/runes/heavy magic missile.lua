local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(player, level, maglevel)
	local base = 30
	local variation = 10
	
	local formula = 3 * maglevel + (2 * level)
	
	local min = (formula * (base - variation)) / 100
	local max = (formula * (base + variation)) / 100
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(player, variant, isHotkey)
    local tile = Tile(variant:getPosition())
    if tile then
        local topVisibleCreature = tile:getTopCreature(player)
        if topVisibleCreature then
            if topVisibleCreature:getId() ~= player:getId() or not topVisibleCreature:getGroup():getAccess() then
                return combat:execute(player, variant)
            end
        end

        local bottomVisibleCreature = tile:getBottomCreature(player)
        if bottomVisibleCreature then
            if bottomVisibleCreature:getId() ~= player:getId() or not bottomVisibleCreature:getGroup():getAccess() then
                return combat:execute(player, variant)
            end
        end
    end

    player:getPosition():sendMagicEffect(CONST_ME_POFF)
    player:sendCancelMessage(RETURNVALUE_CANONLYUSETHISRUNEONCREATURES)
    return false
end