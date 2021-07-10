local harvest = require "library.harvest"

chop = {}

function chop.front()
    harvest.front()
end

function chop.up()
    harvest.up()
end

function chop.down()
    harvest.down()
end

return chop
