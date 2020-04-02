-----------------------------------------------------------------------------------------
--Title: Moving Images
--Name: Alexander
--Course: ICS20/3C
--This program moves a beetleship across the screen and then makes it fade out.
--I added a second Image that shrinks in size and moves in the opposite direction, then fades out.
-----------------------------------------------------------------------------------------

--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--play background sound
local Background = audio.loadStream("Sounds/BackgroundSound.mp3")
local backgroundMusicChannel = audio.play (Background, { channel=1, loops=-1, fadein=0})

--global variables
scrollspeed=3
scrollspeedRocket=5

--Background image width and height
local bacgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

--Character Image with width and height.
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

--Make image invisible
beetleship.alpha = 0

--set initial cordinates
beetleship.x = 0
beetleship.y = display.contentHeight/3

--Function: Move Beetleship
--Input: this function acceptes an event listener
--Output: none
--Description: This function adds the scroll speed to the x value of the ship.
local function MoveShip(event)
	--add the scrool speed to the x value of the ship
	beetleship.x= beetleship.x + scrollspeed
	--Change the transparency of the ship
	beetleship.alpha = beetleship.alpha + 0.01
end

--MoveShip will be called over and over
Runtime:addEventListener("enterFrame", MoveShip)

-- make new image
local rocketship = display.newImageRect("Images/rocketship.png", 200, 200)

--set coordinates
rocketship.x = display.contentWidth
rocketship.y = display.contentHeight

--move rocket ship and shrink it as well as fade out
local function MoveShip(event)
	--subtract scrollspeedRocket to the x and y values
	rocketship.x = rocketship.x - scrollspeedRocket
	rocketship.y = rocketship.y - scrollspeedRocket
	--fade out
	rocketship.alpha = rocketship.alpha - 0.01
end

--MoveShip will be called over and over
Runtime:addEventListener("enterFrame", MoveShip)
