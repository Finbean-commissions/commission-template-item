----Welcome to the "main.lua" file! Here is where all the magic happens, everything from functions to callbacks are done here.
--Startup
local mod = RegisterMod("Commission Template - Items (Passive, Active, Trinket and Card)", 1)
local game = Game()
local rng = RNG()
--local RECOMMENDED_SHIFT_IDX = 35
--local seeds = game:GetSeeds()
--local startSeed = seeds:GetStartSeed()

mod.Items = {
    Passive = Isaac.GetItemIdByName("Passive Example"),
    Active = Isaac.GetItemIdByName("Active Example"),
    Trinket = Isaac.GetTrinketIdByName("Trinket Example"),
    Card = Isaac.GetCardIdByName("Card Example"),
}

function mod:UseItem(item, _, player, UseFlags, Slot, _)
	if UseFlags & UseFlag.USE_OWNED == UseFlag.USE_OWNED then
		if item == mod.Items.Active then
            player:AnimateCollectible(mod.Items.Active, "UseItem")
            game:Fart(player.Position, 85, nil, 1, 0, Color.Default)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseItem)

local function toTears(fireDelay) --thanks oat for the cool functions for calculating firerate
	return 30 / (fireDelay + 1)
end
local function fromTears(tears)
	return math.max((30 / tears) - 1, -0.99)
end
function mod:CacheEvaluation(player, cacheFlag)
	if player:HasCollectible(mod.item.Passive) == true then
		if cacheFlag == CacheFlag.CACHE_FIREDELAY then
			player.MaxFireDelay = math.max(1.0, fromTears(toTears(player.MaxFireDelay) + 1.22 * player:GetCollectibleNum(mod.item.Passive, true)))
		end
	end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE,mod.CacheEvaluation)