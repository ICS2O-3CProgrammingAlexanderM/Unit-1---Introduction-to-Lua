--Local Variables
--Alexander Matheson
--Displays rectangleb and Circle and it's area
--Create Variables
local areaText
local textSize = 40
local myRectangle
local widthOfRectangle=350
local heightOfRectangle=200
local areaOfRectangle
local radiusOfCircle=150
local areaOfCircle
local myCircle
local PI=3.14159265
local areaTextCircle

--set background color
display.setDefault("background", 20/255, 125/255, 240/255)

--remove status bar
display.setStatusBar(display.HiddenStatusBar)

--Display rectangle that is half the width and height of screen
myRectangle=display.newRect(10,10,widthOfRectangle, heightOfRectangle)

--anchor the rectangle in top left corner of sctreen
myRectangle.anchorX=0
myRectangle.anchory=0
myRectangle.x=10
myRectangle.y=100

--set width of border
myRectangle.strokeWidth=20

-- set color of rectangle
myRectangle:setFillColor(0.7, 0.1, 0.3)

--set border color
myRectangle:setStrokeColor(0, 1, 0)

--calculate area
areaOfRectangle=widthOfRectangle*heightOfRectangle

--write area
areaText=display.newText("The area of this rectangle with a width of \n" ..widthOfRectangle.." and a height of "..heightOfRectangle .. " is "..areaOfRectangle .." pixels squared",0, 0, Arial, textSize)

--anchor text
areaText.anchorY=0
areaText.anchorX=0
areaText.x=20
areaText.y=display.contentHeight/2

--set colour of text
areaText:setTextColor(1, 1, 1)

--display circle
myCircle=display.newCircle(800, 200, radiusOfCircle)

--set color
myCircle:setFillColor(43/255, 255/255, 0/255)

--set border color
myCircle:setStrokeColor(0.7, 0.1, 0.3)

--find the area
areaOfCircle=PI*radiusOfCircle*radiusOfCircle

--display the area
areaTextCircle=display.newText ("The area of this circle, with a radius of "..radiusOfCircle.." pixels is \n"..areaOfCircle.." pixels squared.",0 ,0, Arial, textSize)

--anchor text
areaTextCircle.anchorY=0
areaTextCircle.anchorX=0
areaTextCircle.x=20
areaTextCircle.y=display.contentHeight/1.4

