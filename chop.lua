function trim ()
    print("Trimmming the Tree")

    cycle = 0

    repeat
        cycle = cycle + 1

        if turtle.detectUp() then

            turtle.digUp()
            turtle.up()

            for i = 3, 1, -1 do
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
                turtle.dig()

                turtle.turnRight()
                turtle.turnRight()

                turtle.forward()
            end

        else
            turtle.up()
        end
    until ( cycle > 2 )
end

trim()
