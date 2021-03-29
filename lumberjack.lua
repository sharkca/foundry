function detectLog (direction)

    local blockInfo = ""

    if direction == "front" then

        success, blockInfo = turtle.inspect()

        print("> Inspected Block in Front")

    elseif direction == "up" then

        success, blockInfo = turtle.inspectUp()

        print("> Inspected Block Above")

    elseif direction == "down" then

        success, blockInfo = turtle.inspectDown()

        print("> Inspected Block Below")

    end

    if blockInfo.name == "minecraft:spruce_log" then

        print("> Detected Log")

        return true

    else

        print("> Did Not Detect Log")

        return false

    end

end

function detectLeaves (direction)

    local blockInfo = ""

    if direction == "front" then

        success, blockInfo = turtle.inspect()

        print("> Inspected Block in Front")

    elseif direction == "up" then

        success, blockInfo = turtle.inspectUp()

        print("> Inspected Block Above")

    elseif direction == "down" then

        success, blockInfo = turtle.inspectDown()

        print("> Inspected Block Below")

    end

    if blockInfo.name == "minecraft:spruce_leaves" then

        print("> Detected Leaves")

        return true

    else

        print("> Did Not Detect Leaves")

        return false

    end
end

function chop (direction)

    if direction == "forward" then

        turtle.dig()

        print("> Chopped Log in Front")

    elseif direction == "up" then

        turtle.digUp()

        print("> Chopped Log Above")

    elseif direction == "down" then

        turtle.digDown()

        print("> Chopped Log Below")
    else

        print ("> Unknown Direction")

    end

end

function trim (direction)

    if direction == "front" then

        turtle.dig()

        print("> Trimmed Leaves in Front")

    elseif direction == "up" then

        turtle.digUp()

        print("> Trimmed Leaves Above")

    elseif direction == "down" then

        turtle.digDown()

        print("> Trimmed Leaves Below")

    else

        print ("> Unknown Direction")

    end

end

function turn (direction)

    if direction == "right" then

        turtle.turnRight()

    elseif direction == "left" then

        turtle.turnLeft()

    elseif direction == "around" then

        turtle.turnRight()
        turtle.turnRight()

    end

end

function traverse (direction)

    if direction == "forward" then

        turtle.forward()

        print("> Moved Forward")

    elseif direction == "back" then

        turtle.back()

        print("> Moved Back")

    elseif direction == "up" then

        turtle.up()

        print("> Moved Up")

    elseif direction == "down" then

        turtle.down()

        print("> Moved Down")
    end

end

function trimAroundTree ()

    local layer = 1

    -- Determine total layers.
    turn("around")

    while detectLeaves("front") do

        trim("front")
        traverse("forward")

        layer = layer + 1

    end

    -- Face leaves on right.
    turn("right")

    -- Repeat until layer is less than 1
    repeat

        local perimeter = layer * 8
        local sideLength = perimeter / 4
        local halfSideLength = sideLength / 2

        print("> The perimeter of the square is: " .. perimeter)
        print("> The length of a side: " .. sideLength)
        print("> The half length of a side: " .. halfSideLength)

        -- The first iteration traverse half the length.
        for i=1, halfSideLength do

            trim("front")
            traverse("forward")

        end

        turn("right")

        -- For the next 3 iterations traverse full length & turn right.
        for i = 1, 3 do
            for i = 1, sideLength do

                trim("front")
                traverse("forward")

            end

            turn("right")

        end

        -- On the last iteration traverse half the length.
        for i=1, halfSideLength do

            trim("front")
            traverse("forward")

        end

        -- If there is more than one layer left
        -- Turn right, move forward, & turn right
        -- Else turn right
        if layer > 1 then

            turn("right")
            traverse("forward")
            turn("left")

        else

            turn("right")

        end

        -- reduce layer by 1
        layer = layer - 1

    until layer <= 0

    -- Face the log.
    while not detectLog("front") do

        turn("right")

    end
end

-- Main

while detectLog("front") do
    if detectLeaves("up") then

        trim("up")
        traverse("up")

        trimAroundTree()

    else

        traverse("up")

    end
end

traverse("forward")

while detectLog("down") do

    chop("down")

end
