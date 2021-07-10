local tree = require "library.tree"

local spruceLog     = "minecraft:spruce_log"
local spruceLeaves  = "minecraft:spruce_leaves"

function main () 

    if tree.hasGrown(spruceLog) then

        tree.fell(spruceLog, spruceLeaves)
        
    end

end

main()
