--[[
    This compilation unit contains the model of the Pipe game object.

    @author Andrei-Paul Ionescu.
]]

-- Inform the environment that Pipe is a class.
Pipe = Class{}

-- Utilise Löve2D's framework so as to insantiate a new Image object which will be stored within the PIPE_SPRITE variable.
-- We define the sprite so as to essentially immitate a private static declaration in Java.
-- This will ensure us that the sprite is only loaded once, therefore reducing overhead when instantiating each new pipe.
local PIPE_SPRITE = love.graphics.newImage('./../../resources/sprites/pipe.png')

-- Define yet another local scope variable, which indicates the speed at which the pipes will move.
local PIPE_SCROLL_SPEED = 60

--[[
    @param orientation {boolean} - a boolean primitive value which indicates whether the pipe is set to appear from the top
                                   or from the bottom. We chose utilising a boolean since there are two sole possible position
                                   where a pipe could be place, relative width of the screen.
                                
    @param xCoordinate {number} - an integer value which indicates the x-axis location at which the pipe will be drawn initially.
    @param yCoordinate {number} - an integer value which indicates the y-axis location at which the pipe will be drawn initially.

    This is the sole constructor provided for the class.

    Its role is simply to initialise the attributes which are going to be present in the object's table
    with the values provided by the formal arguments, and those inferred from the sprite.

    @author Andrei-Paul Ionescu.
]]
function Pipe:init(orientation, xCoordinate, yCoordinate)
    self.x = xCoordinate
    self.y = yCoordinate

    self.width  = PIPE_SPRITE:getWidth()
    self.height = PIPE_SPRITE:getHeight()

    self.orientation = orientation
end

--[[
    @param deltaTime {number} - the amount of time that elapsed betwixttwo consectuive frames.

    @author Andrei-Paul Ionescu.
]]
function Pipe:update(deltaTime)
end

--[[
    
    This routine is responsible for drawing the pipe object to the screen.

    In order to achieve this, the method invokes Löve2D's graphics.draw() routine that corresponds to the signature
    (sprite, x, y, , ,).
    
    This will have the effect of drawing our sprite at the object's current x and y coordinates, whilst also
    making sure that the orientation of the pipe is respected.

    @author Andrei-Paul Ionescu
]]
function Pipe:draw()
    love.graphics.draw(
        PIPE_SPRITE, 
        self.x,
        (self.orientation == true and self.y + self.height or self.y),
        0,
        1,
        self.orientation == true and -1 or 1
    )
end