-----------------------------------------------------------------------------------------
-- Title: WhackAMole
-- Name: Alexander
-- Course: ICS2O/3C
-- This program makes an object appear on the screen for an amount of time and then disappears if the user clicks on the object, his or her score increases by 1
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--Background
display.setDefault("background", 120/255, 250/255, 200/255)

--sounds
local whackSound = audio.loadSound( "Sounds/Whack.mp3")
local whackSoundChannel
local backgroundMusic = audio.loadStream( "Sounds/Music.mp3")
local backgroundMusicChannel = audio.play(backgroundMusic, {channel = 1, loops = -1, fadein = 0})

--create bug
local bug = display.newImage( "Images/bug..png" , 0, 0)

--set position
bug.x = display.contentCenterX
bug.y = display.contentCenterY

bug:scale(0.05, 0.05)

--make bug invisible
bug.isVisible = false

--Keep track of the score
local score = 0
local scoreText = display.newText( "score = "..score, display.contentWidth/2, display.contentHeight-50, nil, 70)
scoreText:setTextColor(155/255, 42/255, 198/255)

--make the bug appear randomly
function PopUp()
	--choose random x.y position
	bug.x = math.random (0, display.contentWidth-50)
	bug.y = math.random (0, display.contentHeight-50)
	bug.isVisible = true
	timer.performWithDelay(700, Hide)
end

--this calls popup every 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

--this hides the bug
function Hide()
	--make bug invisible
	bug.isVisible = false
	PopUpDelay()
end

--this starts the game
function GameStart()
	PopUpDelay()
end

--This increases the score if the mole is clicked
function Whacked( touch )
	if (touch.phase == "began") then
		whackSoundChannel = audio.play(whackSound)
		score = score + 1
		scoreText = "score = "..score
	end
end
--------------------------------------------------------------------------------------
--event listeners
--------------------------------------------------------------------------------------
bug:addEventListener( "touch" , Whacked )

--start the game
GameStart()