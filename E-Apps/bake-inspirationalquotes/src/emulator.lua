-----------------------------------------------------------------------------------------------------------------------------

local LuaGObject = require('LuaGObject') -- utilizes to LuaGObject
local Gtk = LuaGObject.require('Gtk', '3.0') -- utilizes Gtk 3.0
local GLib = LuaGObject.require('GLib') --imports Glib(i think so it can manage timers properly)
local quotes = require('src.quotes') -- sync to quotes

---------------------------------------------------------------------------------------------------------------------------

local window = Gtk.Window { --creates window
    title = "B.A.K.E Simulation", --title
    default_width = 600, --width
    default_height = 960, --height
    window_position = Gtk.WindowPosition.CENTER, --window position
    on_destroy = Gtk.main_quit -- deletes window when closed

}

----------------------------------------------------------------------------------------------------------------------------

local appname = Gtk.Label { -- creates label

    label = 'Wello Horld' --placeholder text

}

-----------------------------------------------------------------------------------------------------------------------------

local function update_quote() --updates screen

    local file = io.open('src/state.txt', 'r') --opens file

    if file then

        local text = file:read('*a') -- reads it
        file:close()                 --closes it

        if text and text ~= "" then -- checks if file exists and if file isn't empty
            appname.label = text -- defines label as the text variable -- if the file isn't empty, it proceeds
        end

    end

    return true --returns as true which continues the loop

end


GLib.timeout_add_seconds(GLib.PRIORITY_DEFAULT, 1, update_quote) -- checks file every 1 second

-----------------------------------------------------------------------------------------------------------------------------

window:add(appname)
window:show_all()
Gtk.main()

-----------------------------------------------------------------------------------------------------------------------------
