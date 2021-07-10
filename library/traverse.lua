traverse = {}

function traverse.forward (iterations)
    if iterations == nil then
        iterations = 1
    end

    for i=1, iterations do
        turtle.forward()
    end
end

function traverse.backward (iterations)
    if iterations == nil then
        iterations = 1
    end

    for i=1, iterations do
        turtle.back()
    end
end

function traverse.up (iterations)
    if iterations == nil then
        iterations = 1
    end

    for i=1, iterations do
        turtle.up()
    end
end

function traverse.down (iterations)
    if iterations == nil then
        iterations = 1
    end

    for i=1, iterations do
        turtle.down()
    end
end

return traverse
