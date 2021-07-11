inventory = {}

function inventory.selectSlot (slot)
    turtle.select(slot)
end

function inventory.slotContains (item) 
    local itemInfo = turtle.getItemDetail()

    if itemInfo.name == item then 
        return true
    else
        return false
    end
end

return inventory
