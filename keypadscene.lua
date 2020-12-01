local composer = require( "composer" )
local scene = composer.newScene()
local correct_password ="6135831"
local clicked_password=""
local widget = require( "widget" )
local button_sound = audio.loadSound("button-28.wav");

local choose = " "

---------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE
-- unless "composer.removeScene()" is called.
---------------------------------------------------------------------------------
 
-- local forward references should go here
 
---------------------------------------------------------------------------------
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

   




   local background = display.newImageRect( "pad_lock.png", display.contentWidth+450, display.contentHeight+350 )
   background.y=-150
   background.x =-250
   background.anchorX= 0
   background.anchorY= 0
  -- background.xScale = display.contentWidth/background.width
  -- background.yScale = display.contentHeight/background.height  
   sceneGroup:insert(background)

--[[local function codeSubmitted (event)

--sound here
if (tostring(clicked_password) == tostring(correct_password)) then

composer.gotoScene("SceneWin1")





elseif (tostring(clicked_password) ~= tostring(correct_password)) then

   --go to ending scene
   composer.gotoScene("SceneEnd1")


end-- end of if/elseif statement

end -- end of codeSubmitted function







   local enterButton =display.newText("OK", 350, 425, 300, 0,"SpecialElite.ttf",20)
   enterButton:setFillColor( 0.1, 0.1, 0.1)
   sceneGroup:insert(enterButton)

--event listner for the enter button below

enterButton: addEventListener( "tap", codeSubmitted)--]]













   local function handleButtonEvent ( event )

local switch = event.target



    if ("ended" == event.phase) then 
       print ("Buton pressed.")

        if (switch.id =="0")then

            clicked_password = clicked_password .. "0"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="1")then

            clicked_password = clicked_password .. "1"
            print(clicked_password)
            audio.play(button_sound)

        end

        if (switch.id =="2")then

            clicked_password = clicked_password .. "2"
            print(clicked_password)
            audio.play(button_sound)

        end

        if (switch.id =="3")then

            clicked_password = clicked_password .. "3"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="4")then

            clicked_password = clicked_password .. "4"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="5")then

            clicked_password = clicked_password .. "5"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="6")then

            clicked_password = clicked_password .. "6"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="7")then

            clicked_password = clicked_password .. "7"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="8")then

            clicked_password = clicked_password .. "8"
            print(clicked_password)
            audio.play(button_sound)

        end
        if (switch.id =="9")then

            clicked_password = clicked_password .. "9"
            print(clicked_password)
            audio.play(button_sound)

        end
    
    end --end of if
    
    
    
    end --end of handleButtonEvent
    
    
    
    
       local radioGroup= display.newGroup()
    
      -- local buttonSheet = graphics.newImageSheet("captured_3.png")
    
       local button1 = widget.newButton(
           {
            left = 110,
            top = 195,
            id = "1",
           -- label = "1",
            width = 20,
            height =20,
            onEvent = handleButtonEvent } )
       radioGroup:insert( button1 )
    
    
    
    
    
       local button2 = widget.newButton(
          {
            left = 160,
            top = 195,
            id = "2",
           -- label = "2",
           width = 20,
           height =20,
          onEvent = handleButtonEvent} )
      radioGroup:insert( button2 )
    
    

      local button3 = widget.newButton(
       {
        left = 203,
        top = 195,
        id = "3",
      --label = "3",
      width = 20,
      height =20,
       onEvent = handleButtonEvent} )
    radioGroup:insert( button3 )
    
    
    
    local button4 = widget.newButton(
       {
        left = 110,
        top = 270,
        id = "4",
       -- label = "4",
       width = 20,
       height =20,
       onEvent = handleButtonEvent} )
    radioGroup:insert( button4 )
    
    
    local button5 = widget.newButton(
       {
        left = 160,
        top = 270,
        id = "5",
       -- label = "5",
       width = 20,
       height =20,
    
       onEvent = handleButtonEvent} )
    radioGroup:insert( button5 )
    
    
    
    local button6 = widget.newButton(
       {
        left = 205,
        top = 265,
        id = "6",
       -- label = "6",
       width = 20,
       height =20,
    
       onEvent = handleButtonEvent} )
    radioGroup:insert( button6 )
    
    
    
    local button7 = widget.newButton(
        {
            left = 110,
            top = 340,
            id = "7",
           -- label = "7",
           width = 20,
           height =20,

        onEvent = handleButtonEvent} )
     radioGroup:insert( button7 )



     local button8 = widget.newButton(
        {
            left = 160,
            top = 340,
            id = "8",
            --label = "8",
            width = 20,
            height =20,

        onEvent = handleButtonEvent} )
     radioGroup:insert( button8 )



    
     local button9 = widget.newButton(
        {
            left = 205,
            top = 340,
            id = "9",
           -- label = "9",
           width = 20,
           height =20,
        onEvent = handleButtonEvent} )
     radioGroup:insert( button9 )




     local button0 = widget.newButton(
        {
            left = 160,
            top = 410,
            id = "0",
            --label = "0",
            width = 20,
            height =20,

        onEvent = handleButtonEvent} )
     radioGroup:insert( button0 )



     



       sceneGroup:insert(button1)
       sceneGroup:insert(button2)
       sceneGroup:insert(button3)
       sceneGroup:insert(button4)
       sceneGroup:insert(button5)
       sceneGroup:insert(button6)
       sceneGroup:insert(button7)
       sceneGroup:insert(button8)
       sceneGroup:insert(button9)
       sceneGroup:insert(button0)
       --sceneGroup:insert(enterButton)












 
   -- Initialize the scene here.
   -- Example: add display objects to "sceneGroup", add touch listeners, etc.
end
 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then

      if (event.params == nil) then
         print("Keypadscene: params are nil.")
      else
      choose = event.params.type
      print("Choose Text" .. choose)

      end--end of if statement



      local function codeSubmitted (event)

         print("made it here")

         ---KIMBERLY AND YOU STORYLINE (KIMBERLY NOT TAKEN BY CERIAL)
         
         if (tostring(clicked_password) == tostring(correct_password)) then

         if (tostring(choose) == "Prompt 15b  Option 3: The door the keypad. the pattern Kimberly mentioned. Maybe if I type it in it will open the door and we will be out of here!  (will be locked if Kimerly never gave the pattern to user)") then
         composer.gotoScene("SceneWin1")
         end --end of inner if
         
      end
         
         
         if (tostring(clicked_password) ~= tostring(correct_password)) then

            if (tostring(choose) == "Prompt 15b  Option 3: The door the keypad. the pattern Kimberly mentioned. Maybe if I type it in it will open the door and we will be out of here!  (will be locked if Kimerly never gave the pattern to user)") then
               composer.gotoScene("SceneEnd1")
               end --end of inner if
         
         
         end-- end of if/elseif statement



























         
         end -- end of codeSubmitted function
         
         
         
         
         
         
         
            local enterButton =display.newText("OK", 350, 425, 300, 0,"SpecialElite.ttf",20)
            enterButton:setFillColor( 0.1, 0.1, 0.1)
            sceneGroup:insert(enterButton)
         
         --event listner for the enter button below
         
         enterButton: addEventListener( "tap", codeSubmitted)
         







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