local chop      =   require "library.turtle.chop"
local trim      =   require "library.turtle.trim"
local tree      =   require "library.turtle.tree"
local detect    =   require "library.turtle.detect"
local traverse  =   require "library.turtle.traverse"

tree = {}

function tree.hasGrown ()

    return detect.front(spruceLog)

end

function tree.fell ()

    while detect.front(spruceLog) do

        chop.forward()

        if detect.up(spruceLeaves) then

            trim.up()

        end

        traverse.up()

    end

end

return tree
