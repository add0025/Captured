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
 local option_text
 local choose=  "Card 1a"
 local myData =  "Card 1a"
---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view



function displayNextCard()

   for _, aPrompt in ipairs(promptTable) do

      if (aPrompt[counter].name == tostring(option_text)) then
      print(aPrompt[counter].text)
      aPrompt[counter].isVisible = true
      end --end of if
      if (aPrompt[counter].name ~= tostring(option_text)) then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1
      if (aPrompt[counter].name == tostring(option_text)) then
         print(aPrompt[counter].text)
         aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
         aPrompt[counter].isVisible = true
         end --end of if
         if (aPrompt[counter].name ~= tostring(option_text)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
   
         if (aPrompt[counter].name == tostring(option_text)) then
            print(aPrompt[counter].text)
            aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
            aPrompt[counter].isVisible = true
            end --end of if
            if (aPrompt[counter].name ~= tostring(option_text)) then
               aPrompt[counter].isVisible = false
               end --of if
            counter = counter + 1
   
      if (aPrompt[counter].name == tostring(option_text)) then
      print(aPrompt[counter].text)
      aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
      aPrompt[counter].isVisible = true
      end --end of if
      if (aPrompt[counter].name ~= tostring(option_text)) then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1
   end --end of for loop

end--end of function





   --load the prompts from the csv file and put into table
   function beginStoryLoop(event)

      counter = 1
      local switch = event.target
      if(switch.text == "Prompt 1 Option 1: Sceam! There must be someone near by.") then 
         option_text = "Card 2a"
         displayNextCard()
      
      elseif (switch.text == "Prompt 2 Option 1:Try and reason again, there most be some heart left in this man!") then
         print("hello")
         option_text = "Card 3a"
        displayNextCard()

      elseif (switch.text == "Prompt 3a Option 1: Cry, you are done for!") then
         print("hello")
         option_text = "Card 3a"
         displayNextCard()
         
      elseif (switch.text == "Prompt 1a Option 2: Demand your release. Who does this guy think he is?") then
         print("hello")
         option_text = "Card 2a"
         displayNextCard()

      elseif (switch.text == "Prompt 3a Option 2: Now is your time to really remain calm. You know there must be a key or some pointy object to poke a hole in the duct tape. Look for it.") then
--print("hello")
         myData = "Card 5b"
         local options ={

            params ={type= myData}
   
         };
         composer.gotoScene( "second_story_line" ,options )
         -- do not miss the below line to avoid the event propagation
         return true;

       -- displayNextCard()

   end--end of if



   end--end of Begin StoryLoop
   




   for field  in f:lines() do

      if field[1] == 'Prompts' and field[2] == 'Option 1' 
      and field[3] == 'Option 2' and field[4] == 'Option 3' then
         local promptHeader = field[1]
         local option1Header = field[2]
         local option2Header = field[3]
         local option3Header = field[4]

         print(promptHeader)
         print(option1Header)
         print(option2Header)
         print(option3Header)

      else
      local prompt  =display.newText(field[1], display.contentCenterX, 5, 200, 0, native.systemFont,20)
      local option1 =display.newText(field[2], display.contentCenterX, 200, 200, 0, native.systemFont,15)
      local option2 =display.newText(field[3], display.contentCenterX, 300, 200, 0, native.systemFont,15)
      local option3 =display.newText(field[4], display.contentCenterX, 400, 200, 0, native.systemFont,15)
      
     -- print (prompt.text)
     -- print (option1.text)
     cardGroup:insert(prompt)
     cardGroup:insert(option1)
     cardGroup:insert(option2)
     cardGroup:insert(option3)
      table.insert( promptTable ,  cardGroup )
      sceneGroup:insert(cardGroup)

      end --end of if statement
     -- print(field[1])
  
  end --end of for loop
  --
  

  --lable the prompts within the table
   

  for _, aPrompt in ipairs(promptTable) do
   aPrompt[counter].name = "Card " .. card_counter .. "a";
   --print(aPrompt[counter].name)
   --print(aPrompt[counter].text)
   counter = counter + 1
  aPrompt[counter].name = "Card " .. card_counter .. "a";
  aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
  --print(aPrompt[counter].name)
   --print (aPrompt[counter].text)
   counter = counter + 1
   aPrompt[counter].name = "Card " .. card_counter .. "a";
   aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
   --print(aPrompt[counter].name)
    --print (aPrompt[counter].text)
    counter = counter + 1
    aPrompt[counter].name = "Card " .. card_counter .. "a";
    aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
    --print(aPrompt[counter].name)
     --print (aPrompt[counter].text)
     counter = counter + 1

   
   card_counter =card_counter+1

   end --end of for loop

   

   print(counter)
   counter = 1
   if (event.params == nil) then
      print("hello")
   else
   choose = event.params.type
   end--end of if statement

      for _, aPrompt in ipairs(promptTable) do

      if (aPrompt[counter].name ==tostring(choose)) then
      print(aPrompt[counter].text)
      end --end of if
      if (aPrompt[counter].name ~=tostring(choose)) then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1
      if (aPrompt[counter].name == tostring(choose)) then
         print(aPrompt[counter].text)
         end --end of if
         if (aPrompt[counter].name ~= tostring(choose)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
   
         if (aPrompt[counter].name == tostring(choose)) then
            print(aPrompt[counter].text)
            end --end of if
            if (aPrompt[counter].name ~= tostring(choose)) then
               aPrompt[counter].isVisible = false
               end --of if
            counter = counter + 1
   
      if (aPrompt[counter].name == tostring(choose)) then
      print(aPrompt[counter].text)
      end --end of if
      if (aPrompt[counter].name ~= tostring(choose)) then
         aPrompt[counter].isVisible = false
         end --of if
      counter = counter + 1
   end --end of for loop
   print(counter)







   
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end --end of create scene function
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase



   function displayNextCard()
print("function 6")
      for _, aPrompt in ipairs(promptTable) do
   
         if (aPrompt[counter].name == tostring(option_text)) then
         print(aPrompt[counter].text)
         aPrompt[counter].isVisible = true
         end --end of if
         if (aPrompt[counter].name ~= tostring(option_text)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
         if (aPrompt[counter].name == tostring(option_text)) then
            print(aPrompt[counter].text)
            aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
            aPrompt[counter].isVisible = true
            end --end of if
            if (aPrompt[counter].name ~= tostring(option_text)) then
               aPrompt[counter].isVisible = false
               end --of if
            counter = counter + 1
      
            if (aPrompt[counter].name == tostring(option_text)) then
               print(aPrompt[counter].text)
               aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
               aPrompt[counter].isVisible = true
               end --end of if
               if (aPrompt[counter].name ~= tostring(option_text)) then
                  aPrompt[counter].isVisible = false
                  end --of if
               counter = counter + 1
      
         if (aPrompt[counter].name == tostring(option_text)) then
         print(aPrompt[counter].text)
         aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
         aPrompt[counter].isVisible = true
         end --end of if
         if (aPrompt[counter].name ~= tostring(option_text)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
      end --end of for loop
   
   end--end of function
   
   
   
   
   
      --load the prompts from the csv file and put into table
      function beginStoryLoop(event)
   
         counter = 1
         local switch = event.target
        --print(switch.text)
         if(switch.text == "Prompt 6a Option 1: Hurry! This must be the outdoors! We made it, unlock the door with your key! ") then 
            --print("hello")
            option_text = "Card 8a"
            displayNextCard()
         
         elseif (switch.text == " Prompt 7a  Option 1: Scream at the top of your lungs. Maybe, just maybe someone will hear your cries for help.") then
            option_text = "Card 8a"
           displayNextCard()
   
         elseif (switch.text == "  Prompt 7a2 Option 2: Well. This is it... Might as well explore, and become familiar with this place...") then
            option_text = "Card 12a"
            displayNextCard()


         elseif (switch.text == "Prompt 3a Option 2: Now is your time to really remain calm. You know there must be a key or some pointy object to poke a hole in the duct tape. Look for it.") then
   --print("hello")
            myData = "Card 5b"
            local options ={
   
               params ={type= myData}
      
            };
            composer.gotoScene( "second_story_line" ,options )
            -- do not miss the below line to avoid the event propagation
            return true;
   
          -- displayNextCard()
   
         end--end of if



      end--end of Begin StoryLoop



 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).


      counter = 1
      if (event.params == nil) then
         print("hello")
      else
      choose = event.params.type
      print(choose)

      end--end of if statement
   
         for _, aPrompt in ipairs(promptTable) do
   
         if (aPrompt[counter].name ==tostring(choose)) then
         print(aPrompt[counter].text)
         --aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
         aPrompt[counter].isVisible = true
         end --end of if
         if (aPrompt[counter].name ~=tostring(choose)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
         if (aPrompt[counter].name == tostring(choose)) then
            print(aPrompt[counter].text)
            aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
            aPrompt[counter].isVisible = true
            end --end of if
            if (aPrompt[counter].name ~= tostring(choose)) then
               aPrompt[counter].isVisible = false
               end --of if
            counter = counter + 1
      
            if (aPrompt[counter].name == tostring(choose)) then
               print(aPrompt[counter].text)
               aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
               aPrompt[counter].isVisible = true
               end --end of if
               if (aPrompt[counter].name ~= tostring(choose)) then
                  aPrompt[counter].isVisible = false
                  end --of if
               counter = counter + 1
      
         if (aPrompt[counter].name == tostring(choose)) then
         print(aPrompt[counter].text)
         aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
         aPrompt[counter].isVisible = true
         end --end of if
         if (aPrompt[counter].name ~= tostring(choose)) then
            aPrompt[counter].isVisible = false
            end --of if
         counter = counter + 1
      end --end of for loop
      print(counter)
  -- return;






   elseif ( phase == "did" ) then

      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.

     

   end --end of if
end --end of show function
 
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