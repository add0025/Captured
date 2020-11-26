local composer = require( "composer" )
local scene = composer.newScene()
local csv = require('csv') 
local csv_path = system.pathForFile ('cursed_story_line_1.csv')
local f = csv.open(csv_path )
header = true
local promptTable = {};
local counter = 0
 
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view
 
   for field  in f:lines() do

      if field[1] == 'Prompts' then
         local promptHeader = field[1]
      else
      local prompt  =display.newText(field[1], display.contentCenterX, 5, 200, 0, native.systemFont,20)
      table.insert( promptTable ,  prompt )
      end --end of if statement
     -- print(field[1])
  
  end --end of for loop

   

for _, aPrompt in ipairs(promptTable) do
counter = counter + 1
aPrompt.name = "Prompt " .. counter .. "a";
print(aPrompt.name)

end --end of for loop


function BeginStory()

   for _, aPrompt in ipairs(promptTable) do

      if aPrompt.name ~= "Prompt 1a" then


 aPrompt.isVisible = false

      end --end of if


   end --end of for loop



end --end of BeginStory funciton

Runtime:addEventListener( "enterFrame", BeginStory, 1)
   
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end --end of create scene function
 
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