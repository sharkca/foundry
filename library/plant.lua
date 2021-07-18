local inventory = require "library.inventory"

plant = {}

function plant.crop (seed)

    inventory.slotSelect(1)

    if inventory.slotContains(seed) then

        turtle.placeDown()

    end
end

function plant.sapling (sapling)

    inventory.slotSelect(2)

    if inventory.slotContains(sapling) then

        turtle.place()

    end

    inventory.slotSelect(1)

end

return plant
