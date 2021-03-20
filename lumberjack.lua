function detectLog () 
    print("> Detected Log in Front")
end

function detectLeaves () 
    print("> Detected Leaves in Above")
end

function trim () 
    print("> Trimmed Leaves Above")
end

function traverse ()
    print("> Moved Up")
end

function traverse ()

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
