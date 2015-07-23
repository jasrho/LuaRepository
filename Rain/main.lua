-----------------------------------------------------------------------------------------
-- 
-- main.lua
-- 
-----------------------------------------------------------------------------------------
local screenW, screenH = display.contentWidth, display.contentHeight
local contentX, contentY = display.contentCenterX, display.contentCenterY
-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )
group = display.newGroup()
local g = {
  
    type="gradient",
    color1={ 100/255, 100/255, 100/255 }, 
    color2={ 50/255, 10/255, 10/255 }, 
    direction="down"
}


local bg = display.newRect( contentX, contentY, screenW, screenH-50)
bg:setFillColor( g )
bg.alpha = 0.40
group:insert(bg)
local rain = require("rain")
rain.new(group, {
                  angle = 40, 
                  speed = .95,
                  floor =  200,
                  length = 30,
                  width = 2, -- width is deprecated, see terminal outuput in debugging
                  alpha = .85,
                  color = 200/255, --this only goes grayscale, make it a table in rain.lua
                  count = 400,
                  snow = false 

                  })
-- Pause rain:
rain.pause()
-- Resume rain:
rain.resume()