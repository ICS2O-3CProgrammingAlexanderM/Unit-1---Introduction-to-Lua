-----------------------------------------------------------------------------------------
--
-- main.lua
--
-------------------------------------------------------------------------------------
--Hide status bar
display.setStatusBar(display.HiddenStatusBar)
--set variables
local verticiesTri = {306, 50, 502, 364, 120, 364}
local verticiestPen = {708, 50, 828, 50, 858, 192, 768, 364, 678, 192}
local verticiesHex= {206, 404, 306, 404, 356, 454, 306, 504, 206, 504, 156, 454}

--Display Triangle
display.newPolygon( display.contentHeight/4+100, display.contentWidth/4-50, verticiesTri)

--Display Pentagon
display.newPolygon( display.contentHeight/2+350, display.contentWidth/2-292, verticiestPen)

--Display Hexagon
display.newPolygon(display.contentHeight/4+100, display.contentWidth/2, verticiesHex)

--Display Heptagon
