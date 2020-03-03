-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Alexander
-- Course: ICS2O/3C
-- This program displays 2 images that can be dragged around
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--set local variables
local backgroundImage = display.newImageRect("Images/backgroundImage.jpg", 2048, 1536)
local star = display.newImageRect("Images/star.png", 150, 150)
local starWidth = star.width
local starHeight = star.height

local planet = display.newImageRect("Images/planet.png", 150, 150)
local planetWidth = planet.width
local planetHeight = planet.height

--boolean variables
local alreadyTouchedStar = false
local alreadyTouchedPlanet = false

--set x and y position of images
star.x = 400
star.y = 500

planet.x = 300
planet.y = 200

--Function: starListener
--Input: touchListener
--Output: none
--Description: when star touched, move it
local function starListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedPlanet == false)then 
			alreadyTouchedStar = true
		end
	end

	if ( (touch.phase == "moved")and (alreadyTouchedStar == true)) then
		star.x = touch.x
		star.y = touch.y
	end

	if (touch.phase == "ended") then 
		alreadyTouchedStar= false
		alreadyTouchedPlanet= false
	end

end

-- add listeners to each object
star:addEventListener("touch", starListener)

--Function: starListener
--Input: touchListener
--Output: none
--Description: when star touched, move it
local function planetListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedStar == false)then 
			alreadyTouchedPlanet = true
		end
	end

	if ( (touch.phase == "moved")and (alreadyTouchedPlanet == true)) then
		planet.x = touch.x
		planet.y = touch.y
	end

	if (touch.phase == "ended") then 
		alreadyTouchedStar= false
		alreadyTouchedPlanet= false
	end

end

-- add listeners to each object
planet:addEventListener("touch", planetListener)