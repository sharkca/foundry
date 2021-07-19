local plot      = require "library.plot"
local detect    = require "library.detect"
local traverse  = require "library.traverse"

farm = {}

function farm.harvest (crop, seed)

    local distance = 0

    while detect.down(crop) do

        plot.harvest(seed)
    
        traverse.forward()

        distance = distance + 1

    end

    traverse.backward(distance)
        
end

return farm
