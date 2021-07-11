local inventory = require "library.inventory"

plant = {}

function plant.sapling(sapling)

    inventory.selectSlot(2)

    if inventory.slotContains(sapling) then
        turtle.place()
    end

    inventory.selectSlot(1)

end

return plant
