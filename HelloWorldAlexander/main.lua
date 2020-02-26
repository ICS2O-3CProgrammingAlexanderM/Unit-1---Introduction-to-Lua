-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--Prin greeting
print ("****Hello Alex")
--Hide status statusBar
display.setStatusBar(display.HiddenStatusBar)
--set background color
display.setDefault("background", 7/255, 102/255, 245/255)
--Create local variable
local textObject
--displays text
textObject = display.newText( "Hello Alexander", 500, 500, nil, 50)
--canges text color
textObject:setTextColor(0/255, 0/255, 0/255)