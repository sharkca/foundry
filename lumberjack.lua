-- Every function that can be reused
-- Should be placed in a file of it's own. 

local log       = "minecraft:spruce_log"
local chest     = "minecraft:chest"
local leaves    = "minecraft:spruce_leaves"
local sapling   = "minecraft:spruce_sapling"
local charcol   = "minecraft:charcoal"

-- Block 

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

function harvest (action, direction)
    if direction == "forward" then

        turtle.dig()

    elseif direction == "up" then

        turtle.digUp()

    elseif direction == "down" then

        turtle.digDown()

    end

    print("> " .. action .. " " .. direction)
end

-- Movement

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

    elseif direction == "back" then

        turtle.back()

    elseif direction == "up" then

        turtle.up()

    elseif direction == "down" then

        turtle.down()

    end
    
    print("> Moved " .. direction)
end

-- Tree Processing 

function chop (direction)
    harvest("chop", direction)
end

function trim (direction)
    harvest("trim", direction)
end

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
        if chestContains(charcoal) then

            retrieveFromChest(charcoal, 30)

            refuelTurtle(charcoal, 30)

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
    -- Check if log exists in front plot,
    while detect(log, "front") do

        print("> Can't plant sapling. Log in the way.")
        print("> Pausing for 30 seconds.")

        sleep(30)

    end

    turn("around")

    -- Check if chest exists in front,
    while not detect(chest, "front") do

        print("> There isn't a inventory chest.")
        print("> Pausing for 30 seconds.")

        sleep(30)

    end

    -- Check if sapling exists in chest
    while not inventoryContain(sapling) do
        if chestContains(sapling); then

            retrieveFromChest(sapling, 1)

        else

            print("> No sapling in chest.")
            print("> Pausing for 30 seconds")

            sleep(30)

        end
    end

    turn("around")

    -- Plant a sapling. 
    plant(sapling)
    
    print("> Planted Sapling")
end

-- After trimming, felling, & planting
-- Dump inventory into chest. 
function dumpHarvest ()
    
end

-- Main

while lumberJack() do
    if fuelLevelLow() then

        replenishFuel()

    end

    if treeHasGrown() then

        processTree()

        plantSapling()

        dumpHarvest()

    end
end
