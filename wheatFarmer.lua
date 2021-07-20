local farm       = require "library.farm"
local turn       = require "library.turn"
local sleep      = require "library.sleep"
local traverse   = require "library.traverse"
local coordinate = require "library.coordinate"

local request = {
    crop   = "minecraft:wheat",
    seed   = "minecraft:wheat_seeds",
    lanes  = 5
}

local location = {}

function main ()

    farm.create(request)

    while true do 

        traverse.forward()

        location.start = coordinate.fetch()

        farm.harvest()

        location.finish = coordinate.fetch()

        traverse.from(location.finish)
        traverse.to(location.start)
        traverse.travel()

        turn.right()

        traverse.backward()

        sleep.days(6)

    end

end

main()
