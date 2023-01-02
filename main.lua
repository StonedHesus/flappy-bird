--[[
    This here compilation unit serves the role of the runner of the game, i.e. it is the unit in which we 
    will invoke Löve2D methods which allow us to set up the initial behaviour of the view, i.e. what's going 
    to happen when the view is first loaded. In addition to that, it is here that we will also define how the 
    game behaves to frame changes.

    @author Andrei-Paul Ionescu.
]]

-- Load the required external libraries.
push = require './lib/push'
Class = require './lib/class' -- This library will allow us to interact with class in a Python like manner.

-- Import the required classes.
require 'src/components/Bird'
require 'src/components/PipePair'

-- We define four global constants, whose scope is limited to the current file, which indicate the dimensions 
-- for the screen, both the default ones and the virtual ones, that we will require to pass to the push 
-- library so as to obtain a properly constructed view.
local DEFAULT_SCREEN_WIDTH  = 1280
local DEFAULT_SCREEN_HEIGHT = 720
local VIRTUAL_WIDTH  = 512
local VIRTUAL_HEIGHT = 288

-- Define two additional global constants, which have again a scope limited to the current file only; which
-- indicate the speed of the background sprite and the speed of the ground sprite.
-- This values exist due to the sole fact that we have to implement a parallax scrolling so as to ensure that 
-- the game provides the illusion of constantly moving onwards towards some destination on the right side 
-- of the screen.
local BACKGROUND_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

-- Define a global constant, whose scope is yet again this file only, which will contain the title of the 
-- view, in this case that coincides with the title of the game.
local DEFAULT_VIEW_TITLE = "Flappy Bird"

-- Define two new variables which will contain the background sprite and the current X position of 
-- the background.
local backgroundDayView = love.graphics.newImage('resources/sprites/background.png')
local backgroundScroll  = 0

-- Define two new variables which will contain the ground sprite and the current X position of the ground.
local ground = love.graphics.newImage('resources/sprites/ground.png')
local groundScroll = 0

-- Define the looping point for the parallax animation.
local backgroundLoopingPoint = 413

-- Define a global flag which indicates whether we ought to keep scrolling or not.
local scrolling = true

--[[
    Describe the behaviour which the program, chiefly the view, ought to have when the application is
    launched.

    Therefore, this method is invoked one sole time by Löve2D.

    Inside it we will initialise all the required objects, we will define the default behaviour of those 
    game components, and of environmental ones, such as the screen.

    @author Andrei-Paul Ionescu.
]]
function love.load()

    -- Set the default filter which will be applied to the view.
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Define the initial behaviour of the screen.
    -- When launched, the size of the screen ought to be the one indicated by the global constant values.
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, DEFAULT_SCREEN_WIDTH, DEFAULT_SCREEN_HEIGHT,{
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    --Initialise the required game components, and pass to them the default values for their properties, if required.
    bird = Bird(push:getWidth())

    -- Set the title of the view to equal to the contents of the VIEW_TITLE global constant.
    love.window.setTitle(DEFAULT_VIEW_TITLE)
end

--[[
    @param deltaTime, indicates the amount of time between each two consecutive frames.

    Describe the behaviour which the program ought to have when one unit of time, i.e. a frame has elapsed.
    The unit of time is indicated by the argument deltaTime, which Löve2D is going to provide.

    @author Andrei-Paul Ionescu.
]]
function love.update(deltaTime)
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * deltaTime) 
        % backgroundLoopingPoint

    groundScroll = (groundScroll + GROUND_SCROLL_SPEED * deltaTime) 
        % VIRTUAL_WIDTH
end

--[[
    Describe the set of rules for the elements which need to be drawn to the screen.
    In addition, indicate certain constraints regarding when each drawing ought to be made.

    @author Andrei-Paul Ionescu.
]]
function love.draw()
    -- Define a state machine which is comprised of the collection of rules that we ought to follow 
    -- for each frame so as to render the visuals in accordance to different events which might have 
    -- been triggered within the program.

    -- Begin rendering.
    push:start()
    
    -- Draw the background and ground sprite.
    -- This two sprite create a Parallax effect.
    love.graphics.draw(backgroundDayView, -backgroundScroll, 0)
    love.graphics.draw(ground, -groundScroll, VIRTUAL_HEIGHT - 16)

    -- Draw the bird game object to the screen at its current location.
    bird:draw()

    -- Conclude the rendering process.
    push:finish()
end

--[[
    @param width; the width of the current view, which can differ from the initial width.
    @param height; the height of the current view, which can differ from the initial height.

    This method is responsible for scaling the view, and implicitly all the visual components within.

    Due to the fact that we are utilising the push library so as to deal with view management, we will pass the newly modified width
    and height values to push's resize method, which, since it keeps track of the previous dimensions of the screen, will now 
    automagically what to do so as to ensure proper rendering for the new dimensions.

    @author Andrei-Paul Ionescu.
]]
function love.resize(width, height)
    push:resize(width, height)
end

--[[
    @param key; a string indicating which key of the keyboard was pressed.

    Handle keyboard events. This method is invoked by Löve2D each frame.
    The key parameter contains the intercepted key event object which the user provided.

    @author Andrei-Paul Ionescu.
]]
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
