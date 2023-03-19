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