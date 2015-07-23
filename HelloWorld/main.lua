-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- online Lua Demo
-- http://www.lua.org/cgi-bin/demo

-- DEFINE FONT ON ALL WIDGETS - LOOKS FOR HELVELTICA AS DEFAULT, this shows as warning

-- double dash ( -- ) is inline COMMENT

--[[  
Everything between brackets is commented
--]]  -- this is how to do a BLOCK COMMENT

-- see here for Corona SDK Jobs
-- get an idea of what people are looking for?
-- what do i use my device for?
-- apps to make include meditation, slots, wifi browser/transfer save, 
-- Mountain View or Culver City would be alright @ 75K :) Look at Reno, Portland, Seattle

-- CHECK OUT
-- http://www.reddit.com/r/CoronaSDK/
-- http://coronalabs.com/blog/2013/05/28/tutorial-goodbye-globals/
-- http://producerism.com/blog/how-to-develop-in-corona-sdk-on-windows/


-- What can Corona publish to?  Android , Iphone, can do ipad air and mini (what are these)

-- Content Scaling
-- http://docs.coronalabs.com/daily/guide/basics/configSettings/index.html#content-scaling
-- how do I scale graphics correctly for all hardware?  Some will be anchors, others may be set points scales up or down depending on resoluttion
-- do i need to define each resolution base on screen size - see Common Screen Resolution
-- content area is also known as the stage

-- Sprite Animations
-- http://coronalabs.com/blog/2012/10/02/animated-sprites-and-methods/

-- Game Reference
-- http://www.raywenderlich.com/9303/how-to-make-a-game-like-jetpack-joyride-using-levelhelper-spritehelper-corona-edition-part-2

-- scratch ticket app ideaa
-- https://www.youtube.com/watch?v=lyRk6GnnQMI&t=8
-- in addition to slots, gambling, pachinko/plinko, keno, etc... games - 
-- do like the crazy japanese jackpot winner:  x2, x3, muultiple screens, etc...
-- https://www.youtube.com/watch?v=i0OnmhhFk9g
-- have a background wait screen like the old arcade games, that plays in the backgrounds
-- what else do people want? communication, entertainment, distraction, learning, being fed new info
-- making a slot machine
-- http://www.tandgapps.co.uk/resources/tutorial-making-a-slot-machine/
-- look at this portfolio and others for more ideas
-- http://www.tandgapps.co.uk/portfolio/

-- make simple audio apps like Auxy on Ipad, possibly charge to be able to export? or just ads
-- can i have a season pass option for multiple apps
-- register an app based on having paid before?

-- quick versions of designers tools - look at other websites that do somehting similar and make the mobile version
-- then I can have the one site that aggregates all the apps
-- make color matrix that has RANDOM complimentary colors, tricolors, etc...

-- particle disigner
-- http://www.reddit.com/r/CoronaSDK/comments/21w42o/free_alternative_to_particle_designer/
-- idea for time waster - wood burning app (like with a magnifying glass)
-- also the oddlysatisfying app (polishing, cleaning, straigtening, orgamizing, perfect fit,etc...)

-- Corona includes the widely-used Box2D physics engine which features multiple body types, collision detection, joints, raycasting, and more.

-- be like a music label for apps - take 15% for having it a part of an MCN Multi-Channel Network
-- have a network of apps that all advertise on each other as well as providing admob
-- then I can create an API to dp fullfillment on purchases that takes 10%, plug and play type code

-- Programming in Lua First Edition
-- http://www.lua.org/pil/contents.html#1

-- Learnning Lua
-- http://lua-users.org/wiki/LearningLua

-- http://www.reddit.com/r/CoronaSDK/

-- http://luatut.com/crash_course.html

-- http://coronalabs.com/blog/2013/05/28/tutorial-goodbye-globals/

--Tiling
--http://forums.coronalabs.com/topic/43973-side-scrolling-background-image-logic/

-- Corona University 
-- http://coronalabs.com/resources/tutorials/getting-started-with-corona/

-- Your code here

-- start with debugging and logging
-- BASIC DEBUGGIN
-- https://coronalabs.com/blog/2013/07/09/tutorial-basic-debugging/
print("\n++++++++++++++++++++++++++++++++++++++++++++++++\n")
_debug = true
function printDebug(string)
  if (_debug == true) then 
      print(string)
  end
end

if (_debug == true) then
	printDebug("Debug Active")
else
	print("Debug Off")
end


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

printDebug("one line\nnext line\n\"in quotes\", 'in quotes'")



-- paint background before other objects that go on top
local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth ,display.contentHeight)
background:setFillColor(128/255, 0, 0, 0.75)  -- alpha 1.0 is opaque, 0.0 is transparent
											  -- can use this for  live wallpapers


-- THIS IS STILL POINTING TO CORONA OBJECTS AND NOT AT GITHUB REPOSITORY
-- open sublime project AND Corona Simulator off of the same projects

-- SPRITE
-- puma_frames_sprite_example.
--display.newSprite( [parent,] imageSheet, sequenceData )
--sprites are not just for typical animations, but for swapping frames of a “static” image as well BUTTONS

-- Texturepacker for sprites and animations
-- http://gamedevelopment.tutsplus.com/tutorials/creating-sprite-sheets-in-five-minutes-with-texture-packer--gamedev-4072

-- Image Sheets
-- http://docs.coronalabs.com/guide/media/imageSheets/index.html

--THIS IS FOR THE RUNNING CAT
--local sheetData = { width=512, height=256, numFrames=8, sheetContentWidth=1024, sheetContentHeight=1024 }
local sheetData = { width=384, height=192, numFrames=8, sheetContentWidth=768, sheetContentHeight=768 }
 
local mySheet = graphics.newImageSheet( "runningcat.png", sheetData )
local sequenceData = {
{ name = "normalRun", start=1, count=8, time=800 },
{ name = "fastRun", frames={ 1,2,4,5,6,7 }, time=250 }
}
local animationSprite = display.newSprite( mySheet, sequenceData )

animationSprite.x = display.contentWidth/2 --center the sprite horizontally
animationSprite.y = display.contentHeight/4 --center the sprite vertically -div 2 = middle, no div = bottom div 4 = top

-- Scale the image down to 25%
animationSprite.xScale = 0.5
animationSprite.yScale = 0.5

animationSprite:play()


--THIS IS FOR THE FIREBALL
--4 wasted pixels with 1024/6 frames
--pretty amamzing what can be done with 6-8 from images - do this with pixel art Graphics Gale
local sheetDataFireball =  { width=170, height=170, numFrames=6, sheetContentWidth=1024, sheetContentHeight=170 }
local mySheetFireball = graphics.newImageSheet( "fireball.png", sheetDataFireball )
local sequenceDataFireball = { name="normal", start = 1, count=6, time=500 }
local animationSpriteFireball = display.newSprite( mySheetFireball, sequenceDataFireball )
animationSpriteFireball.x = display.contentWidth/2
animationSpriteFireball.y = display.contentHeight

animationSpriteFireball:play()



-- SpriteSheet Reference
-- http://kwiksher.com/tutorials_kwik/tutorial-sprites/

-- another animation example - look at and do the fireball animation
-- http://stackoverflow.com/questions/9737650/how-to-make-a-cartoon-type-animation-in-a-phonegap-apache-cordova
-- see also the batch file in thiss

-- this will output to the Corona Graphical Simulator
                  -- display.newText( string, x, y, font, size )
--local myTextObject = display.newText( "Hello World!", 160, 220, "Arial", 40 )
local myTextObject2 = display.newText( 'Click to\nChange Color', 160, 240, "Arial", 40 )
local myTextObject3 = display.newText( "current display", 160, 300, "Arial", 40)

-- get current display automagically and display as variable
local _width = display.contentWidth
local _height = display.contentHeight

-- use .. to concatenate string
--local myTextObject4 = display.newText( "540x960", 160, 340, "Arial", 40)
local myTextObject4 = display.newText( _width.."x".._height, 160, 340, "Times New Roman", 40)

--About "Dot" Notation
--To access an item from a library, use this notation consistently:
--[library].[API]
--This tells Corona that you wish to "access" the chosen library then "use" the chosen API. You must always specify the library first, then a dot (period), then the API. This is known as a property relationship.

--Setting Text Color
--Now let's discuss how to modify the color of your text. Notice that the newText API does not include parameters to set the color directly. To accomplish this, you will need to use another command:
--[object]:setFillColor( r, g, b )
-- colors http://en.wikipedia.org/wiki/Web_colors#X11_color_names
--myTextObject:setFillColor(0,1,1) --throws error if object is not instantiated
myTextObject2:setFillColor(255/255,0/255,255/255, 255/255)

-- can either do as a factoer 0.25 or out of 255 colors 225/255 - can it go larger 1026?
myTextObject3:setFillColor(255/255,192/255, 0.25, 075) -- :setFillColor(128/255, 0, 0, 0.25)  to do hex and alpha channel

-- colors can also be set to variables in a table
local mycol = { 0, 255/255, 255/255, 0.25 } -- variable color can be put in config with alpha
-- alpha can also be useful  when setting a debug flag and testing 
--fixedColor( mycol ) -- don't think i need this

--do NOT use upack
--myTextObject4:setFillColor( unpack( mycol ) )
-- do this insstead
for i = 1,100 do
	myTextObject4:setFillColor( mycol[1], mycol[2], mycol[3], mycol[4] )
end
-- as per here:
--http://docs.coronalabs.com/guide/basics/optimization/index.html#avoid-unpack
--Reference for more on color values
--http://forums.coronalabs.com/topic/40216-why-change-the-color-parameter-values/?hl=+graphics++2.0++colors
--this is a good example of how to set up other variables as well

--text and alignment and stuff
--http://docs.coronalabs.com/api/library/display/newText.html#updating-the-text-string-post-creation 

-- Plugins
-- http://plugins.cordova.io/#/

-- how to properly do logging?

-- get type of device?


-- CTRL+R to relaunch Simulator


-- Look into this - Memory Mangement
-- https://developer.android.com/training/articles/memory.html

-- How to correctly do logging and error reporting
-- http://www.toptal.com/android/automated-android-crash-reports-with-acra-and-cloudant

-- Corona How to publish Android Project
-- http://docs.coronalabs.com/guide/distribution/androidBuild/index.html

-- calling another function from a lua file
-- http://forums.coronalabs.com/topic/38127-how-to-call-a-function-from-another-lua-file/
    --main.lua
    local scriptTest = require("scripts.scriptTest")
    scriptTest.testFunction() --this will show in the console


-- FUNCITONS

function screenTap()
    local r = math.random( 0, 100 )
    local g = math.random( 0, 100 )
    local b = math.random( 0, 100 )
    myTextObject2:setFillColor( r/100, g/100, b/100 )
end

-- Event Listener
-- Next, you need to add a Corona event listener to create interactivity. Add this line to your project on the line after the function's end line:


--make this generic so I can call it on an object/animation instance
function TapToStartStop()
	if  animationSprite.isPlaying then  
	--if animationSprite.isPlaying then
	animationSpriteFireball:pause()
		animationSprite:pause() --this will stop the animation on the current frame
	else
		animationSprite:play()
		animationSpriteFireball:play()

	end
end

local function listener(param1, param2)
     return function(event)
          print(event.name, event.phase, param1, param2)
          --printDebug(event.name, event.phase, param1, param2)  -- this doesn't work with printDebug, probably becuase not all params are  strings
     end
end    

-- passing a parameter to a function
-- http://forums.coronalabs.com/topic/34651-passing-a-parameter-from-an-event-listener-to-a-function-help/
-- more:
-- http://stackoverflow.com/questions/8276127/addeventlistener-in-lua

display.currentStage:addEventListener( "tap", screenTap )
Runtime:addEventListener("tap", listener(animationSprite.isPlaying, "sure_is_param2"))--console
display.currentStage:addEventListener( "tap", TapToStartStop )




-- BUTTON
-- see examples here
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
-- local widget = require( "widget" ) -- don't need???


-- this must be localized in scope "above" where it is used in HhandeButtonEvent/ClickySound
	  local function disposeSound( event )
-- --http://forums.coronalabs.com/topic/35085-will-audiofadeout-call-audiodispose/	    	
        audio.stop( event.channel )
        audio.dispose( event.handle )
        laserSound = nil -- can i do NIL on both of these programmatically so I can reuse this?
        laserChannel = nil
        printDebug("sound nullified")
      end --end disposeSound()

-- Function to handle button events
local function handleButtonEvent( event )
-- more on event phases
-- http://docs.coronalabs.com/api/event/touch/phase.html
	if ("began" == event.phase) then -- event on touch
-- SOUND & AUDIO
-- http://docs.coronalabs.com/api/library/audio/play.html
-- Audio Optimization
-- http://docs.coronalabs.com/guide/basics/optimization/index.html#audio

-- flash the background color
background:setFillColor(0/255, 0, 0, 0.75)
--transition.blink( background, { time=1000} )

-- this will allow multiple instances of the same sound to play and each are disposed when done
      local function ClickySound( )
        --print("Clicky Sound") --debug only
        printDebug("Clicky Sound Debug")
	    -- body
	    printDebug("sound load")
        local laserSound = audio.loadSound( "assets/ding.wav" ) -- does not support mp3
        printDebug("sound play")
        --plays a sound loaded above on ANY open channel, can also designate a channel
        local laserChannel = audio.play( laserSound, { onComplete=disposeSound } ) 
      end -- end ClickySound



        ClickySound()
	end

    if ( "ended" == event.phase ) then -- event on release
        printDebug( "Button was pressed and released" ) -- output to console

        background:setFillColor(128/255, 0, 0, 0.75) --set back to orig
        --transition.cancel( blink )
    end
end




local widget = require( "widget" )
-- Create the widget
local button1 = widget.newButton
{
    label = "button",
    onEvent = handleButtonEvent,
    emboss = false,
    --properties for a rounded rectangle button...
    shape="roundedRect",
    width = 150,
    height = 40,
    cornerRadius = 2,
    fillColor = { default={ 1, 0.75, 0, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
    strokeColor = { default={ 1, 0.4, 0, 1 }, over={ 0.8, 0.8, 1, 1 } },
    strokeWidth = 4, 
    font="Arial",
    fontSize = 20
}

-- Center the button
button1.x = display.contentCenterX/2
button1.y = display.contentCenterY/6

-- Change the button's label text
button1:setLabel( "Click for Sound" )
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

-- continue with Rapid Physics
-- http://docs.coronalabs.com/guide/start/helloWorld/index.html


-- PICKER WHEEL
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

--[[
local widget = require( "widget" )

-- Create two tables to hold data for days and years      
local days = {}
local years = {}

-- Populate the "days" table
for d = 1, 31 do
    days[d] = d
end

-- Populate the "years" table
for y = 1, 48 do
    years[y] = 1969 + y
end

-- Configure the picker wheel columns
local columnData = 
{
    -- Months
    { 
        align = "right",
        width = 140,
        startIndex = 5,
        labels = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
    },
    -- Days
    {
        align = "center",
        width = 60,
        startIndex = 18,
        labels = days
    },
    -- Years
    {
        align = "center",
        width = 80,
        startIndex = 10,
        labels = years
    }
}

-- Create the widget
local pickerWheel = widget.newPickerWheel
{
    top = display.contentHeight - 222,
    columns = columnData
}

-- Get the table of current values for all columns
-- This can be performed on a button tap, timer execution, or other event
local values = pickerWheel:getValues()

-- Get the value for each column in the wheel (by column index)
local currentMonth = values[1].value
local currentDay = values[2].value
local currentYear = values[3].value

print( currentMonth, currentDay, currentYear )
--]]
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Progress View
-- http://docs.coronalabs.com/api/library/widget/newProgressView.html
-- can also be done with custom image sheet

local widget = require( "widget" )

-- Create the widget
local progressView = widget.newProgressView
{
    left = 50,
    top = 175,
    width = 220,
    isAnimated = true
    
}

-- Set the progress to 50%
progressView:setProgress( 0.75 )
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
-- SCROLLVIEW
-- click and hold to move image

--[[
local widget = require( "widget" )

-- ScrollView listener
local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        if ( event.direction == "up" ) then print( "Reached top limit" )
        elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
        elseif ( event.direction == "left" ) then print( "Reached left limit" )
        elseif ( event.direction == "right" ) then print( "Reached right limit" )
        end
    end

    return true
end

-- Create the widget
local scrollView = widget.newScrollView
{
    top = 100,
    left = 10,
    width = 300,
    height = 400,
    scrollWidth = 600,
    scrollHeight = 800,
    listener = scrollListener
}

-- Create a image and insert it into the scroll view
local background = display.newImageRect( "assets/scrollimage.png", 768, 1024 )
scrollView:insert( background )

--]]
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
-- SEGMENTED CONTROL

--local widget = require( "widget" ) -- not sure I need this



-- this is how to do the script test
--   local scriptTest = require("scripts.scriptTest")
--   scriptTest.testFunction() --this will show in the console
-- how do i load a button from an external file (and can i add the listenerEvent at the same time or from the same file)


-- Listen for segmented control events      
local function onSegmentPress( event )
    local target = event.target
    printDebug( "Segment Label is:", target.segmentLabel )
    printDebug( "Segment Number is:", target.segmentNumber )
end

local widget = require( "widget" )
-- Create a default segmented control
local segmentedControl = widget.newSegmentedControl
{
    left = 2,
    top = 375,
    segmentWidth = (display.contentWidth/4)-2, -- four equal widths based on the size of the screen, minus 2 for offset to allow for internal lines to be drawn
    segments = { "Item 1", "Item 2", "Item 3", "Item 4" },
    defaultSegment = 1,
    onPress = onSegmentPress,
    labelFont="Arial"
    
}

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
-- PARTICLE SYSTEMS
-- COME UP WITH OWN PARTICLE SYSTEM AND CONVERT WHEN I HAVE FROM VISUAL STUDIO
-- make it into a system that others can implemetn
-- then i can also start using them for equalizers

-- REFERENCE
-- https://love2d.org/forums/viewtopic.php?f=3&t=2316
-- example:
-- http://giderosmobile.com/forum/discussion/397/simple-particle-engine/p1


--Implementing Press and Hold in Corona SDK
--http://blogs.msdn.com/b/matt-harrington/archive/2014/03/29/how-to-implement-press-and-hold-in-corona-sdk.aspx


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++


 -- clean this up int localized and callable from a script - make a widget?
 -- can i add audio memory or any other imprints?
local memUsed = (collectgarbage("count"))
local texUsed = system.getInfo( "textureMemoryUsed" ) / 1048576
local _memUsage = "Memory Usage\nSystem Memory: "..string.format("%.00f", memUsed).."KB\nTexture Memory: "..string.format("%.03f", texUsed).."MB"
-- print to simulator
local _memUsageObject = display.newText( _memUsage, 240, 40, "Arial", 12)


local printMemUsage = function()

memUsed = (collectgarbage("count"))
texUsed = system.getInfo( "textureMemoryUsed" ) / 1048576

_memUsageObject.text = "Memory Usage\nSystem Memory: "..string.format("%.00f", memUsed).."KB\nTexture Memory: "..string.format("%.03f", texUsed).."MB"

end

if (system.getInfo("environment") == "simulator") then
Runtime:addEventListener( "enterFrame", printMemUsage)
end

-- @DEBUG monitor Memory Usage
--[[
local printMemUsage = function()
local memUsed = (collectgarbage("count"))
local texUsed = system.getInfo( "textureMemoryUsed" ) / 1048576 -- Reported in Bytes
]]--

-- print to console
--[[
print("\n---------MEMORY USAGE INFORMATION---------")
print("System Memory: ", string.format("%.00f", memUsed), "KB")
print("Texture Memory:", string.format("%.03f", texUsed), "MB")
print("------------------------------------------\n")
]]--

--[[
_memUsage = "Memory Usage\nSystem Memory: "..string.format("%.00f", memUsed).."KB\nTexture Memory: "..string.format("%.03f", texUsed).."MB"
-- print to simulator
local myTextObject5 = display.newText( _memUsage, 240, 40, "Arial", 12)

end
]]--
 
-- Only load memory monitor if running in simulator
--if (system.getInfo("environment") == "simulator") then
--Runtime:addEventListener( "enterFrame", printMemUsage)
--end 


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++
