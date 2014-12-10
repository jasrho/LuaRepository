-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- scratch ticket app ideaa
-- https://www.youtube.com/watch?v=lyRk6GnnQMI&t=8
-- in addition to slots, gambling, pachinko/plinko, keno, etc... games - 
-- do like the crazy japanese jackpot winner:  x2, x3, muultiple screens, etc...
-- https://www.youtube.com/watch?v=i0OnmhhFk9g
-- have a background wait screen like the old arcade games, that plays in the backgrounds

--particle disigner
--http://www.reddit.com/r/CoronaSDK/comments/21w42o/free_alternative_to_particle_designer/
--idea for time waster - wood burning app (like with a magnifying glass)
--also the oddlysatisfying app (polishing, cleaning, straigtening, orgamizing, perfect fit,etc...)

-- Programming in Lua First Edition
-- http://www.lua.org/pil/contents.html#1

-- Learnning Lua
-- http://lua-users.org/wiki/LearningLua

-- http://www.reddit.com/r/CoronaSDK/

-- Corona University 
-- http://coronalabs.com/resources/tutorials/getting-started-with-corona/

-- Your code here

-- Hello World

-- print is use to output messages ONLY to the Corona Simulator Console -0 use for debugging
print("Hello World!")

-- Lua lexical Conventions
-- http://www.lua.org/pil/1.3.html
-- Getting Started
-- http://www.lua.org/pil/contents.html#1

--SCOPE - http://omnigeek.robmiracle.com/2011/10/14/understanding-scope-for-beginning-programmers/
--    Global – A global variable is available everywhere.
--    Local – A local variable only exists within the block or chunk of code where it’s defined.
--    Block – A generic term for a block of code. In Lua, these are sometimes referred to as chunks.
--    Namespace –namespace is a term applied to the area where a given variable’s name is active or in context.

-- \a	bell
-- \b	back space
-- \f	form feed
-- \n	newline
-- \r	carriage return
-- \t	horizontal tab
-- \v	vertical tab
-- \\	backslash
-- \"	double quote
-- \'	single quote
-- \[	left square bracket
-- \]	right square bracket

print("one line\nnext line\n\"in quotes\", 'in quotes'")

-- this will output to the Corona Graphical Simulator
                  -- display.newText( string, x, y, font, size )
--local myTextObject = display.newText( "Hello World!", 160, 220, "Arial", 40 )
local myTextObject2 = display.newText( 'Click to\nChange Color', 160, 240, "Arial", 40 )
local myTextObject3 = display.newText( "current display", 160, 300, "Arial", 40)
local myTextObject4 = display.newText( "540x960", 160, 340, "Arial", 40)

--About "Dot" Notation
--To access an item from a library, use this notation consistently:
--[library].[API]
--This tells Corona that you wish to "access" the chosen library then "use" the chosen API. You must always specify the library first, then a dot (period), then the API. This is known as a property relationship.

--Setting Text Color
--Now let's discuss how to modify the color of your text. Notice that the newText API does not include parameters to set the color directly. To accomplish this, you will need to use another command:
--[object]:setFillColor( r, g, b )
-- colors http://en.wikipedia.org/wiki/Web_colors#X11_color_names
--myTextObject:setFillColor(0,1,1) --throws error if object is not instantiated
myTextObject2:setFillColor(1,0,1)
myTextObject3:setFillColor(255,192,203) -- isthere a way to do hex?


-- CTRL+R to relaunch Simulator



-- FUNCITONS

function screenTap()
    local r = math.random( 0, 100 )
    local g = math.random( 0, 100 )
    local b = math.random( 0, 100 )
    myTextObject2:setFillColor( r/100, g/100, b/100 )
end

-- Event Listener
-- Next, you need to add a Corona event listener to create interactivity. Add this line to your project on the line after the function's end line:

display.currentStage:addEventListener( "tap", screenTap )
display.



-- continue with Rapid Physics
-- http://docs.coronalabs.com/guide/start/helloWorld/index.html
