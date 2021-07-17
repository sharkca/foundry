local tree  = require "library.tree"
local plant = require "library.plant"

local spruceLog     = "minecraft:spruce_log"
local spruceLeaves  = "minecraft:spruce_leaves"
local spruceSapling = "minecraft:spruce_sapling"

function main () 

    while true do

        if tree.hasGrown(spruceLog) then

            tree.fell(spruceLog, spruceLeaves)

            plant.sapling(spruceSapling)
            
        end

    end

end

main()
