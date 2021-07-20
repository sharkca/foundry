local coordinate = require "library.coordinate"

local turn = {}

local function turn.right ()

    turtle.turnRight()

    coordinate.right()

end

local function turn.left ()

    turtle.turnLeft()
    
    coordinate.left()

end

local function turn.around ()

    turtle.turnRight()
    turtle.turnRight()

    coordinate.right()
    coordinate.right()

end

return turn
