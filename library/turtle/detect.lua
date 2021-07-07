detect = {}

local blockInfo = ""

function compareBlock (block, blockInfo) 

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

return detect
