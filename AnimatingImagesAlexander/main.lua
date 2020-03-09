-----------------------------------------------------------------------------------------
--Name: Alexander
-- Corse: ICS20/3C
--Animating Images
--This program displays 3 images which it moves around, one grows, one fades out and another moves in a parabola.
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Set variables
local backgroundImage = display.newImageRect("Images/Ocean.jpg", 1024, 768)
local octopus = display.newImageRect("Images/Octopus.png", 150, 150)
local fish = display.newImageRect("Images/Fish.png", 200, 150)
local jellyFish = display.newImageRect("Images/JellyFish.png", 150, 200)
local scrollSpeed = 3
local Radian = 0

--set cordinates
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2
octopus.x = display.contentWidth/2
octopus.y = 600
fish.x = display.contentWidth/2
fish.y = display.contentHeight/8
jellyFish.x = 200
jellyFish.y = 100

--move Octopus
local function MoveOctopus(event)
	--add scrollSpeed to x value
    octopus.x = octopus.x + scrollSpeed
end

--call event
Runtime:addEventListener("enterFrame", MoveOctopus)

--Move fish
local function MoveFish(event)
	-- move in a circle
	fish.x = fish.x + (math.cos(Radian))*scrollSpeed
	fish.y = fish.y + (math.sin(Radian))*scrollSpeed
	Radian = Radian + 0.01
end

--call event
Runtime:addEventListener("enterFrame", MoveFish)

--move jellyfish
local function MoveJellyFish(event)
	-- move in a diagonal line
	jellyFish.y = jellyFish.y + scrollSpeed
	jellyFish.x = jellyFish.x + scrollSpeed
end

--call event
Runtime:addEventListener("enterFrame", MoveJellyFish)