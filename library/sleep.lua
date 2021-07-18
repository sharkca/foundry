local secondsInDay = 1200

sleep = {}

function sleep.days (days)

    os.sleep(secondsInDay * days)

end

return sleep
