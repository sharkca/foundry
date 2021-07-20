local coordinate = {}

local coordinate.x = 0
local coordinate.y = 0
local coordinate.z = 0
local coordinate.face = "north"

local function coordinate.fetch ()

    return {coordinate.x, coordinate.y, coordinate.z}

end

local function coordinate.forward ()

    if coordinate.face == "north" then
        
        coordinate.x = coordinate.x + 1

    end

    if coordinate.face == "east" then

        coordinate.y = coordinate.y + 1

    end

    if coordinate.face == "south" then

        coordinate.x = coordinate.x - 1

    end

    if coordinate.face == "west" then

        coordinate.y = coordinate.y - 1

    end

end

local function coordinate.backward ()

    if coordinate.face == "north" then
        
        coordinate.x = coordinate.x - 1

    end

    if coordinate.face == "east" then

        coordinate.y = coordinate.y - 1

    end

    if coordinate.face == "south" then

        coordinate.x = coordinate.x + 1

    end

    if coordinate.face == "west" then

        coordinate.y = coordinate.y + 1

    end

end

local function coordinate.right ()

    if coordinate.face == "north" then
        
        coordinate.face = "east"

    end

    if coordinate.face == "east" then

        coordinate.face = "south"

    end

    if coordinate.face == "south" then

        coordinate.face = "west"

    end

    if coordinate.face == "west" then

        coordinate.face == "north"

    end

end

local function coordinate.left ()

    if coordinate.face == "north" then
        
        coordinate.face = "west"

    end

    if coordinate.face == "east" then

        coordinate.face = "north"

    end

    if coordinate.face == "south" then

        coordinate.face = "east"

    end

    if coordinate.face == "west" then

        coordinate.face == "south"

    end

end

local function coordinate.flip ()

    if coordinate.face == "north" then
        
        coordinate.face = "south"

    end

    if coordinate.face == "east" then

        coordinate.face = "west"

    end

    if coordinate.face == "south" then

        coordinate.face = "north"

    end

    if coordinate.face == "west" then

        coordinate.face == "east"

    end

end

return coordinate
