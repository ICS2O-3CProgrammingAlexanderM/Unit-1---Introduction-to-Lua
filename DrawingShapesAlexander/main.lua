-----------------------------------------------------------------------------------------
--
-- main.lua
--
-------------------------------------------------------------------------------------
--Hide status bar
display.setStatusBar(display.HiddenStatusBar)
--set variables
local verticiesTri = {306, 50, 502, 364, 120, 364}
local verticiesPen = {708, 50, 828, 50, 858, 192, 768, 364, 678, 192}
local verticiesHex = {206, 404, 306, 404, 356, 454, 306, 504, 206, 504, 156, 454}
local verticiesHep = {845, 357, 968, 296, 997, 162, 910, 55, 763, 55, 689, 165, 721, 298}
local gradientTri = {type = "gradient", color1 = {252/255, 14/255, 14/255}, color2 = {14/255, 46/255, 252/255}}
local gradientPen = {type = "gradient", color1 = {14/255, 252/255, 38/255}, color2 = {255/255, 2188/255, 14/255}}
local gradientHex = {type = "gradient", color1 = {14/255, 252/255, 228/255}, color2 = {31/255, 206/255, 5/255}}
local gradientHep = {type = "gradient", color1 = {255/255, 0/255, 0/255}, color2 = {0/255, 255/255, 0/255}}
local borderSize = 20
local borderColor = 255/255, 255/255, 255/255
local textSize = 50
local textColor = 0, 0, 0
local TriText
local PenText
local HexText
local HepText

--Display Triangle
local triangle = display.newPolygon( display.contentHeight/4+100, display.contentWidth/4-50, verticiesTri)

--Display Pentagon
local pentagon = display.newPolygon( display.contentHeight/2+350, display.contentWidth/2-292, verticiesPen)

--Display Hexagon
local hexagon = display.newPolygon(display.contentHeight/4+100, display.contentWidth/2, verticiesHex)

--Display Heptagon
local heptagon = display.newPolygon(display.contentHeight/2+350, display.contentWidth/2+100, verticiesHep)

--Color shapes
triangle.fill = gradientTri
pentagon.fill = gradientPen
hexagon.fill = gradientHex
heptagon.fill = gradientHep

--set borders
triangle.strokeWidth = borderSize
triangle.strokeColor = borderColor
pentagon.strokeWidth = borderSize
pentagon.strokeColor = borderColor
hexagon.strokeWidth = borderSize
hexagon.strokeColor = borderColor
heptagon.strokeWidth = borderSize
heptagon.strokeColor = borderColor


--Set background color
display.setDefault("background", 120/255, 78/255, 255/255)

--Display text
TriText= display.newText("Triangle", 0,0, Arial, textSize)
TriText.x=display.contentHeight/4+100
TriText.y=display.contentWidth/4-50
TriText:setTextColor(textColor)

PenText = display.newText("Pentagon", 0, 0, Arial, textSize)
PenText.x = display.contentHeight/2+350
PenText.y = display.contentWidth/2-292
PenText:setTextColor(textColor)

HexText = display.newText("Hexagon", 0, 0, Arial, textSize)
HexText.x = display.contentHeight/4+100
HexText.y = display.contentWidth/2
HexText:setTextColor(textColor)

HepText = display.newText("Heptagon",0,0, Arial, textSize)
HepText.x = display.contentHeight/2+350 
HepText.y = display.contentWidth/2+100
HepText:setTextColor(textColor)