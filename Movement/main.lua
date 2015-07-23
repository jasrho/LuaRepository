-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

--SIMULATOR view -> view as... to change to a different device

-- Corona Labs Youtube Channel
-- https://www.youtube.com/channel/UCosEwj9k_-HqkGPFk4072sA

--optimizations
--http://docs.coronalabs.com/guide/basics/optimization/index.html#lua-optimizations

--orientation

--parallax
--http://coronalabs.com/blog/2012/10/16/parallax-simplified/
--http://forums.coronalabs.com/topic/29780-parallax-scrolling-with-changing-backgrounds/
--http://www.deepblueapps.com/gs-parallax-scrolling/
--https://www.youtube.com/watch?v=0GtUxdSeWzk
--https://www.youtube.com/watch?v=FrS8P_cx9F8
--http://stackoverflow.com/questions/17438859/corona-sdk-use-scrollview-listener-to-move-image-with-scrolling-momentum

--build and endless runner game from scratch
-- http://code.tutsplus.com/tutorials/corona-sdk-build-an-endless-runner-game-from-scratch--mobile-9256

--next steps 
--create a workflow for a game - design, implement, repositoty, testing, debugging, reporting, publishing - others?
--how to find device id
--set all anchors and reference points in relation to viewable area
--be able to detect dimensions
--logging for crash report
--what to add for testing
--be able to scale objects based on the display dimensions
--when orientation change is detected - redraw the screen with new dimensions (or just 180)


--[[put this somewhere
config.lua

First let’s make a config file to set the screen size.

application =
{
     content =
     {
        width = 320,
        height = 480,
        scale = "zoomEven"
      }
}


-- from here
-- http://webtutsdepot.com/2011/11/27/corona-sdk-tutorial-circle-object/
]]


-- how to use math.random wwiht 25 color = math.random(0,255)/255

-- DEBUG
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

-- System Event Handler: START/EXIT/SUSPEND/RESUME/OPEN
local function onSystemEvent( event )

    local eventType = event.type

    if ( eventType == "applicationStart" ) then
        --occurs when the application is launched and all code in "main.lua" is executed
    elseif ( eventType == "applicationExit" ) then
        --occurs when the user or OS task manager quits the application
    elseif ( eventType == "applicationSuspend" ) then
        --perform all necessary actions for when the device suspends the application, i.e. during a phone call
    elseif ( eventType == "applicationResume" ) then
        --perform all necessary actions for when the app resumes from a suspended state
    elseif ( eventType == "applicationOpen" ) then
        --occurs when the application is asked to open a URL resource (Android and iOS only)
    end
end

Runtime:addEventListener( "system", onSystemEvent )



function changeOrientation( event )
  printDebug("changeOrientation")
  -- need to redraw orientation change (if needed, may only need to redraw on 180 degree turn/flip)
  -- Look here for more info
   -- http://forums.coronalabs.com/topic/33761-orientation-problems-if-startup-orientation-is-not-default/

end
Runtime:addEventListener( "orientation", changeOrientation )


-- LOAD done after events are localized in scope
local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth ,display.contentHeight)
local backgroundColor = { 0, 0, 128/255, 0.75 } --set color as varaiable that can ebe called/changed later
background:setFillColor( backgroundColor[1], backgroundColor[2], backgroundColor[3], backgroundColor[4]  )  -- alpha 1.0 is opaque, 0.0 is transparent





-- +++++++++++++++++++++ USE THIS FOR SLOT IMAGE ANIMATION +++++++++++++++++++++

--[[
local sheetData = { width=100, height=100, numFrames=7, sheetContentWidth=100, sheetContentHeight=800 }
 
local mySheet = graphics.newImageSheet( "/Assets/slots1.png", sheetData )
local sequenceData = {
{ name = "normalRun", start=1, count=7, time=2000},
{ name = "fastRun", frames={ 1,2,4,5,6 }, time=250 }
}
local animationSprite = display.newSprite( mySheet, sequenceData )

animationSprite.x = display.contentWidth/2 --center the sprite horizontally
animationSprite.y = display.contentHeight/4 --center the sprite vertically -div 2 = middle, no div = bottom div 4 = top

-- Scale the image down to 25%
--animationSprite.xScale = 0.5
--animationSprite.yScale = 0.5

animationSprite:play()

]]--










-- Current Dimensions - Why is this different than Hello World?

-- use .. to concatenate string
--local myTextObject4 = display.newText( "540x960", 160, 340, "Arial", 40)
-- principles of alignment
--https://coronalabs.com/blog/2014/02/11/tutorial-methods-for-positioning-text/
if (_debug == true) then
  local _fontSize = 40
  local myText = display.newText( "Display: ".. display.contentWidth.."x"..display.contentHeight, 0, 0, native.SystemFont, _fontSize)
  myText:setFillColor( 0.75, 0.75, 0.75 )
  myText.anchorX = 0 -- this is the left edge
  myText.x = 10
  myText.y = (display.contentHeight-_fontSize)
end
--display.newEmbossedText kind of sucks

--must be created OUTSIDE the scope of the function, then it can be removed elsewhere
-- local circleSprite = nil
local _rad = 20
local circleSprite = display.newCircle( display.contentCenterX, display.contentCenterY, _rad )
local circleSpriteColor = { 0, 150/255, .75, 1.0 } -- only need to set color once this way
circleSprite:setFillColor( circleSpriteColor[1], circleSpriteColor[2], circleSpriteColor[3], circleSpriteColor[4] )
circleSprite.strokeWidth = 3
circleSprite:setStrokeColor( 0, 0, 1 )

--clock hands on a timer
-- see here
--http://coronalabs.com/blog/2013/10/15/tutorial-anchor-points-in-graphics-2-0/
--NOTE hand will be below circle on start, and will be above in heirarchy on redraw/tap event
local secondHand = display.newImageRect( "images/second_hand.png", 209, 31)
--secondHand.anchorX = 0.2257
secondHand.anchorX = 0.318
secondHand.anchorY = 0.5
secondHand.x = display.contentCenterX
secondHand.y = display.contentCenterY
secondHand:scale( 1.75, 1.75) -- use a small texture and scale up 

timer.performWithDelay( 1000, function() secondHand.rotation = secondHand.rotation + 6; end, 0 )
-- end clock hand timer



-- image mask for partially hiding part or all of an image
-- http://docs.coronalabs.com/guide/media/imageMask/index.html#apply



-- have ball leave trail when onPress event
--http://forums.coronalabs.com/topic/48703-is-there-a-way-for-an-object-to-leavedraw-a-trail-when-it-is-moved/

-- Create Sprite
-- this will creatte sprite in new touch location and leave it untile the next touch event
local function createCircle(Xparam, Yparam)
--creates a circle sprite at Xparam/Yparam coordinates


if (circleSprite ~= nil) then
-- transition.to() for object fade
-- http://docs.coronalabs.com/api/library/transition/to.html
-- color is not currently supported in transition
	transition.to( circleSprite, {time=1500, alpha=0} ) --either transition.to() or remove
	--display.remove( circleSprite )
end
--local circleSprite = display.newCircle( display.contentCenterX, display.contentCenterY, 20 )

--printDebug("radius = ".._rad)

circleSprite = display.newCircle( Xparam, Yparam, _rad )
circleSprite:setFillColor( circleSpriteColor[1], circleSpriteColor[2], circleSpriteColor[3], circleSpriteColor[4] )
circleSprite.strokeWidth = 3
circleSprite:setStrokeColor( 0, 0, 1 )
--circleSprite:strokeWidth = 5
--circleSprite:setStrokeColor( 1, 0, 0 )
 -- 1.0 alpha is opaque, 0.0 is transparent 0,0,0 is black

end

-- this will move the circleSprite once created
-- http://docs.coronalabs.com/api/event/touch/x.html
local function moveCircle( event )  
	if (circleSprite ~= nil ) then
    circleSprite.x = event.x
    circleSprite.y = event.y
	end
end


-- Localize Listener event 
-- see more:
-- http://docs.coronalabs.com/guide/events/detectEvents/index.html
local myListener = function( event )
    printDebug( "Listener called with event of type: "..event.name )
	if ("began" == event.phase) then -- event on touch
		printDebug("begin press")
		createCircle(event.x, event.y)
      end

    if ( "ended" == event.phase ) then -- event on release
		printDebug("end press")
		-- display.remove( circleSprite )
    end

end



Runtime:addEventListener( "touch", moveCircle )
Runtime:addEventListener( "touch", myListener )




-- BUTTON HANDLER
local function handleButtonEvent1( event )
	if ("began" == event.phase) then -- event on touch
	end

    if ( "ended" == event.phase ) then -- event on release
    	circleSprite:scale(1.2, 1.2)
    	_rad = _rad*1.2
    end
end

-- BUTTON HANDLER
local function handleButtonEvent2( event )
	if ("began" == event.phase) then -- event on touch
	end

    if ( "ended" == event.phase ) then -- event on release
    	circleSprite:scale(0.8, 0.8)
    	_rad = _rad*0.8
    end
end




local fcDef = { 101/255, 116/255, 255/255, 1 }
local fcOver = { 24/255, 47/255, 255/255, 0.4 }
local fcStrokeDef = { 50/255, 58/255, 127/255, 1 }
local fcStrokeOver = { 19/255, 38/255, 204/255, 1 } 
local buttonLabelColorDef = { 1, 1, 1, 1 }
local buttonLableColorOver = { 1, 1, 1, 0.85 }

--BUTTON
local widget = require( "widget" )
-- Create the widget
local button1 = widget.newButton
{
    label = "button1",
    onEvent = handleButtonEvent1,
    emboss = false,
    --properties for a rounded rectangle button...
    shape="roundedRect",
    width = 200,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={ fcDef[1], fcDef[2], fcDef[3], fcDef[4] }, over={ fcOver[1], fcOver[2], fcOver[3], fcOver[4] } },
    strokeColor = { default={ fcStrokeDef[1], fcStrokeDef[2], fcStrokeDef[3], fcStrokeDef[4] }, over={ fcStrokeOver[1], fcStrokeOver[2], fcStrokeOver[3], fcStrokeOver[4] } },
    strokeWidth = 4, 
    font="Arial",
    fontSize = 25,
labelColor = { default={ buttonLabelColorDef[1], buttonLabelColorDef[2], buttonLabelColorDef[3], buttonLabelColorDef[4] }, over={ buttonLableColorOver[1], buttonLableColorOver[2], buttonLableColorOver[3], buttonLableColorOver[4] } }
}
-- Center the button
button1.anchorX = 0  -- left edge
button1.anchorY = 0  -- top edge
button1.x = 0 --left plus zero
button1.y = 10 --top plus 10
-- Change the button's label text
button1:setLabel( "Click Bigger" )





--BUTTON
local widget = require( "widget" )
-- Create the widget
local button2 = widget.newButton
{
	
    label = "button2",
    onEvent = handleButtonEvent2,
    emboss = false,
    --properties for a rounded rectangle button...
    shape="roundedRect",
    width = 200,
    height = 60,
    cornerRadius = 2,
    fillColor = { default={ fcDef[1], fcDef[2], fcDef[3], fcDef[4] }, over={ fcOver[1], fcOver[2], fcOver[3], fcOver[4] } },
    strokeColor = { default={ fcStrokeDef[1], fcStrokeDef[2], fcStrokeDef[3], fcStrokeDef[4] }, over={ fcStrokeOver[1], fcStrokeOver[2], fcStrokeOver[3], fcStrokeOver[4] } },
    strokeWidth = 4, 
    font="Arial",
    fontSize = 25,
	labelColor = { default={ buttonLabelColorDef[1], buttonLabelColorDef[2], buttonLabelColorDef[3], buttonLabelColorDef[4] }, over={ buttonLableColorOver[1], buttonLableColorOver[2], buttonLableColorOver[3], buttonLableColorOver[4] } }


}
-- Center the button
button2.anchorX = 1-- right edge    can use 0,0.25,0.5,0.75,1 
button2.anchorY = 0  -- top edge
button2.x = display.contentWidth --right edge
button2.y = 10

-- Change the button's label text
button2:setLabel( "Click Smaller" )


if (_debug == true) then
-- anchor the message
-- reference
-- http://docs.coronalabs.com/api/library/display/newText.html#updating-the-text-string-post-creation
  local _options = 
  {
      --parent = textGroup,
      text = string.format("%.00f", _rad),     
      x = 10,
      y = 855,
      width = 300,     --required for multi-line and alignment
      font = native.systemFontBold,   
      fontSize = 40,
      align = "left"  --new alignment parameter
  }

  --local _memUsageObject = display.newText( _rad, 100, 880, "Arial", 40)
  local _memUsageObject = display.newText( _options )
  _memUsageObject.anchorX = 0 -- anchorX is 0-1 (0.0, 0.25, 0.5, 0.75 1.0 or anything in between)
  _memUsageObject.anchorY = 0 -- anchorY is 0-1 (0.0, 0.25, 0.5, 0.75 1.0 or anything in between)
  local whatisrad = function()
    _memUsageObject.text = "_rad = "..string.format("%.00f", _rad)
  end
  --set this only to display if debugging
  if (system.getInfo("environment") == "simulator") then
    Runtime:addEventListener( "enterFrame", whatisrad)
  end
end
