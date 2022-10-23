--[[
    This here compilation unit models the bird game object.

    @author Andrei-Paul Ionescu.
]]

-- Inform the environment that Bird indicates a class.
Bird = Class{}

-- Define two global constants, whose scope is the current file, i.e. only bird objects will be able to access this information, thus 
-- their behaviour is similar to a static private attribute in Java.
local GRAVITY = 20 -- The value of the gravitational pull.
local ANTI_GRAVITY = -5 -- The value of the bird's opposing force.

--[[
    @param image; a love.graphics image object.
    @param width; the width of the sprite.
    @param height; the height of the sprite.
    @param x; the x coordinate of the top left corner.
    @param y; the y coordinate of the top left corner.
    @param deltaY; the velocity of the game object on the Y-axis.

    This is the sole constructor provided for the class.

    Its role is simply to initialise the attributes which are going to be present in the object's table 
    with the values inferred by the sprite. 

    This values are extracted with the aid of the fact that love.graphics.newImage() returns an image object whose API we can 
    utilise so as to initialise the other attributes, hence that explains why no external, i.e. user provided arguments are needed.

    In addition to this, the constructor also initialises the deltaY value with its default value of 0.

    @author Andrei-Paul Ionescu.
]]
function Bird:init(width)
    self.image  = love.graphics.newImage('resources/sprites/bird.png')
    self.width  = self.image:getWidth()
    self.height = self.image:getHeight()

    self.x = width / 2 - (self.width - 2)
    self.y = width / 2 - (self.height - 2)

    self.deltaY = 0
end

--[[
    This routine is responsible for drawing the bird object to the screen.

    In order to achieve this, the method invokes Löve2D's graphics.draw() method with the signature (sprite, x, y).
    This will have the effect of drawing our sprite at the current x and y coordinates, which by default are the centre of the screen.

    @author Andrei-Paul Ionescu.
]]
function Bird:draw()
    love.graphics.draw(self.image, self.x, self.y)
end