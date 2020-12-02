local composer = require( "composer" )
local scene = composer.newScene()
--local InventoryObj = require("Inventory")
--local inventory = InventoryObj:new()
local inventory = {}
local widget = require( "widget" )
local ping = audio.loadSound("ping.wav")

-- Text values declared here just to make them easy to access
local promptText = "You have been killed."
local choiceText1 = "Return to Title Screen"
--local choiceText2 = "Quit Game"
--local choiceText3 = "Credits"

-- Function for button 1
local function optionSelect1(event) 
  
   audio.pause()
   audio.play(ping)
   local options = { effect = "fade", time = 1000, params = { inv = inventory } }
   composer.gotoScene("TitleScreen", options)
   print("Returning to Title Screen")

end

-- Function for button 2
local function optionSelect2(event) 
  
   --audio.play(ping)
   --local options = { params = { inv = inventory } }
   --composer.gotoScene("", options)
   --print("Quitting Game")

end

-- Function for button 3
local function optionSelect3(event) 
  
   if (event.phase == "ended") then
      --audio.play(ping)
      --local options = { params = { inv = inventory } }
      --composer.gotoScene("", options)
      --print("(credits)")
   end

end
 
function scene:create( event )
 
   local sceneGroup = self.view

   local background = display.newImageRect( "DeathScene.png", display.contentWidth+100, display.contentHeight+200 )
   background.y=-100
   background.x =-100
   background.anchorX= 0
   background.anchorY= 0
   sceneGroup:insert(background)

   -- text
   local prompt  = display.newText(promptText, display.contentCenterX, 20, 300, 0,"edo.ttf",15)
   local option1 = display.newText(choiceText1, display.contentCenterX, 255, 200, 0, "edo.ttf",12)
   --local option2 = display.newText(choiceText2, display.contentCenterX, 345, 200, 0, "edo.ttf",12)
   --local option3 = display.newText(choiceText3, display.contentCenterX, 435, 200, 0, "edo.ttf",12)
      
   prompt:setFillColor( 0, 0, 0 )
   option1:setFillColor( 0, 0, 0 )
   --option2:setFillColor( 0, 0, 0 )
   --option3:setFillColor( 0, 0, 0 )

   -- buttons
   local tButton1 = display.newRect(display.contentCenterX, 265, 480, 90)
   --local tButton2 = display.newRect(display.contentCenterX, 355, 480, 90)
   --local tButton3 = display.newRect(display.contentCenterX, 445, 480, 90)

   tButton1.alpha = 0.2
   --tButton2.alpha = 0.25
   --tButton3.alpha = 0.2

   -- add conditions to the listeners to lock choices
   tButton1:addEventListener("touch", optionSelect1)
   --tButton2:addEventListener("touch", optionSelect2)
   --tButton3:addEventListener("touch", optionSelect3)

   sceneGroup:insert(prompt)
   sceneGroup:insert(option1)
   --sceneGroup:insert(option2)
   --sceneGroup:insert(option3)
   sceneGroup:insert(tButton1)
   --sceneGroup:insert(tButton2)
   --sceneGroup:insert(tButton3)

end
 
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then

   elseif ( phase == "did" ) then

      audio.stop()
      local bgm = audio.loadStream("death.wav")
      audio.play(bgm, {loops = -1})

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