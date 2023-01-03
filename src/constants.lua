--[[
--  This here Lua compilation unit contains a collection of constants which are utilised throughout the software. 
--  Since these constants do not particularly belong to any of the components we are going to create and manipulate throughout the software,
--  they are going to be stored within this unit, despite the fact that this creates an anti-pattern dependency within our code. 
--  Due to Lua's lack of support for interfaces, such as the one present in Java, we would be better off by using this here anti-pattern,
--  for by doing so, we reduce the likelyhood of coupling, since we don't need to store a reference to an object that stores one of these constants.
--
--  Author: Andrei-Paul Ionescu
--]]

GAME_TITLE = "Flappy Bird"

-- We define four global constants, whose scope is limited to the current file, which indicate the dimensions 
-- for the screen, both the default ones and the virtual ones, that we will require to pass to the push 
-- library so as to obtain a properly constructed view.
DEFAULT_SCREEN_WIDTH  = 1280
DEFAULT_SCREEN_HEIGHT = 720
VIRTUAL_WIDTH  = 512
VIRTUAL_HEIGHT = 288