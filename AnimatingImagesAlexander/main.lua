-----------------------------------------------------------------------------------------
--Name: Alexander
-- Corse: ICS20/3C
--Animating Images
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Set variables
local backgroundImage = display.newImageRect("Images/Ocean.jpg", 1024, 768)
local octopus = display.newImageRect("Images/Octopus.png", 150, 150)
local fish = display.newImageRect("Images/Fish.png", 200, 150)
local jellyFish = display.newImageRect("Images/JellyFish.png", 150, 200)
local scrollSpeed = 3

--set cordinates
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2
octopus.x = display.contentWidth/2
octopus.y = 600
fish.x = 900
fish.y = 300
jellyFish.x = 200
jellyFish.y = 100

--move Images
local function MoveOctopus(event)
	--add scrollSpeed to x value
    octopus.x = octopus.x + scrollSpeed
end

--call event
Runtime:addEventListener("enterframe", MoveOctopus)

