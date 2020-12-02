local composer = require( "composer" )
local scene = composer.newScene()
--local InventoryObj = require("Inventory")
--local inventory = InventoryObj:new()
local inventory = {}
local widget = require( "widget" )
local ping = audio.loadSound("ping.wav")

-- Text values declared here just to make them easy to access
local promptText = "Walking around, you notice markings on the wall.. 6135831... Hm, something to remember I suppose... What could it mean? Time to go check out that door.... You unlock the door and to your surprise you have mistakenly identified the muffled sound of the outdoors, for the ominous music of Cerials basement below! NO. You go to open the door back up, but you are locked from the inside..."
local choiceText1 = "Scream at the top of your lungs. Maybe, just maybe someone will hear your cries for help."
local choiceText2 = "Well. This is it... Might as well explore, and become familiar with this place..."
local choiceText3 = ""

-- Function for button 1
local function optionSelect1(event) 
  
   audio.play(ping)
   local options = { params = { inv = inventory } }
   composer.gotoScene("SceneEnd1", options)
   --print("Selected Option 1")

end

-- Function for button 2
local function optionSelect2(event) 
  
   audio.play(ping)
   local options = { params = { inv = inventory } }
   composer.gotoScene("Scene11a", options)
   --print("Selected Option 2")

end

-- Function for button 3
local function optionSelect3(event) 
  
   --audio.play(ping)
  --local options = { params = { inv = inventory } }
   --composer.gotoScene("", options)
   print("(Node 7a2 has no option 3)")

end
 
function scene:create( event )
 
   local sceneGroup = self.view

   inventory = event.params.inv 

   inventory:setFlag("7a2")
   inventory:flagSave()

   inventory:addItem("seenWall")

   local background = display.newImageRect( "captured_1.png", display.contentWidth+100, display.contentHeight+200 )
   background.y=-100
   background.x =-100
   background.anchorX= 0
   background.anchorY= 0
   sceneGroup:insert(background)

   local myImage = display.newImage( "prompt3.png", 150,100 )
   myImage.y = 80
   myImage.alpha =0.75
   sceneGroup:insert(myImage)

   -- readability background
   local box = display.newRect(display.contentCenterX, 0, 480, 430)
   box:setFillColor(0,0,0)
   box.alpha = 0.5
   sceneGroup:insert(box)

   -- text
   local prompt  = display.newText(promptText, display.contentCenterX, 20, 300, 0,"edo.ttf",15)
   local option1 = display.newText(choiceText1, display.contentCenterX, 255, 200, 0, "edo.ttf",12)
   local option2 = display.newText(choiceText2, display.contentCenterX, 345, 200, 0, "edo.ttf",12)
   local option3 = display.newText(choiceText3, display.contentCenterX, 435, 200, 0, "edo.ttf",12)
      
   prompt:setFillColor( 1, 1, 1 )
   option1:setFillColor( 0, 0, 0 )
   option2:setFillColor( 0, 0, 0 )
   option3:setFillColor( 0, 0, 0 )

   -- buttons
   local radioGroup= display.newGroup()

   local button1 = widget.newButton( { left = -75, top = 210, id = "button_1", width = 480, height = 480, defaultFile = "captured_5.png", overFile = "captured_5.png",  onEvent = handleButtonEvent} )
   local button2 = widget.newButton( { left = -75, top = 120, id = "button_2", width = 480, height = 480, defaultFile = "captured_5.png", overFile = "captured_5.png",  onEvent = handleButtonEvent} )
   local button3 = widget.newButton( { left = -75, top = 30, id = "button_3", width = 480, height = 480, defaultFile = "captured_5.png", overFile = "captured_5.png",  onEvent = handleButtonEvent} )
   
   local tButton1 = display.newRect(display.contentCenterX, 265, 480, 90)
   local tButton2 = display.newRect(display.contentCenterX, 355, 480, 90)
   local tButton3 = display.newRect(display.contentCenterX, 445, 480, 90)

   -- detection boxes can't just be invisible for some reason
   tButton1.alpha = 0.01
   tButton2.alpha = 0.01
   tButton3.alpha = 0.01

   -- add conditions to the listeners to lock choices
   tButton1:addEventListener("touch", optionSelect1)
   tButton2:addEventListener("touch", optionSelect2)
   tButton3:addEventListener("touch", optionSelect3)

   radioGroup:insert(button1)
   radioGroup:insert(button2)
   radioGroup:insert(button3)

   sceneGroup:insert(radioGroup)
   sceneGroup:insert(prompt)
   sceneGroup:insert(option1)
   sceneGroup:insert(option2)
   sceneGroup:insert(option3)
   sceneGroup:insert(tButton1)
   sceneGroup:insert(tButton2)
   sceneGroup:insert(tButton3)

end
 
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then

   elseif ( phase == "did" ) then

      --local bgm = audio.loadStream("test.wav")
      --audio.play(bgm, {channel = 1, loops = -1})

   end
end
 
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