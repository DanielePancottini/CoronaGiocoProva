-----------------------------------------------------------------------------------------
--
-- mainMenu.lua
--
-----------------------------------------------------------------------------------------
 
local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
local sceneOptions = {
	effect = "fade",
	time = 500
}

local function gotoSettings()
   print("DEBUG: settings button")
   composer.gotoScene("options", sceneOptions)
   return true
end

local function gotoShop()
	print("DEBUG: shop button")
    composer.gotoScene("shop", sceneOptions)
    return true
end
 
local function playGame()
	print("DEBUG: play button")
    composer.gotoScene("play.play", sceneOptions)
    return true
end 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    local sceneGroup = self.view
    local phase = event.phase
 
	local deviceHeight = display.contentHeight
	local deviceWidth = display.contentWidth
	
	local background = display.newImageRect("images/mainActivityBg.jpg", deviceWidth, deviceHeight)
	background.x = deviceWidth/2
	background.y = deviceHeight/2
    sceneGroup:insert(background)

	local titleText = display.newText("Gioco Prova", display.contentCenterX, 60, native.systemFontBold, 20 )
    sceneGroup:insert(titleText)

    local playButton = display.newText("PLAY", display.contentCenterX, 200, native.systemFontBold, 20 )
    sceneGroup:insert(playButton)
	playButton:addEventListener( "tap", playGame )

    local shopButton = display.newText("SHOP", display.contentCenterX, 300, native.systemFontBold, 20 )
    sceneGroup:insert(shopButton)
	shopButton:addEventListener( "tap", gotoShop )

    local optionsButton = display.newText("OPTIONS", display.contentCenterX, 400, native.systemFontBold, 20 )
    sceneGroup:insert(optionsButton)
	optionsButton:addEventListener( "tap", gotoSettings )

    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
 
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene



	
 
