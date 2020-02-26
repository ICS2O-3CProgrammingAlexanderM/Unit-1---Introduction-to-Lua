-----------------------------------------------------------------------------------------
--
-- main.lua
--
-------------------------------------------------------------------------------------
--Hide status bar
display.setStatusBar(display.HiddenStatusBar)
--set variables
local verticiesTri = {256, 10, 502, 364, 10, 364}
display.newPolygon( display.contentHeight/4, display.contentWidth/4, verticiesTri)