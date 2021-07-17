inventory = {}

function inventory.slot.select (slot)
    
    turtle.select(slot)

end

function inventory.slot.contains (item) 

    local itemInfo = turtle.getItemDetail()

    if itemInfo.name == item then 

        return true

    else

        return false
    end
end

return inventory
