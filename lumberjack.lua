function trim (direction) 

    if direction == "forward" then

        turtle.dig()

        print("> Trimmed Leaves in Front")

    elseif direction == "up" then

        turtle.digUp()

        print("> Trimmed Leaves Above")

    elseif direction == "down" then

        turtle.digDown()

        print("> Trimmed Leaves Below")
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
    local iteration = 5

    -- Determine total layers. 
    turn("around")

    while detectLeaves("front") do

        trim("front")
        traverse("forward")

        layer = layer + 1

    end

    turn("right")

    -- Repeat until layer equals 1
    repeat 
        -- Repeat code 5 times
        for i=1, iteration do

            local perimeter = layer * 8
            local length = perimeter / 4

            -- The first iteration traverse half the length. 
            -- For the next 3 iterations traverse full length. 
            -- On the last iteration traverse half the length. 
            if (iteration == 1) or (iteration == 5) then
                for i=1, length/2 do
                    if detectLeaves("front") then
                        trim("front")
                    end

                    traverse("forward")
                end
            else
                if detectLeaves("front") then
                    trim("front")
                end

                traverse("forward")
            end

            turn("right")
        end

        -- Position for next layer
        move("forward")
        turn("left")

    until layer == 1

    -- Face the log.
    while not detectLog("front") do

        turn("right")

    end
end

// Main

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
