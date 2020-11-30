local composer = require( "composer" )
local scene = composer.newScene()
local csv = require('csv') 
local csv_path = system.pathForFile ('cursed_story_line_2.csv')
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
 local choose
local myData
local special_eleven_prompt
local option1_11
local widget = require( "widget" )
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
       --print("******TEXT*******" .. switch.text)

       
       if(switch.text == "Prompt 4b2 Option 1: Slowly walk through the house and look for any door that appears to open to the outside.") then 
          option_text = "Card 7b"
          displayNextCard()

       elseif(switch.text == "Prompt 2b Option 1:Try and reason again, there most be some heart left in this man.") then 
        myData = "Card 3a"
        print("made it here")
        local options ={

           params ={type= myData}
  
        };
        composer.gotoScene( "first_story_line" ,options )

         -- do not miss the below line to avoid the event propagation
         return true;

       elseif(switch.text == "Prompt 2b Option 2: Quick! theres a door to the left of the room, while he's turned around run and find the nearest exit!") then
        option_text = "Card 2b"
        displayNextCard()

       elseif (switch.text == "Prompt 2b Option 3: Stay put. You gotta start thinking stuff out, and try and not do anything drastic.") then
          
        option_text = "Card 3b"
        displayNextCard()

       
       elseif (switch.text == "Prompt 5b Option 1: Ignore it. It might be a trap.") then
        myData = "Card 7a"
        local options ={

           params ={type= myData}
  
        };
        composer.gotoScene( "first_story_line" ,options )

         -- do not miss the below line to avoid the event propagation
         return true;
 
       elseif(switch.text == "Prompt 3b Option 2: You hear voices in the distance that appear to be coming from outside. They do not sound like Cerials voice. Perhaps they are joggers. Scream at the top of your lungs in hopes that they hear you.") then 
            myData = "Card 4a"
            local options ={
   
               params ={type= myData}
      
            };
            composer.gotoScene( "first_story_line" ,options )
            -- do not miss the below line to avoid the event propagation
            return true;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
          
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
       local option3 =display.newText(field[4], display.contentCenterX, 500, 200, 0, native.systemFont,15)
       
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
    aPrompt[counter].name = "Card " .. card_counter .. "b";
    --print(aPrompt[counter].name)
    --print(aPrompt[counter].text)
    counter = counter + 1
   aPrompt[counter].name = "Card " .. card_counter .. "b";
   aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
   --print(aPrompt[counter].name)
    --print (aPrompt[counter].text)
    counter = counter + 1
    aPrompt[counter].name = "Card " .. card_counter .. "b";
    aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
    --print(aPrompt[counter].name)
     --print (aPrompt[counter].text)
     counter = counter + 1
     aPrompt[counter].name = "Card " .. card_counter .. "b";
     aPrompt[counter]: addEventListener( "tap", beginStoryLoop )
     --print(aPrompt[counter].name)
      --print (aPrompt[counter].text)
      counter = counter + 1
 
    
    card_counter =card_counter+1
 
    end --end of for loop
 
    
 
    print(counter)
    counter = 1
 
    --if then
    choose =event.params.type
 
       for _, aPrompt in ipairs(promptTable) do
 
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
    
       if (aPrompt[counter].name == tostring(choose)) then
       print(aPrompt[counter].text)
       end --end of if
       if (aPrompt[counter].name ~= tostring(choose))  then
          aPrompt[counter].isVisible = false
          end --of if
       counter = counter + 1
    end --end of for loop

--end --end of outtermost if


    print(counter)

end --End of create function









 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase



 
   function displayNextCard()
    --print("function 6")
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
             end

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
            -- print("******TEXT*******" .. switch.text)


             if(switch.text == "Prompt 3b Option 2: You hear voices in the distance that appear to be coming from outside. They do not sound like your capture’s voice. Perhaps they are joggers. Scream at the top of your lungs in hopes that they hear you.") then 
                myData = "Card 4a"
                local options ={
       
                   params ={type= myData}
          
                };
                composer.gotoScene( "first_story_line" ,options )
                -- do not miss the below line to avoid the event propagation
                return true;


            elseif (switch.text == "Prompt 3b Option 1: Search for a key to unlock the room you have been placed in.") then
                option_text = "Card 4b"
               displayNextCard()


            elseif (switch.text == "Prompt 4b Option 2: Look for any object that looks like it could make a good weapon, Cerial could come back at any time.") then
                option_text = "Card 8b"
               displayNextCard()



            elseif (switch.text == "Prompt 5b Option 2: Walk towards the noise. It could be another victim in need.") then
                option_text = "Card 9b"
               displayNextCard()




            elseif (switch.text == "Prompt 5b2 Option 1: Ignore it. It might be a trap.") then
               
                myData = "Card 7a"
                local options ={
       
                   params ={type= myData}
          
                };
                composer.gotoScene( "first_story_line" ,options )
                -- do not miss the below line to avoid the event propagation
                return true;

            elseif (switch.text == "Prompt 5b2 Option 2: Walk towards the noise. It could be another victim in need.") then
                option_text = "Card 9b"
               displayNextCard()



            elseif (switch.text == "Prompt 6b Option 1: Quick! Use an item in your inventory to cut her free. (if no item in inventory this option will be grayed out or locked. Key does not work either.)") then
                option_text = "Card 10b"
               displayNextCard()



 elseif (switch.text == " Prompt 6b Option 2: Oh, no! you have no way to set her free! Search the room to see if there is any way to set her free.") then
                option_text = "Card 11b"
               displayNextCard()


elseif (switch.text == 'Prompt 7b Option 1: "Are you alright? Who are you?"') then
                option_text = "Card 12b"
               displayNextCard()



            elseif (switch.text == 'Prompt 7b Option 2: "How did you get here?"') then
                option_text = "Card 13b"
               displayNextCard()

            elseif (switch.text == 'Prompt 7b Option 3: "Quick! How do we get out of here?"') then
                option_text = "Card 14b"
               displayNextCard()




            elseif (switch.text == 'Prompt 7b2 Option 1: "Are you alright? Who are you?"') then
                option_text = "Card 12b"
               displayNextCard()



            elseif (switch.text == 'Prompt 7b2 Option 2: "How did you get here?"') then
                option_text = "Card 13b"
               displayNextCard()

            elseif (switch.text == 'Prompt 7b2 Option 3: "Quick! How do we get out of here?"') then
                option_text = "Card 14b"
               displayNextCard()




            elseif (switch.text == 'Prompt 8b Option 1: "Kimberly Johnson? That sounds famililar! You need to get more information to jog your memory.') then
                option_text = "Card 15b"
            special_eleven_prompt = tostring(switch)

               displayNextCard()


            elseif (switch.text == 'Prompt 8b Option 2: Enough small talk. Time for you and Kimberly to make your escape.') then
                option_text = "Card 16b"
               displayNextCard()



            elseif (switch.text == 'Prompt 9b Option 1: Sounds similar to how you arrived at this strange place. Maybe if you ask more questions you can get more informmation on exactly how you got here and who SHE is.') then
                option_text = "Card 21b"
               displayNextCard()


            elseif (switch.text == 'Prompt 9b Option 2: Enough small talk. Time for you and Kimberly to make your escape.') then
                option_text = "Card 16b"
               displayNextCard()


            elseif (switch.text == 'Prompt 10b Option 1: Hm. That sounds like she has been here for a while. Maybe if you ask more questions you can crack the code on who she really is.  and that pattern. That pattern is interesting. Could it be a code to somthing? It is probably a good thing to keep in mind.') then
                option_text = "Card 22b"
               displayNextCard()


            elseif (switch.text == 'Prompt 10b Option 2: Enough small talk. Time for you and Kimberly to make your escape.') then
                option_text = "Card 16b"
               displayNextCard()

            elseif (switch.text == 'Prompt 11b Option 1:   (User picks:Prompt 7b Option 1)"How did d you get here?"') then
                option_text = "Card 13b"
               displayNextCard()

            elseif (switch.text == 'Prompt 11b Option 2:  (User picks:Prompt 7b Option 1) "Quick! How do we get out of here?"') then
                option_text = "Card 14b"
               displayNextCard()



            elseif (switch.text == 'Prompt 11b Option 1:   (User picks:Prompt 7b Option 2) "Are you alright? Who are you?"') then
                option_text = "Card 12b"
               displayNextCard()

            elseif (switch.text == 'Prompt 11b Option 2:  (User picks:Prompt 7b Option 2) "Quick! How do we get out of here?"') then
                option_text = "Card 14b"
               displayNextCard()




            elseif (switch.text == 'Prompt 11b Option 1:   (User picks:Prompt 7b Option 3) "Are you alright? Who are you?"') then
                option_text = "Card 12b"
               displayNextCard()

            elseif (switch.text == 'Prompt 11b Option 2:  (User picks:Prompt 7b Option 3) )"How did d you get here?"') then
                option_text = "Card 13b"
               displayNextCard()



            elseif (switch.text == 'Prompt 12b Option 1: She is right! This must be the outdoors we need to hurry. Unlock the door with your key!') then
                option_text = "Card 17b"
               displayNextCard()

            elseif (switch.text == 'Prompt 12b Option 2:  Cerials bedroom apears to be next door. Maybe if you both go inside you will find some clues on who this man really is.') then
                option_text = "Card 18b"
               displayNextCard()

            elseif (switch.text == ' Prompt 13b  Option 1: Scream at the top of your lungs. Maybe, just maybe someone will hear your cries for help.') then
                option_text = "Card 17b"
               displayNextCard()

            elseif (switch.text == '  Prompt 13b  Option 2: Well. This is it... Might as well explore, and become familiar with this place.') then
                option_text = "Card 19b"
               displayNextCard()


            elseif (switch.text == 'Prompt 15b  Option 1: This man is pathetic.Grab an item in your inventory and CHARGE!') then
                option_text = "Card 20b"
               displayNextCard()

            elseif (switch.text == 'Prompt 15b Option 2: Run around past him and go back outside the basement to find another opening. another door there must be one.') then
                option_text = "Card 19b"
               displayNextCard()


            elseif (switch.text == 'Prompt 15b  Option 3: The door the keypad. the pattern Kimberly mentioned. Maybe if I type it in it will open the door and we will be out of here!  (will be locked if Kimerly never gave the pattern to user)') then
               -- option_text = "Card 19b"
               --displayNextCard()
               composer.gotoScene( "keypadscene" ,options )


            elseif (switch.text == 'Prompt 14b Option 1: Read it! (If the user chooses not to the item will be placed in their inventory). Interesting. Now time to get out of here') then
                option_text = "Card 17b"
               displayNextCard()

            elseif (switch.text == 'Prompt 14b  Option 2: Well now that the bed rooms checked, time to see what that door is about.') then
                option_text = "Card 17b"
               displayNextCard()








            elseif (switch.text == 'Prompt 16b  Option 1: Try and restle Kimberly out of his grip.') then
                option_text = "Card 20b"
               displayNextCard()


            elseif (switch.text == 'Prompt 16b  Option 2: Run around past him and go back outside the basement to find another opening. another door there must be one.') then
                option_text = "Card 20b"
               displayNextCard()

            elseif (switch.text == 'Prompt 16b  Option 3: The door the keypad. the pattern Kimberly mentioned. Maybe if I type it in it will open the door and I willl be able to get help for Kimberly!(will be locked if Kimerly never gave the pattern to user)') then
                --option_text = "Card 20b"
              -- displayNextCard() 
              composer.gotoScene( "keypadscene" ,options )













            elseif (switch.text == "Prompt 6b Option 3: Leave. once you find a way out you will be able to get help for her later.") then
                myData = "Card 7a"
                local options ={
       
                   params ={type= myData}
          
                };
                composer.gotoScene( "first_story_line" ,options )
                -- do not miss the below line to avoid the event propagation
                return true;




            elseif (switch.text == "Prompt 4a Option 3: Search the house for a phone and call the police immediately.") then
                myData = "Card 6a"
                local options ={
       
                   params ={type= myData}
          
                };
                composer.gotoScene( "first_story_line" ,options )
                -- do not miss the below line to avoid the event propagation
                return true;



            elseif (switch.text == "Prompt 3b Option 3: Stay put, you do not know when Cerial will be coming back. You will have a better chance of escaping when he goes to bed.") then
                myData = "Card 5a"
                local options ={
       
                   params ={type= myData}
          
                };
                composer.gotoScene( "first_story_line" ,options )
                -- do not miss the below line to avoid the event propagation
                return true;






             
             
       
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