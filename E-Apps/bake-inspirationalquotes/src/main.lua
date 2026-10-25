-----------------------------------------------------------------------------------------------------------------------------

local quotes = require('src.quotes')   -- connects to local "Quotes API"
local config = require('src.config')

-----------------------------------------------------------------------------------------------------------------------------

math.randomseed(os.time()) -- sets up timer

while true do --basically a forever loop cuz it checks for nothing, nice!

    local currentquote = math.random(1, config.maxquotes) -- local variable defining the quote being displayed on random.

    print(quotes[currentquote].text) -- display the currentquote in the terminal

    --writes the current quote in a state.txt file
    local file = io.open('src/state.txt', 'w')
    file:write(quotes[currentquote].text)
    file:close()

    local success = os.execute('sleep ' ..config.cycletime) -- waits 5 seconds & sets success to the 5 second command

    if not success then --Allows me to stop terminal from proceeding.
        print('\nStopping application...') break
    end
end

-----------------------------------------------------------------------------------------------------------------------------
