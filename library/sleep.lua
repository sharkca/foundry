local day.seconds = 86400

sleep = {}

function sleep.days (days)

    os.sleep(day.seconds * days)

end

return sleep
