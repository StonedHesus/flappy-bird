--[[

    Author : Andrei-Paul Ionescu.
]]

PlayState = Class{__includes = State}


function PlayState:init()
    self.bird = Bird()
    self.pipePairs = {}
    self.timer = 0
    self.score = 0
end

--[[
    The draw method of the current state is responsible for invoking the draw routine of each of the 
    pipe pairs, but also for ensuring that the score prompt and the bird component are also rendered to the screen.
]]
function PlayState:draw()
    for index, pair in pairs(self.pipePairs) do
        pair:draw()
    end

    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:draw()
end

--[[
    Called when we first transition to this state from another state.
    This will ensure that the behaviour of the state commences upon entry within the state.
]]
function PlayState:enter() 
    scrolling = true
end

--[[
    This routine is invoked everytime we transition to another state, generally this has to do with either the fact that 
    the game was lost, or that the game was paused.
]]
function PlayState:exit()
    scrolling = false
end