-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Live Wallpaper - 

-- bounce event in corona
-- http://stackoverflow.com/questions/13105309/when-is-the-bounce-event-phase-triggered-on-a-sprite-in-corona

-- moving a character left and right
-- http://thatssopanda.com/corona-sdk-tutorials/moving-a-character-left-and-right-with-corona-sdk/

-- sprite animation
-- https://www.youtube.com/watch?v=VsA2agBAWho

-- sprite animation with Corona SDK
-- https://www.youtube.com/watch?v=12Tm69jhMY4

-- moving along a path
-- http://coronalabs.com/blog/2014/01/07/tutorial-moving-objects-along-a-path/

-- how to move an object in corona sdk
-- http://stackoverflow.com/questions/16629202/how-to-move-object-in-corona-sdk

-- Moving Multiple Objects in Corona SDK
-- https://www.youtube.com/watch?v=SBV3sf5Z4uk

-- Moving a display object in a circular motion in Corona SDK
-- http://www.develephant.net/moving-a-display-object-in-a-circular-motion-in-corona-sdk/

--post on multiple random objects
--http://stackoverflow.com/questions/18086579/how-to-animate-random-objects-created-on-screen-in-corona-sdk

--Easily Create Several Images with Corona SDK
--http://thatssopanda.com/corona-sdk-tutorials/creating-several-images-with-corona-sdk/

-- Bounce Game
-- http://code.tutsplus.com/tutorials/coronasdk-create-an-entertaining-bouncing-game--mobile-20564

-- use this to set up game(s)
-- Breakout type game in Corona SDK
-- http://www.raywenderlich.com/26793/how-to-make-a-breakout-game-with-corona

--oohh fun
--http://code.coronalabs.com/code

--realtime blur
--http://code.coronalabs.com/code/realtime-blur

--Content Scaling - DO THIS
--http://docs.coronalabs.com/daily/guide/basics/configSettings/index.html

--http://stackoverflow.com/questions/5620722/how-to-have-multiple-lua-files-when-working-with-corona-sdk

--leanrn about blendmode

--look at converting partiles from XNAStudio
--particles
--http://coronalabs.com/blog/2014/05/06/tutorial-designing-particle-emitters/

--[[FIRE in less than 10 lines of code

Thanks for the great post.
Specifically for Camp fire, another ridiculously easier and free alternative done in less than 10 lines of code –

local function fire()
local beam = {}

for i = 1, 20 do

–Have used circle, but if you use a blurry yellow glow, it would look more like a fire

beam[i] = display.newCircle(0,0,3.5) –display.newImage(“glow4.png”)–

beam[i].x, beam[i].y = math.random(100,200) , 500
beam[i].alpha = 0.5
beam[i].trans = transition.to(beam[i], { x = math.random(100,200), y = math.random (300, 400), alpha = 0.1, time = math.random(1000, 1200), delay = 100, onComplete = function() if beam[i] then beam[i]:removeSelf() end end })
end
end
timer.performWithDelay(200, fire, -1)

]]

--customizing text imput
--http://coronalabs.com/blog/2013/12/03/tutorial-customizing-text-input/


-- DEBUG
print("\n++++++++++++++++++++++++++++++++++++++++++++++++\n")
_debug = false
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

end

Runtime:addEventListener( "orientation", changeOrientation )

-- Localize Listener event 
-- see more:
-- http://docs.coronalabs.com/guide/events/detectEvents/index.html
local myListener = function( event )
    printDebug( "Listener called with event of type: "..event.name )
  if ("began" == event.phase) then -- event on touch
    printDebug("begin press")

    end

    if ( "ended" == event.phase ) then -- event on release
    printDebug("end press")

    end

end

Runtime:addEventListener( "touch", myListener )
-- LOAD
local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth ,display.contentHeight)
--background:setFillColor(128/255, 0, 0, 0.75)  -- alpha 1.0 is opaque, 0.0 is transparent


--use gradient with setFillcolor

local gradient = {

    type="gradient",
    color1={ 0.2, 1, 1 }, 
    color2={ 0.8, 0.8, 0.8 }, 
    direction="down" --up, down, left, right
}

background:setFillColor(gradient)




if _debug == true then
  print ("gradient type = "..gradient.type)
  --gradient.color1 = { 0.8, 0.2, 1 }
  --gradient.color1[2] = 0.2
end

local xdir = 1
local ydir = -1

local function changegradient()

x = gradient.color1[1] * 255
y = gradient.color2[1] * 255

if _debug==true then
--print("x="..x) 
--print ("y="..y)
end


if x > 254 and xdir==1 then 
    xdir = -1
elseif
    x < 1 and xdir == -1 then
    xdir = 1
end
if y > 254 and ydir==1 then 
    ydir = -1
elseif
    y < 1 and ydir == -1 then
    ydir = 1
end


x=x+xdir
y=y+ydir

gradient.color1[1] = x/255
gradient.color2[1] = y/255

background:setFillColor(gradient)
end

-- see how memory intensive this is
timer.performWithDelay(10, changegradient, -1)
--local function changegradent(g{})
--end

--local tweak = timer
--tweak.performWithDelay(500, changegradent(gradient), 0 )






-- BUTTON EVENT HANDLER
local function handleButtonEvent( event )
-- more on event phases
-- http://docs.coronalabs.com/api/event/touch/phase.html
	if ("began" == event.phase) then -- event on touch
		printDebug("begin press")
    end

    if ( "ended" == event.phase ) then -- event on release
		printDebug("end press")
    end

end


-- USING EXTERNAL FILES IN CORONA SDK
-- http://coronalabs.com/blog/2012/08/28/how-external-modules-work-in-corona/








--[[
-- this will update EVERY FRAME so 60 fps = 60 times per second
-- Listen for bullet and player collisions and user dragging player
local function gameListeners(event)
    if event == "add" then
        Runtime:addEventListener("enterFrame", updateDirectionOnCollision);
        bullet:addEventListener("collision", zombieDestroyed);
        -- Bookmark A: You'll be adding some code here later
    -- Remove listeners when not needed to free up memory
    elseif event == "remove" then
        Runtime:removeEventListener("enterFrame", updateDirectionOnCollision);
        bullet:removeEventListener("collision", zombieDestroyed);
        -- Bookmark B: You'll be adding some code here later too
    end
end

-- add particles?  update alpha?  -any event that needs to be listened for
local function updateDirectionOnCollision()

--    if bullet.x < 0 or bullet.x + bullet.width > display.contentWidth then  
--        velocityX = -velocityX;
--    end

end
]]









-- bubble with random starting location on screen
local _rad = 20
local _radMuliplier = 80
local circleAlpha = 0.50


local randoms =  math.random
  randomx=randoms(0 + (_rad * 2), display.contentWidth - (_rad * 2) )
  randomy=randoms(0 + (_rad* 2), display.contentHeight - (_rad * 2) )
  local xlocation=randomx
  local ylocation=randomy



--single rondom circle placement
local circleSprite = display.newCircle( randomx, randomy, _rad )
--set at center
--local circleSprite = display.newCircle( display.contentCenterX, display.contentCenterY, _rad )


local circleSpriteColor = { 0, 150/255, .75, 1.0 } -- only need to set color once this way
circleSprite:setFillColor( circleSpriteColor[1], circleSpriteColor[2], circleSpriteColor[3], circleSpriteColor[4] )
circleSprite.strokeWidth = 3
circleSprite:setStrokeColor( 0, 0, 1 )



--[[
-- bunch of random images
    local letterHolder = {} -- initialize array
    local numOfImages = 10 -- define how many images on what on screen
     
    for i=1,numOfImages do -- start for loop to go from 1 to 10
    letterHolder[i] = display.newCircle( randomx, randomy, _rad ) -- create a new image and store it in the letterHolder array

-- color doesnt' work like this (math.random(0,255))
-- use 0.0-1.0
    letterHolder[i]:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1), math.random(0,1) ) -- assign a random color
    letterHolder[i].x = math.random(0 + (_rad * 2), display.contentWidth - (_rad * 2) ) -- display the rectangle in a random x position on screen
    letterHolder[i].y = math.random(0 + (_rad * 2), display.contentHeight - (_rad * 2) ) -- display the rectangle in a random y position on screen

    
    -- display coordinates for each circle for debugging (add to an array and display array after finished)

    end
    ]]--

-- this is how to make it so objects don't overlap
-- see answer here:
-- http://stackoverflow.com/questions/17576215/creating-random-images-at-random-position-in-corona-sdk

local letterHolder = {}
local numOfImages = 70
local xPosArray = {}
local yPosArray = {}
local randX,randY = 0,0
local xExists,yExists = 0,0


-- this still puts one image in upper left corner (1 of 10)
-- does NOT Take into account radius of circle for overlap (_rad)
local function positionImages(i)
  randX = math.random( (_rad*2), display.contentWidth -  (_rad*2) )
  randY = math.random( (_rad*2), display.contentHeight - (_rad*2) )

  if(i==1)then
    xPosArray[i] = randX
    yPosArray[i] = randY
  else
    xExists = table.indexOf( xPosArray, randX )
    yExists = table.indexOf( yPosArray, randY )
    if(xExists~=nil and yExists~=nil and xExists==yExists)then
      if _debug==true then print("Place already occuped") end
      positionImages(i)
    else
      if _debug==true then print("Can place here") end
      xPosArray[i] = randX
      yPosArray[i] = randY
    end
  end
end







physics = require("physics");
physics.start()
physics.setGravity(0, 0); -- no gravity
--physics.setScale(500)
--physics.setMKS("velocityThreshold", -0.1)
--physics.setMKS("timeToSleep", 0.1)
--physics.setMKS("linearSleepTolerance", 0)
--physics.setMKS("angularSleepTolerance", 0)




--physics.setPositionIterations( 20 )
--physics.setVelocityIterations( 20 )

--physics.setGravity(0, 10); -- bottom gravity
--physics.setGravity(0, -10); -- top gravity
--physics.setGravity(10, 0); -- right gravity
--physics.setGravity(-10, 0); -- left gravity
--physics.setGravity(10, 10); -- bottom right gravity

-- use this for height and width
local _H = display.contentHeight
local _W = display.contentWidth 



-- add walls to "bounce" off of
left = display.newLine(0, 0, 0, _H) --correct    
left.isVisible = false
left.name = "leftWall"
right = display.newLine(_W, 0, _W, _H) --correct
right.isVisible = false
right.name = "rightWall"
top = display.newLine(0, 0, _W, 0) --correct
top.isVisible = false
top.name = "topWall"
bottom = display.newLine(0, _H, _W, _H) --correct
bottom.isVisible = false
bottom.name = "bottonWall"


-- this will determine if bodies collice with each other or not
-- 
-- http://docs.coronalabs.com/daily/guide/physics/collisionDetection/index.html#filtering
-- An object will only collide with other objects if their categoryBits are among its assigned maskBits
--STILL NOT SURE HOW THIS WORKS
--This combination collides with walls but NOT each other
local wallCollisionFilter = {categoryBits = 2, maskBits = 3}
local circleCollisionFilter = {categorybits = 1, maskBits = 6}
--This combination collides with walls AND each other
--local wallCollisionFilter = {categoryBits = 2, maskBits = 3}
--local circleCollisionFilter = {categorybits = 1, maskBits = 3}
--This collides with each other but NOT with walls
--local wallCollisionFilter = {categoryBits = 2, maskBits = 6}
--local circleCollisionFilter = {categorybits = 1, maskBits = 3}
--This does NOT collide with walls OR each other
--local wallCollisionFilter = {categoryBits = 1, maskBits = 3}
--local circleCollisionFilter = {categorybits = 2, maskBits = 6}


--physics.addBody(left, "static", {density = 0, friction = 0, bounce = 0, isSensor = false})
physics.addBody(left, 'static', {bounce = 1, friction = 0, filter = wallCollisionFilter})
physics.addBody(right, 'static', {bounce = 1, friction = 0, filter = wallCollisionFilter})
physics.addBody(top, 'static', {bounce = 1, friction = 0, filter = wallCollisionFilter})
physics.addBody(bottom, 'static', {bounce = 1, friction = 0, filter = wallCollisionFilter})

--physics.addBody(leftWall, "static", {density = 0, friction = 0, bounce = 0, isSensor = false})
--physics.addBody(rightWall, "static", {density = 0, friction = 0, bounce = 0, isSensor = false})









--rectangle = display.newRect(0, 0, 50, 50)
--physics.addBody(rectangle, "kinematic", {isSensor = true})

-- similar
--http://www.christianpeeters.com/corona-sdk/corona-sdk-cancel-timers-with-multiple-instances-of-an-object/




-- random directions for each object 
-- http://stackoverflow.com/questions/11325193/how-can-i-move-my-objects-on-the-screen-randomly-on-corona

--ggtimer = {}
local function randomDirection(i)

--[[
    ggtimer[i] = timer
    rndDir = math.random(-5,5)

    print ("'ggtimer "..i.." with rnd="..rndDir)
    ggtimer[i].performWithDelay( 100, function() letterHolder[i].x = letterHolder[i].x + rndDir letterHolder[i].y = letterHolder[i].y + rndDir; end, 0)
    --timer.performWithDelay( 100, function() letterHolder[i].x = letterHolder[i].x + 6 letterHolder[i].y = letterHolder[i].y + 6; end, 0)
]]

--physics.addBody(letterHolder[i], "kinematic", {isSensor = true})
physics.addBody(letterHolder[i], "dynamic", {isSensor = false, filter = circleCollisionFilter, density = 1, friction = 0.2, bounce = 1.0});
letterHolder[i].isBullet = true
letterHolder[i]:setLinearVelocity(math.random(-100,100), math.random(-100,100));
end
--timer.performWithDelay(500, moveRandomly, -1);









for i=1,numOfImages do
  positionImages(i)
  --letterHolder[i] = display.newImageRect("images/myImage.png", 20, 20)
  letterHolder[i] = display.newCircle( randX, randY, math.random(_rad, _radMuliplier) ) 
  if _debug==true then print ("image "..i) end --misses first image
  -- color can still be background color, OR ALPHA is wrong (alpha had random with full range)
  --letterHolder[i]:setFillColor(math.random(0,1), math.random(0,1), math.random(0,1), .25) -- assign a random color-- create a new image and store it in the letterHolder array
  -- mostly blue-ish circles
  rndColor = math.random(10,255)/255
if i<11 then
  letterHolder[i]:setFillColor(0.0, 0.0, rndColor, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>10 and i<21 then
letterHolder[i]:setFillColor(rndColor, 0.0, 0.0, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>20 and i<31 then
letterHolder[i]:setFillColor(0.0, rndColor, 0.0, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>30 and i<41 then
letterHolder[i]:setFillColor(rndColor, rndColor, 0.0, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>40 and i<51 then
letterHolder[i]:setFillColor(0.0, rndColor, rndColor, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>50 and i<61 then
letterHolder[i]:setFillColor(rndColor, 0.0, rndColor, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array
elseif i>60 then
letterHolder[i]:setFillColor(rndColor, rndColor, rndColor, circleAlpha) -- assign a random color-- create a new image and store it in the letterHolder array

end
  --physics.addBody(letterholder[i], "kinematic", {isSensor = true})
  if _debug==true then  print("letterHolder "..i.." has x="..letterHolder[i].x) end
  letterHolder[i].name = "letterHolder"..i
  randomDirection(i)
 
end

-- THIS




--[[]
local function onCollision(event)
  timer.performWithDelay(0, resetLinearVelocity)
end
]]


local function onCollision( event )
timer.performWithDelay(0, resetLinearVelocity)
    if ( event.phase == "began" ) then

        if _debug==true then print( "began: " .. event.object1.name .. " and " .. event.object2.name ) end

    elseif ( event.phase == "ended" ) then

        if _debug==true then print( "ended: " .. event.object1.name .. " and " .. event.object2.name ) end
         
         --print( "Collision force: " .. event.object2.force )

        --event.object2:setLinearVelocity(200, 20)

    end
    
end

Runtime:addEventListener( "collision", onCollision )

--[[
local function resetLinearVelocity(event)
  
  local thisX, thisY = event.object2:getLinearVelocity()
  if thisY == 0 then
      thisY = -ball.lastY
      print("resetting Y")
  end
  if thisX == 0 then
      thisX = -ball.lastX
      print("resetting X")
  end
  event.object2:setLinearVelocity(thisX, thisY)
  event.object2.lastX, event.object2.lastY = thisX, thisY
  end
]]



--STICKY SOLUTION???
--http://www.ludicroussoftware.com/blog/2011/09/01/corona-physics-forced-bouncing/
--see onPostCollision below

local function onPostCollision( event )

local thisX, thisY = event.object2:getLinearVelocity()
local dir = 0

if _debug==true then print("X="..thisX.." Y="..thisY) end

if thisX <.01 and thisY<.01 then 
    if _debug==true then  print("x and y < .01 Stuck VERTICAL") end
    if thisY == -100 then dir=-20 else dir=20 end
    event.object2:setLinearVelocity(thisX+dir, -100) 
end

if thisX >.01 and thisY<.01 then
    if _debug==true then print("x > .01 and y < .01") end
    if thisX == 100 then dir = 20 else dir = -20 end
    event.object2:setLinearVelocity(100, thisY+dir) 
end

if thisX <.01 and thisY>.01 then
    if _debug==true then print("x < .01 and y > .01") end
    event.object2:setLinearVelocity(-100, thisY+5)
    --if thisY <.01 then event.object2:setLinearVelocity(thisX, 100) end
end
if thisX >.01 and thisY>.01 then
    if _debug==true then print("x and y > .01") end
    event.object2:setLinearVelocity(thisX-5, 100)
    --if thisY <.01 then event.object2:setLinearVelocity(thisX, 100) end
end

    if ( event.force < 1.0 ) then
        --print( "Collision force: " .. event.force .. " Friction: " .. event.friction )
    end
end

Runtime:addEventListener( "postCollision", onPostCollision )



--rotate in circle - good for orbits - PUT THIS IN ITS OWN FUNCTION

local t = 1 --what are these for?
local r = 40 --what are these for?
 
--local rect = display.newRect( 0, 0, 20, 20 ) -- RECTANGLE
local _rad2 = 10
local rect = display.newCircle( display.contentCenterX, display.contentCenterY, _rad2 )
 
local group = display.newGroup()
group:insert( rect )
 
group.x = display.contentCenterX
group.y = display.contentCenterY
 
local function onUpdate( event )
 
    local t = event.time * .005  -- .01=faster / .001 = slower
 
    rect.x = r * math.cos(t)
    rect.y = r * math.sin(t)
 
end
 
Runtime:addEventListener( "enterFrame", onUpdate )
--end rotate