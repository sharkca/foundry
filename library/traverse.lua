local turn       = require "library.turn"
local coordinate = require "library.coordinate"

local traverse = {}
local traverse.uTurn = {}
local traverse.location = {}

local function traverse.forward (iterations)

    if iterations == nil then

        iterations = 1

    end

    for i=1, iterations do

        turtle.forward()
        
        coordinate.forward()

    end

end

local function traverse.backward (iterations)

    if iterations == nil then

        iterations = 1

    end

    for i=1, iterations do
        
        turtle.back()

        coordinate.backward()

    end

end

local function traverse.up (iterations)

    if iterations == nil then

        iterations = 1

    end

    for i=1, iterations do

        turtle.up()

    end

end

local function traverse.down (iterations)

    if iterations == nil then

        iterations = 1

    end

    for i=1, iterations do

        turtle.down()

    end
    
end

local function traverse.from (coordinate)

    traverse.location.from = coordinate

end

local function traverse.to (coordinate)

    traverse.location.to = coordinate

end

local function traverse.travel ()

    

end

local function traverse.uTurn.right () 

    turn.right()
    traverse.forward()
    turn.right()

    coordinate.flip()

end

local function traverse.uTurn.left ()

    turn.left()
    traverse.forward()
    turn.left()

    coordinate.flip()

end

return traverse
