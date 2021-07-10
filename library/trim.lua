local harvest = require "library.harvest"

trim = {}

function trim.forward()
    harvest.forward()
end

function trim.up()
    harvest.up()
end

function trim.down()
    harvest.down()
end

return trim
