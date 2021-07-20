local plot      = require "library.plot"
local plant     = require "library.plant"
local detect    = require "library.detect"
local harvest   = require "library.harvest"
local traverse  = require "library.traverse"

local farm = {}
local farm.crop 
local farm.seed
local farm.lanes 

local function farm.create (request)

    farm.crop   = request.crop
    farm.seed   = request.seed
    farm.lanes  = request.lanes

end

local function farm.plot ()

    harvest.down()

    turtle.suckDown()

    plant.crop(farm.crop)
    
end

local function farm.lane ()

    while detect.down(farm.crop) do

        farm.plot(farm.seed)
    
        traverse.forward()

    end

end

local function farm.harvest ()

    local lane = 0
    local turn = "right"

    while farm.lanes <= lane do

        farm.lane()

        if turn == "right" then

            traverse.uTurn.right()

            turn = "left"

        end

        if turn == "left" then

            traverse.uTurn.left()

            turn = "right"

        end

        lanes = lanes + 1

    end

end

return farm
