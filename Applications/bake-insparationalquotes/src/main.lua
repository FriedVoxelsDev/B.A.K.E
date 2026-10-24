local quotes = require('src.quotes')   -- connects to local "Quotes API"
local maxquotes = 20
local currentquote = math.random(1, maxquotes) -- local variable defining the quote being displayed on random.

print(quotes[currentquote].text)     -- display the currentquote in the terminal
