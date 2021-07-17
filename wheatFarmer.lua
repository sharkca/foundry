local farm  = require "library.farm"
local sleep = require "library.sleep"

local wheat     = "minecraft:wheat"
local farmland  = "minecraft:farmland"
local wheatSeed = "minecraft:wheat_seeds"

function main ()

    while true do 

        farm.harvest(wheat, wheatSeed)

        sleep.days(6)

    end

end

main()
