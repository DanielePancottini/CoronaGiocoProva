-----------------------------------------------------------------------------------------
--
-- play.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
require("play.Balls")
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 physics.start()
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    sceneGroup = self.view
    myBalls = {}
    coda = 1

    background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    background:setFillColor(1, 1, 1)
    sceneGroup:insert(background)

    -- Code here runs when the scene is first created but has not yet appeared on screen
    --code for play

    local sceneGroup = self.view
    local phase = event.phase
   

    --setup timer countdown
    secondsLeft = 60

    local clockText = display.newText("01:00", display.contentCenterX, 80, native.systemFont, 72)
    clockText:setFillColor( 0.7, 0.7, 1 )
    sceneGroup:insert(clockText)

     --inizio score text
     local counterScore = 0
     local counterText = display.newText("Score : 0", display.contentCenterX, 7*display.contentHeight/8, native.systemFont, 50)
     counterText:setFillColor(0.7, 0.7, 1)
     sceneGroup:insert(counterText)
     --fine score 

    function updateTime(event)
        secondsLeft = secondsLeft - 1

        local timeDisplay = string.format("%02d:%02d", 0, secondsLeft)

        clockText.text = timeDisplay

        

        myBalls[coda] = Balls.new(math.random(display.contentWidth), math.random(display.contentHeight), 16)
        coda = coda + 1

        local function onObjectTouch( event )
           local object = event.target
           local phase = event.phase

           if phase == "began" then
                display.getCurrentStage():setFocus(object, event.id)
                object.isFocus = true
                object.joint = physics.newJoint("touch", object, event.x, event.y)
           elseif object.isFocus then
            if phase == "ended" then
                counterScore = counterScore + myBalls[coda-1]:getText()
                counterText.text = "Score: "..counterScore
                display.getCurrentStage():setFocus(object, nil)
                object:removeSelf()
            end
        end
        return true
    end
        
        myBalls[coda-1]:getBall():addEventListener("touch", onObjectTouch)
        return true
    end

end
 
 
-- show()
function scene:show( event )
 
    
    timer.performWithDelay(1000, updateTime, 60)
    --fine timer countdown

    --
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
       
 
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