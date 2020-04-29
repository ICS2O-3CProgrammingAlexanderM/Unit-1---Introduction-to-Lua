-----------------------------------------------------------------------------------------
-- Title: PhysicsAndCollisions
-- Name: Alexander
-- Course: ICS2O/3C
-- This program has objects that fall and collide with the ground, i added extra objects and modified the location an angle of the ramp. I also added background music.
-----------------------------------------------------------------------------------------

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--load physics
local physics = require("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------
--Objects
-----------------------------------------------------------------------------------
--Ground
local ground = display.newImage("Images/ground.png", 0, 0)

ground.x = display.contentWidth/2
ground.y = display.contentHeight

ground.width = display.contentWidth

--add to physics
physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3})

----------------------------------------------------------------------------

--beam
local beam = display.newImage("Images/beam.png", 0, 0)

beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

beam.width = display.contentWidth/2
beam.height = display.contentHeight/10

--rotate the beam
beam:rotate(45)

--send to back layer
beam:toBack()

--add to physics
physics.addBody(beam, "static", {friction = 0.5, bounce = 0.3})

--beam2
local beam2 = display.newImage("Images/beam.png", 0, 0)

beam2.x = display.contentWidth-100
beam2.y = display.contentHeight

beam2.width = display.contentWidth/2
beam2.height = display.contentHeight/10

--rotate the beam
beam2:rotate(-45)

--send to back layer
beam2:toBack()

--add to physics
physics.addBody(beam2, "static", {friction = 0.5, bounce = 0.3})

--create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)

--set x and y cords
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY

--set size
bkg.width = display.contentWidth
bkg.height = display.contentHeight

--send to back
bkg:toBack()

------------------------------------------------------------------------------------
--FUNCTIONS
------------------------------------------------------------------------------------

--create first ball
local function firstBall()
	-- Creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)

	--add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

--create second ball
local function secondBall()
	-- Creating first ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	--add to physics
	physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=12.5})

	ball2:scale( 0.5, 0.5)
end

------------------------------------------------------------------------------------
--Timer delays
------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)