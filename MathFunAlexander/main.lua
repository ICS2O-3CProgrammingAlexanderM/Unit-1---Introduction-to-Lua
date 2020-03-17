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
		correctAnswer = randomNumber1 - randomNumber2

		--create question in text object
		questionObject.text = randomNumber1.. " - " .. randomNumber2.. "="
	-- do muliplication
	elseif (operation == 3) then
		correctAnswer = randomNumber1 * randomNumber2

		--create question in text object
		questionObject.text = randomNumber1.. " X " .. randomNumber2.. "="

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectAnswer.isVisible = false
	AskQuestion()
end

local function ShowWin()
	correctObject.isVisible = false
	incorrectAnswer.isVisible = false
	pointsText.isVisible = false
	livesText.isVisible = false
	questionObject.isVisible = false
	numericField.isVisible = false
	win.isVisible = true
end

local function ShowOver()
	correctObject.isVisible = false
	incorrectAnswer.isVisible = false
	pointsText.isVisible = false
	livesText.isVisible = false
	questionObject.isVisible = false
	numericField.isVisible = false
	over.isVisible = true
	display.setDefault("background", 0, 0, 0)
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
			timer.performWithDelay(2500, HideCorrect)
			if (points == 5) then
				timer.performWithDelay(2500, ShowWin)
			end

		else
			--update lives
			lives = lives - 1

			--update text
			livesText.text = "Lives = " .. lives

			incorrectAnswer.isVisible=true
			timer.performWithDelay(2500, HideIncorrect)
			if (lives == 0) then
				timer.performWithDelay(2500, ShowOver)
			end

		end
	end
end

--------------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------------

--Display amount of points as a text object
pointsText = display.newText("Points = " .. points, display.contentWidth-150, display.contentHeight/8, nil, 50)

--display lives as a text object
livesText = display.newText("Lives = ".. lives, 150, display.contentHeight/8, nil, 50)

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
numericField.inputType= "number"

--add event listener for numeric field
numericField:addEventListener("userInput", NumericFieldListener)

--Create the winning message
win = display.newText("You Win!!!!", display.contentWidth/2, display.contentHeight/2, nil, 50)
win:setTextColor(1, 1, 1)
win.isVisible = false

over = display.newText("Game Over", display.contentWidth/2, display.contentHeight/2, nil, 50)
over:setTextColor(178/255, 31/255, 0/255)
over.isVisible = false
-------------------------------------------------------------------------
--FUNCTION CALLS
-------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()
