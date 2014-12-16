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
background:setFillColor(128/255, 0, 0, 0.75)  -- alpha 1.0 is opaque, 0.0 is transparent

--http://forums.coronalabs.com/topic/43973-side-scrolling-background-image-logic/