local chop      =   require "library.chop"
local trim      =   require "library.trim"
local detect    =   require "library.detect"
local traverse  =   require "library.traverse"

tree = {}

function tree.hasGrown (log)

    return detect.front(log)

end

function tree.fell (log, leaves)
    
    local height = 0

    while detect.front(log) do

        chop.front()

        if detect.up(leaves) then

            trim.up()

        end

        traverse.up()

        height = height + 1

    end

    traverse.down(height)

end

return tree
