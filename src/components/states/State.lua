--[[

    This here compilation unit models the abstract representation of a State.
    Therefore, each state which we will define ought to extend this here class, whose role is indentical to that 
    of an abstract class in languages such as Java. 
    The class defined the prototypes of the methods which make up the API of the State. Each one of these methods 
    ought to be overriden by the state which extends the class, so that they behave in accordance with the desired 
    specification for that particular state.

    Author : Andrei-Paul Ionescu.
]]

State = Class{}

function State:init() end
function State:enter() end
function State:exit() end
function State:update(deltaTime) end
function State:draw() end