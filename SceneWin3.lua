
local composer = require( "composer" )
local scene = composer.newScene()
local widget = require('widget')
local noKimberlyWin = "CONGRATULATIONS YOU HAVE BEAT THE GAME AND CERIAL!: NO KIMBERLY IN PLOT: CONGRATS. YOU HAVE NARROWLY ESCAPED THE GRASP OF CERIAL THE SERIAL KILLER...YOU RUN TO FIND HELP AND ONCE YOU LET THE BYSTANDERS KNOW WHAT HAD HAPPENED IN THAT TERRIBLE HOUSE CERIAL IS ARRESTED. CERIAL WENT ON TO GO ON DEATH ROW FOR THE MURDER OF 25 VICTIMS... TO THIS DAY ALL THE VICTIMS EXCEPT ONE HAVE BEEN NAMED.... COULD THAT HAVE BEEN THE GIRL IN THE ROOM WHIMPERING? TO THIS DAY YOU STILL PONDER WHAT WOULD HAVE HAPPEND IF YOU WOULD HAVE STOPPED AND SAVED HER."

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

   --local background = display.newImageRect("MusicAndScreens/WinScene.png", display.contentWidth + 450, display.contentHeight + 500)
   local TitleText = display.newText(noKimberlyWin, display.contentCenterX, display.contentCenterY, native.systemFont, 50)



   TitleText:setFillColor(1.0, 0.0, 0.0)

   --sceneGroup:insert(background)
   sceneGroup:insert(TitleText)

   


   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene