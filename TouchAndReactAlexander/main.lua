-----------------------------------------------------------------------------------------
-- Title: TouchAndReact
-- Name: Alexander Matheson
-- Course: ICS2O/3C
-- This program displays 2 images, one on top of the other, when the top image is clicked, it turns invisible, displays text and plays a sound.
-----------------------------------------------------------------------------------------

-- set background color
display.setDefault("background", 100/255, 190/255, 255/255)

--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Set sound Variable
local Sound = audio.loadStream("Sounds/Correct Answer Sound Effect.mp3")

--Create and position blue button
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)

blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

--create and position red button
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

--Create text and set it's position
local textObject = display.newText("You have pressed a button", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1,1,0)
textObject.isVisible = false

-- Function: BlueButtonListener
--Input: Touch Listener
--Output: None
--Description: When Blue button is clicked, it will make text appear and play a sound,then make it self invisible and the red button visible
	local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		local soundChannel = audio.play( Sound, {channel=1, loops=0, fadein=0})
	end

		if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

--Add the Listener
blueButton:addEventListener("touch", BlueButtonListener)

-- Function: RedButtonListener
--Input: Touch Listener
--Output: None
--Description: When Red button is not clicked, it will make text disappear,then make it self invisible and the Blue button visible
	local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

		if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

--Add the Listener
redButton:addEventListener("touch", RedButtonListener)