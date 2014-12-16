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
background:setFillColor(128/255, 0, 0, 0.75)  -- alpha 1.0 is opaque, 0.0 is transparent




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
