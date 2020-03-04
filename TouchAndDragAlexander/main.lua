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

local ufo = display.newImageRect("Images/UFO.png", 150, 150)
local ufoWidth = ufo.width
local ufoHeight = ufo.height

--boolean variables
local alreadyTouchedStar = false
local alreadyTouchedPlanet = false
local alreadyTouchedUfo = false

--set x and y position of images
star.x = 400
star.y = 500

planet.x = 300
planet.y = 200

ufo.x = 600
ufo.y = 150

--Function: starListener
--Input: touchListener
--Output: none
--Description: when star touched, move it
local function starListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedPlanet == false) and (alreadyTouchedUfo == false) then 
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
		alreadyTouchedUfo = false
	end

end

-- add listeners to each object
star:addEventListener("touch", starListener)

--Function: planetListener
--Input: touchListener
--Output: none
--Description: when planet touched, move it
local function planetListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedStar == false) and (alreadyTouchedUfo == false) then 
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
		alreadyTouchedUfo = false
	end

end

-- add listeners to each object
planet:addEventListener("touch", planetListener)

--Function: ufoListener
--Input: touchListener
--Output: none
--Description: when UFO touched, move it
local function ufoListener(touch)
	if (touch.phase == "began") then 
		if (alreadyTouchedStar == false) and (alreadyTouchedPlanet == false) then 
			alreadyTouchedUfo = true
		end
	end

	if ( (touch.phase == "moved")and (alreadyTouchedUfo == true)) then
		ufo.x = touch.x
		ufo.y = touch.y
	end

	if (touch.phase == "ended") then 
		alreadyTouchedStar= false
		alreadyTouchedPlanet= false
		alreadyTouchedUfo = false
	end

end

-- add listeners to each object
ufo:addEventListener("touch", ufoListener)