------------------------------------------------------------------------------
-- In "pause.lua"
------------------------------------------------------------------------------
local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()




local function handleButtonEvent( event )

    myData ="Card 10a"
            local options ={
   
               params ={type= myData}
      
            };
            composer.gotoScene( "first_story_line" ,options )
end

-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view
 
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).

      myPauseImg = display.newImage('newspaper2.png')
      myPauseImg.x = display.contentCenterX
      myPauseImg.y = display.contentCenterY
      sceneGroup:insert(myPauseImg)

      local button1 = widget.newButton(
	    {
	        x = 200,
	        y = 25,
	        id = "button1",
	        label = "Resume",
	          labelColor = {default = {1, 0, 0}, over = {0, 0, 0, 0.5}},
           	        onEvent = handleButtonEvent
	    }
		)

       sceneGroup:insert(button1)

   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
     -- timer.performWithDelay(3000, showScene1)
   end
end
 

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
    

    if ( phase == "will" ) then
        -- Call the "resumeGame()" function in the parent scene
        
    end


end

 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

 
-- By some method (a pause button, for example), show the overlay
-- Create the widget

---------------------------------------------------------------------------------
 -- By some method (a "resume" button, for example), hide the overlay

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene