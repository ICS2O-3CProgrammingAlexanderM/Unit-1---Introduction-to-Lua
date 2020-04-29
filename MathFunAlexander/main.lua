-----------------------------------------------------------------------------------------
-- Title: NumericTextFields
-- Name: Alexander Matheson
-- Course: ICS2O/3C
-- This program asks the user an addition problem, the user enters their question correctly, the word correct is displayed, otherwise incorrect is displayed.
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

--Set Background
display.setDefault("background", 50/255, 50/255, 255/255)

-------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------

--Create variables
local lives = 3
local heart1
local heart2
local heart3
local points = 0
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local Win
local over
local operation

--Timer variables
local totalSeconds = 10
local secondsLeft = 10
local clockTimer
local countDownTimer
-------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------

--correct sound
local correctSound = audio.loadSound("Sounds/Correct.wav")
local correctSoundChannel

--incorrect sound
local incorrectSound = audio.loadSound("Sounds/Incorrect.mp3")
local incorrectSoundChannel

-------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------

local function AskQuestion()
	--generate 2 random numbers
	randomNumber1 = math.random(1, 8)
	randomNumber2 = math.random(1, 8)

	--pick operation
	operation = math.random(1,4)

	--do addition
	if (operation == 1) then
		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1.. " + " .. randomNumber2.. "="
	
	--do subtraction
	elseif (operation == 2) then
		if (randomNumber1 < randomNumber2) then
			correctAnswer =  randomNumber2 - randomNumber1

			--create question in text object
			questionObject.text = randomNumber2.. " - " .. randomNumber1.. "="

		elseif (randomNumber1 >= randomNumber2) then
			correctAnswer =  randomNumber1 - randomNumber2

			--create question in text object
			questionObject.text = randomNumber1.. " - " .. randomNumber2.. "="
		end


	-- do muliplication
	elseif (operation == 3) then
		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1.. " X " .. randomNumber2.. "="
	
	--do division
	elseif (operation == 4) then
		correctAnswer = randomNumber1 / randomNumber2

		--round the answer to the nearest 10th
		correctAnswer = correctAnswer * 10
		correctAnswer = (math.round(correctAnswer))
		correctAnswer = correctAnswer / 10

		--create question in text object
		questionObject.text = randomNumber1.." ÷ " ..randomNumber2.. "="
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectAnswer.isVisible = false
	AskQuestion()
end

local function HideTime()
	secondsLeft = totalSeconds + 1
	clockText.isVisible = false
end
local function ShowTime()
	secondsLeft = totalSeconds + 1
	clockText.isVisible = true
end

local function ShowWin()
	correctObject.isVisible = false
	incorrectAnswer.isVisible = false
	pointsText.isVisible = false
	questionObject.isVisible = false
	numericField.isVisible = false
	win.isVisible = true
	HideTime()
	timer.cancel( countDownTimer )
end

local function ShowOver()
	correctObject.isVisible = false
	incorrectAnswer.isVisible = false
	pointsText.isVisible = false
	questionObject.isVisible = false
	numericField.isVisible = false
	over.isVisible = true
	display.setDefault("background", 0, 0, 0)
	HideTime()
	timer.cancel( countDownTimer )
end

local function NumericFieldListener( event )
	--user editd "numeric field"
	if(event.phase == "began") then

		--clear field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		--when the enter key is pressed set imput to answer
		userAnswer = tonumber(event.target.text)

		--if the answer is correct
		if (userAnswer == correctAnswer) then
			--Update points
			points = points + 1

			--update text
			pointsText.text = "Points = ".. points

			correctObject.isVisible = true

			--play sound
			correctSoundChannel = audio.play(correctSound)

			HideTime()

			timer.performWithDelay(2500, HideCorrect)
			timer.performWithDelay(2000, ShowTime)
			if (points == 5) then
				timer.performWithDelay(2500, ShowWin)
			end

		else
			--update lives
			lives = lives - 1

			--hide the hearts
			if ( lives == 2 ) then
				heart3.isVisible = false
			elseif ( lives == 1 ) then
				heart2.isVisible = false
			elseif ( lives == 0 ) then
				heart3.isVisible = false
			end

			incorrectAnswer.isVisible = true

			--play sound
			incorrectSoundChannel = audio.play(incorrectSound)

			HideTime()

			timer.performWithDelay(2500, HideIncorrect)
			timer.performWithDelay(2000, ShowTime)
			if (lives == 0) then
				timer.performWithDelay(2500, ShowOver)
			end

		end
	end
end

local function UpdateTime( event )
	--bring down the number of seconds
	secondsLeft = secondsLeft - 1

	clockText.text = "".. secondsLeft

	if (secondsLeft == 0) then

		incorrectAnswer.text = "Out of time, the answer was: "..correctAnswer
		incorrectAnswer.isVisible = true

		HideTime()

		timer.performWithDelay(2000, HideIncorrect)
		timer.performWithDelay(2000, ShowTime)

		AskQuestion()
		incorrectSoundChannel = audio.play(incorrectSound)
		lives = lives - 1
		if ( lives == 2 ) then
			heart3.isVisible = false
			secondsLeft = totalSeconds
		elseif ( lives == 1 ) then
			heart2.isVisible = false
			secondsLeft = totalSeconds
		elseif ( lives == 0 ) then
			heart1.isVisible = false
			timer.performWithDelay(2020,ShowOver)
		end
	end
end

local function StartTimer()
	-- Create a timer
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end
--------------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------------

--Display amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth/2, display.contentHeight/3, nil, 50)

--Displays a question and sets color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(255/255, 255/255, 255/255)

--create correct and incorrect text object
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(255/255, 255/255, 255/255)
correctObject.isVisible= false

incorrectAnswer = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectAnswer:setTextColor(178/255, 31/255, 0/255)
incorrectAnswer.isVisible= false

--Create numeric field
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType= "decimal"

--add event listener for numeric field
numericField:addEventListener("userInput", NumericFieldListener)

--Create the winning message
win = display.newText("You Win!!!!", display.contentWidth/2, display.contentHeight/2, nil, 50)
win:setTextColor(1, 1, 1)
win.isVisible = false

over = display.newText("Game Over", display.contentWidth/2, display.contentHeight/2, nil, 50)
over:setTextColor(178/255, 31/255, 0/255)
over.isVisible = false

--Create lives display
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7/8
heart1.y = display.contentHeight * 1/7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6/8
heart2.y = display.contentHeight * 1/7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5/8
heart3.y = display.contentHeight * 1/7

--number of seconds left
clockText = display.newText(""..secondsLeft, display.contentWidth/2, display.contentHeight/2 + 120, nil, 50)
-------------------------------------------------------------------------
--FUNCTION CALLS
-------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()

--restart the timer
StartTimer()
