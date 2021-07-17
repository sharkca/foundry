local inventory = require "library.inventory"

plant = {}

function plant.crop.down ()

    inventory.slot.select(1)

    if inventory.slot.contains(seed) then

        turtle.place()

    end
end

function plant.sapling (sapling)

    inventory.slot.select(2)

    if inventory.slot.contains(sapling) then

        turtle.place()

    end

    inventory.slot.select(1)

end

return plant
