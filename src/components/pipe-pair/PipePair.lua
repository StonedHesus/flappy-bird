--[[
    This compilation unit contains the model of the PipePair game object.

    @author Andrei-Paul Ionescu.
]]

-- Inform the environment that PipePair is a class.
PipePair = Class{}

local GAP_HEIGHT = 90

--[[

    @author Andrei-Paul Ionescu.
]]
function PipePair:init(xCoordinate, yCoordinate)
    
    self.x = xCoordinate + 32
    self.y = yCoordinate
    self.pipes = {
        ['upper'] = Pipe(true, xCoordinate, yCoordinate),
        ['lower'] = Pipe(false, xCoordinate, yCoordinate)
    }
    self.remove = false
end

--[[

    @author Andrei-Paul Ionescu.
]]
function PipePair:update(deltaTime)
end

--[[

    @author Andrei-Paul Ionescu.
]]
function PipePair:draw()
    for position, pipe in pairs(self.pipes) do
        pipe:draw()
    end
end