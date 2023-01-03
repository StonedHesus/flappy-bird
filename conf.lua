require 'src.constants'

function love.conf(table)
    table.window.title = GAME_TITLE
    -- Indicate the Lua version for which this software was developed.
    table.version = "11.4"
    table.gammacorrect = true 
    table.window.highdpi = false
end