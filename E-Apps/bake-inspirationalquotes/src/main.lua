-----------------------------------------------------------------------------------------------------------------------------

local kindle_exists = (os.getenv('kindle_exists') == '1' ) -- uses run.sh's kindle existence to determin where to run from
local quotes = require('src.quotes')   -- connects to local "Quotes API"
local config = require('src.config') -- utilizes variable/global variable from config

-----------------------------------------------------------------------------------------------------------------------------

math.randomseed(os.time()) -- sets up timer

if kindle_exists then

    while true do --basically a forever loop cuz it checks for nothing, nice!

        local currentquote = math.random(1, config.maxquotes) -- local variable defining the quote being displayed on random.

        print(quotes[currentquote].text) -- display the currentquote in the terminal

            os.execute(string.format('fbink -q -c -m %q', quotes[currentquote].text))

        local success = os.execute('sleep ' ..config.cycletime) -- waits 5 seconds & sets success to the 5 second command

        if not success then --Allows me to stop terminal from proceeding.
            print('\nStopping application...') break
        end
    end

else

    while true do --basically a forever loop cuz it checks for nothing, nice!

        local currentquote = math.random(1, config.maxquotes) -- local variable defining the quote being displayed on random.

        print(quotes[currentquote].text) -- display the currentquote in the terminal
        print(quotes[currentquote].author)
        --writes the current quote in a state.txt file
        local file = io.open('src/state.txt', 'w') --opens
        file:write(quotes[currentquote].text) --writes quote
        file:write(quotes[currentquote].author) --writes author
        file:close() --closes

        local success = os.execute('sleep ' ..config.cycletime) -- waits 5 seconds & sets success to the 5 second command

        if not success then --Allows me to stop terminal from proceeding.
            print('\nStopping application...') break
        end
    end

end
-----------------------------------------------------------------------------------------------------------------------------
