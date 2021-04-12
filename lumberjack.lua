local log       = "minecraft:spruce_log"
local chest     = "minecraft:chest"
local leaves    = "minecraft:spruce_leaves"

-- Block Detection

function detect (block, direction)

    local blockInfo = ""

    if direction == "front" then

        success, blockInfo = turtle.inspect()

    elseif direction == "up" then

        success, blockInfo = turtle.inspectUp()

    elseif direction == "down" then

        success, blockInfo = turtle.inspectDown()

    end

    print("> Inspected Block: " .. direction)

    if blockInfo.name == block then

        print("> Detected: " .. block)

        return true

    else

        print("> Did Not Detect: " .. block)

        return false

    end
end

-- Action

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

-- Tree Processing 

function trimAroundTree ()

    local layer = 1

    -- Determine total layers.
    turn("around")

    while detect(leaves, "front") do

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
end

function processTree ()
    while detect(log, "front") do
        if detect(leaves, "up") then

            trim("up")
            traverse("up")
            trimAroundTree()

        else

            traverse("up")

        end
    end

    if detect(leaves, "front") then

        trim("front")
        traverse("forward")

    end

    while detect(log, "down") do

        chop("down")
        traverse("down")

    end
end

function replenishFuel () 

    turn("around")

    while not detect(chest, "front") do

        print("> There isn't a inventory chest.")
        print("> Pausing for 30 seconds.")

        sleep(30)

    end

    while fuelLevelLow() do
        if chestContainFuel() then

            refuelFromChest()

        else

            print("> The chest does not contain fuel.")
            print("> Pausing for 30 seconds.")

            sleep(30)

        end
    end

    turn("around")

end

function plantSapling ()
    -- After trimming and felling a tree
    -- And no log exists
    -- Plant a sapling. 
end

function dumpInventory ()
    -- After trimming, felling, & planting
    -- Dump inventory into chest. 
end

-- Main

while lumberJack() do
    if fuelLevelLow() then

        replenishFuel()

    end

    if treeHasGrown() then

        processTree()

        plantSapling()

        dumpInventory()

    end
end
