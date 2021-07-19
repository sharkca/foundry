local plant     = require "library.plant"
local harvest   = require "library.harvest"

plot = {}

function plot.harvest (seed) 

    harvest.down()

    turtle.suckDown()

    plant.crop(seed)
    
end

return plot
