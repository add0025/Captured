local composer = require( "composer" )
local scene = composer.newScene()
local csv = require('csv') 
local csv_path = system.pathForFile ('cursed_story_line_1.csv')
local f = csv.open(csv_path )
header = true
local promptTable = {}; -- table to hold all the Prompts
local optionsTable = {}; --table that holds all the options
local cardGroup = display.newGroup() --hold each indiviual card
local counter = 1
local prompt_counter = 1
 local option_counter = 2
 local card_counter =1

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

   --load the prompts from the csv file and put into table
 
   for field  in f:lines() do

      if field[1] == 'Prompts' and field[2] == 'Option 1' then
         local promptHeader = field[1]
         local option1Header = field[2]
         print(promptHeader)
         print(option1Header)
      else
      local prompt  =display.newText(field[1], display.contentCenterX, 5, 200, 0, native.systemFont,20)
      local option1 =display.newText(field[2], display.contentCenterX, 300, 200, 0, native.systemFont,20)

     -- print (prompt.text)
     -- print (option1.text)
     cardGroup:insert(prompt)
     cardGroup:insert(option1)
      table.insert( promptTable ,  cardGroup )
      end --end of if statement
     -- print(field[1])
  
  end --end of for loop


  --lable the prompts within the table
   

  for _, aPrompt in ipairs(promptTable) do
   aPrompt[counter].name = "Card " .. card_counter .. "a";
   --print(aPrompt[counter].name)
   --print(aPrompt[counter].text)
   counter = counter + 1
  aPrompt[counter].name = "Card " .. card_counter .. "a";
  --print(aPrompt[counter].name)
   --print (aPrompt[counter].text)
   counter = counter + 1
   card_counter =card_counter+1

   end --end of for loop
   print(counter)
   counter = 1

   ----function BeginStory()

      for _, aPrompt in ipairs(promptTable) do
      if (aPrompt[counter].name == "Card 1a") then
      print(aPrompt[counter].text)
      end --end of if
      if (aPrompt[counter].name ~= "Card 1a") then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1
      if (aPrompt[counter].name == "Card 1a") then
      print(aPrompt[counter].text)
      end --end of if
      if (aPrompt[counter].name ~= "Card 1a") then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1





   end --end of for loop
   print(counter)


--end --end of BeginStory funciton

--Runtime:addEventListener( "enterFrame", BeginStory, 1)


--load in the options


   
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