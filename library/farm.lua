local plant     = require "library.plant"
local detect    = require "library.detect"
local harvest   = require "library.harvest"
local traverse  = require "library.traverse"

farm = {}

function farm.harvest (crop, seed)

    local distance = 0

    while detect.down(crop) do

        harvest.down()

        turtle.suckDown()

        plant.crop(seed)
        
        traverse.forward()

        distance = distance + 1

    end

    traverse.backward(distance)
        
end

return farm
