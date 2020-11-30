
local composer = require( "composer" )
local scene = composer.newScene()
local TitleMusic = audio.loadSound("MusicAndScreens/Deathsong.wav")
local widget = require('widget')
local death1 = "Cerial Quickly grabs you and ends you right then and there. Maybe it would be a good idea to wait for him to leave before anymore plans of action..."
local myData = "17b"
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

   --local background = display.newImageRect("MusicAndScreens/DeathScene.png", display.contentWidth + 450, display.contentHeight + 500)
   local TitleText = display.newText(death1, display.contentCenterX, display.contentCenterY, native.systemFont, 50)
   TitleText:setFillColor(1.0, 0.0, 0.0)
   --sceneGroup:insert(background)
   sceneGroup:insert(TitleText)

   --[[function play_background_music()   

     audio.play(TitleMusic,{
         channel =1,        
         loops = -1,    

       });  

  end

Runtime:addEventListener("enterFrame", play_background_music);--]]

local function TryAgainFunction (event)

   myData = "Card 17b"
   local options ={

      params ={type= myData}

   };
   composer.gotoScene( "second_story_line" ,options )
   -- do not miss the below line to avoid the event propagation
   return true;


end --end of TryAgainFunction


local TryAgain = display.newText("Try Again", display.contentCenterX+20, display.contentCenterY+20, native.systemFont, 20)
TryAgain:setFillColor(1.0, 0.0, 0.0)
sceneGroup:insert(TryAgain)
TryAgain: addEventListener( "tap", TryAgainFunction)




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