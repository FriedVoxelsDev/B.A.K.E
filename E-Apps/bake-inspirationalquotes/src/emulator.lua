-----------------------------------------------------------------------------------------------------------------------------
local LuaGObject = require('LuaGObject') -- utilizes to LuaGObject
local Gtk = LuaGObject.require('Gtk', '3.0') -- utilizes Gtk 3.0
local GLib = LuaGObject.require('GLib') --imports Glib(i think so it can manage timers properly)
local Pango = LuaGObject.require('Pango') -- utilizes pango to make widgets look better
local quotes = require('src.quotes') -- sync to quotes
local config = require('src.config')

---------------------------------------------------------------------------------------------------------------------------

local my_fontspecs = Pango.FontDescription.from_string('Sans-Serif 18') --declares the font and size being sans-serif and font size 24pts

---------------------------------------------------------------------------------------------------------------------------

local window = Gtk.Window { --creates window
    title = "B.A.K.E Simulation", --title
    default_width = 768, --width
    default_height = 1024, --height
    window_position = Gtk.WindowPosition.CENTER, --window position
    on_destroy = Gtk.main_quit --deletes window when closed

}

----------------------------------------------------------------------------------------------------------------------------

local appname = Gtk.Label { -- creates label

    label = 'Wello Horld', --placeholder text
    wrap = true, --allows the text to fit on screen without resizing
    justify = Gtk.Justification.CENTER, --keeps text in center
    margin = 30

}
-----------------------------------------------------------------------------------------------------------------------------

local opacity = 0 --creates and sets opacity to true

local function fade_in() --function to define / add opacity

    opacity = math.min(opacity + 0.01 , 1) --changes opacity by 0.01 per frame
    appname.opacity = opacity --applies oppacity to label

    if opacity < 1 then --checks if opacity is less than 1, if it is proceed until 1
        return true
    end

    return false -- finishes immediately when its 1

end
-----------------------------------------------------------------------------------------------------------------------------

local function update_quote() --updates screen

    local file = io.open('src/state.txt', 'r') --opens file

    if file then --

        local text = file:read('*a') -- reads it
        file:close()                 --closes it

        if text and text ~= "" then -- checks if file exists and if file isn't empty

            appname:override_font(my_fontspecs)
            appname.label = text -- defines label as the text variable -- if the file isn't empty, it proceeds

            opacity = 0
            appname.opacity = 0

            GLib.timeout_add(GLib.PRIORITY_DEFAULT, 5, fade_in)

        end

    end

    return true --returns as true which continues the loop

end

update_quote() -- updates quotes first

GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, config.cycletime, update_quote) -- checks file every 1 second

-----------------------------------------------------------------------------------------------------------------------------

window:add(appname)
window:show_all()
Gtk.main()

-----------------------------------------------------------------------------------------------------------------------------
