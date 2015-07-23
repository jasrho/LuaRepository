-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

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

-- LOAD
local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth ,display.contentHeight)
background:setFillColor(200/255, 0, 0, 0.25)  -- alpha 1.0 is opaque, 0.0 is transparent




-- Parallax --
-- http://coronalabs.com/blog/2012/10/16/parallax-simplified/

--First, declare a local reference variable for the stage.
local stage = display.currentStage
 
--Declare your parallax layers in back-to-front order and specify their distance ratio.
--This "distanceRatio" sets the layer's scrolling speed in relation to the foreground (1.0) layer.
local back00 = display.newGroup() ; back00.distanceRatio = 0.2
local back01 = display.newGroup() ; back01.distanceRatio = 0.4
local back02 = display.newGroup() ; back02.distanceRatio = 0.6
local back03 = display.newGroup() ; back03.distanceRatio = 0.8
local foreground = display.newGroup() ; foreground.distanceRatio = 1.0
 
--IMPORTANT NOTE 1: You MUST have one layer set to 1.0 ratio, even if it won't contain any objects.
--IMPORTANT NOTE 2: Attach a reference variable named "refGroup" to the stage table and set its
--value to the 1.0 layer from above. This group will be used as the core reference group in
--relation to screen touch-and-drag.
stage.refGroup = foreground 

stage.xMin = -400 ; stage.xMax = 400 ; stage.yMin = -150 ; stage.yMax = 1000

stage.paraGroups = {}
for g=1,stage.numChildren do
if ( stage[g].distanceRatio ) then stage.paraGroups[#stage.paraGroups+1] = stage[g] end
end 


-- Length (#)
-- The length operator # (hash-mark, sharp) is unique in Lua in that most other languages 
-- have length as either a builtin function or an object method. Lua on the other hand uses # 
-- as a prefix operator to determine the length of either a string or a table. 
-- http://luatut.com/crash_course.html
--[[
bag_of_stuff = {"do", "re", "me", "fa", "so", "la", "si"}
print("I haz "..#bag_of_stuff.." things")
]]--

local cX = display.contentWidth/2 ; local cY = display.contentHeight/2
 
-- local bkgrad = graphics.newGradient( {42,17,10}, {0,0,0}, "up" ) -- DEPRECATED
-- USE THIS INSTEAD
local gradient = {
    type="gradient",
    color1={ 47, 17, 10 }, color2={ 0.0, 0.0, 1.0 }, direction="up" }

local bk = display.newRect( 0,0,cX*2,cY*2 ) ; bk:setFillColor( gradient ) ; bk:toBack()
 
local object00 = display.newRect( back00,cX-16,cY-16,32,32 ) ; object00:setFillColor(0.75,0,0.25,100) --[pink]
local object01 = display.newRect( back01,cX-32,cY-32,64,64 ) ; object01:setFillColor(0,20,50,140) --[turqoise]
local object02 = display.newRect( back02,cX-48,cY-48,96,96 ) ; object02:setFillColor(150,40,0,160) --[yellow]
local object03 = display.newRect( back03,cX-64,cY-64,128,128 ) ; object03:setFillColor(0,150,0,255) --[green]
local foreObject = display.newRect( foreground,cX-80,cY-80,160,160 ) ; foreObject:setFillColor(0,0,0.50,200)  --[blue]


local function touchScreen( event )
 
local stageID = event.target
local refGroup = stageID.refGroup ; local paraGroups = stageID.paraGroups
local eventX = event.x ; local eventY = event.y
 
if ( #paraGroups < 1 ) then return end
 
if ( event.phase == "began" ) then
 
for i=1,#paraGroups do
paraGroups[i].offsetX = eventX - refGroup.x
paraGroups[i].offsetY = eventY - refGroup.y
end
 
elseif ( event.phase == "moved" ) then
 
local xDif = eventX - refGroup.offsetX
local yDif = eventY - refGroup.offsetY
 
--If you are NOT limiting the boundaries of your world, comment out these 2 lines.
if ( xDif < stageID.xMin ) then xDif = stageID.xMin elseif ( xDif > stageID.xMax ) then xDif = stageID.xMax end
if ( yDif < stageID.yMin ) then yDif = stageID.yMin elseif ( yDif > stageID.yMax ) then yDif = stageID.yMax end
 
for i=1,#paraGroups do
local group = paraGroups[i]
group.x = xDif * group.distanceRatio
group.y = yDif * group.distanceRatio
group = nil
end
xDif, yDif = nil,nil
 
end
 
stageID, refGroup, paraGroups, eventX, eventY = nil,nil,nil,nil,nil
return true
 
end
 
stage:addEventListener( "touch", touchScreen ) 





--[[  Cleaning up, remove listener
for i=#stage.paraGroups,1,-1 do
stage.paraGroups[i] = nil
end
stage:removeEventListener( "touch", touchScreen ) 
]]--











-- +++++++++++++++++++++ USE THIS FOR SLOT IMAGE ANIMATION +++++++++++++++++++++
--instead of using animation, try long image with parallax scrolling up and down
-- this is still goog for changing numbers somewhere...

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
-- +++++++++++++++++++++ USE THIS FOR SLOT IMAGE ANIMATION +++++++++++++++++++++




--http://forums.coronalabs.com/topic/43973-side-scrolling-background-image-logic/