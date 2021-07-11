detect = {}

local blockInfo = ""

local function compareBlock (block, blockInfo) 

    if blockInfo.name == block then

        return true

    else

        return false

    end
end

function detect.front (block)

    success, blockInfo = turtle.inspect()

    return compareBlock(block, blockInfo)
end

function detect.up (block)

    success, blockInfo = turtle.inspectUp()

    return compareBlock(block, blockInfo)
end

function detect.down (block)

    success, blockInfo = turtle.inspectDown()

    return compareBlock(block, blockInfo)
end

return detect
