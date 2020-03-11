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
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer

-------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------

local function AskQuestion()
	--generate 2 random numbers
	randomNumber1 = math.random(1, 8)
	randomNumber2 = math.random(1, 8)

	correctAnswer = randomNumber1 + randomNumber2

	--create question in text object
	questionObject.text = randomNumber1.. " + " .. randomNumber2.. "="
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectAnswer.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )
	--user editd "numeric field"
	if(event.phase == "began") then

		--clear field
		event.target.text = ""

	elseif (event.phase == "submited") then

		--when the enter key is pressed set imput to answer
		userAnswer = tonumber(event.target.text)

		--if the answer is correct
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			timer.performWithDelay(2500, HideCorrect)

		else
			incorrectAnswer.isVisible=true
			timer.performWithDelay(2500, HideIncorrect)

		end
	end
end

--------------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------------

--Displays a question and sets color
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor(255/255, 255/255, 255/255)

--create correct and incorrect text object
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(255/255, 255/255, 255/255)
correctObject.isVisible= false

incorrectAnswer = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectAnswer:setTextColor(255/255, 255/255, 255/255)
incorrectAnswer.isVisible= false

--Create numeric field
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType= "number"

--add event listener for numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-------------------------------------------------------------------------
--FUNCTION CALLS
-------------------------------------------------------------------------

--call the function to ask the question
AskQuestion()
