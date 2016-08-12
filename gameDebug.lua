DEBUG_SETTING = true -- true == 디버그 정보 표시 false == 디버그 정보 표시 안됨 

function drawDebug(setting)  
  if setting == false then
    return 
  end

  love.graphics.setColor(darkcolor)  

  local DEBUG_FPS_X = 10
  local DEBUG_FPS_Y = 10
  showFps(DEBUG_FPS_X,DEBUG_FPS_Y)

  local DEBUG_RESOLATION_X = 10
  local DEBUG_RESOLATION_Y = 20
  showResolation(DEBUG_RESOLATION_X,DEBUG_RESOLATION_Y)

  local DEBUG_DEVICE_X = 10
  local DEBUG_DEVICE_Y = 30
  showDeviceInfo(DEBUG_DEVICE_X,DEBUG_DEVICE_Y)
  
  local DEBUG_MEMORY_X = 10
  local DEBUG_MEMORY_Y = 90
  showMemoryInfo(DEBUG_MEMORY_X,DEBUG_MEMORY_Y)

  local DEBUG_FEATURE_X = 10
  local DEBUG_FEATURE_Y = 100
  showFeature(DEBUG_FEATURE_X,DEBUG_FEATURE_Y)
 
  local DEBUG_KEYINFO_X = 0
  local DEBUG_KEYINFO_Y = HEIGHT - 20
  showKeyInfo(DEBUG_KEYINFO_X,DEBUG_KEYINFO_Y)

  local DEBUG_PLAYERINFO_X = WIDTH/2/2 +100
  local DEBUG_PLAYERINFO_Y = HEIGHT-20
  showPlayerInfo(DEBUG_PLAYERINFO_X, DEBUG_PLAYERINFO_Y)
  
  local DEBUG_BLOCKINFO_X = 200
  local DEBUG_BLOCKINFO_Y = 25
  showBlockInfo(DEBUG_BLOCKINFO_X,DEBUG_BLOCKINFO_Y)

  local DEBUG_BOOLEANINFO_X = 200
  local DEBUG_BOOLEANINFO_Y = 0
  showBooleanInfo(DEBUG_BOOLEANINFO_X,DEBUG_BOOLEANINFO_Y)

  local DEBUG_STAGEINFO_X = 200
  local DEBUG_STAGEINFO_Y = 13
  showStageIfno(DEBUG_STAGEINFO_X,DEBUG_STAGEINFO_Y)

  local DEBUG_BOXINFO_X = 350
  local DEBUG_BOXINFO_Y = 30
  showBoxInfo(DEBUG_BOXINFO_X,DEBUG_BOXINFO_Y)
  local DEBUG_BRIDGEINFO_X = 200
  local DEBUG_BRIDGEINFO_Y = 38
  showBridgePassIfno(DEBUG_BRIDGEINFO_X, DEBUG_BRIDGEINFO_Y)

  local DEBUG_POPUPINFO_X = 200
  local DEBUG_POPUPINFO_Y = 53

  --showPopupIfno(DEBUG_POPUPINFO_X, DEBUG_POPUPINFO_Y)

  showBoxDebug()

  showPopupAndPhaseIfno(DEBUG_POPUPINFO_X, DEBUG_POPUPINFO_Y)

  local DEBUG_MOUSEINFO_X = 200
  local DEBUG_MOUSEINFO_Y = 73

  showMouseInfo(DEBUG_MOUSEINFO_X, DEBUG_MOUSEINFO_Y)

  love.graphics.setColor(255,255,255,255)  
end

function showFps(x,y)
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), x, y)
end

function showResolation(x,y)
  love.graphics.print("WIDTH : "..tostring(love.graphics.getWidth()).." HEIGHT : "..tostring(love.graphics.getHeight()),x,y)
end

function showDeviceInfo(x,y)
  name, version, vendor, device = love.graphics.getRendererInfo()
  love.graphics.print(name.."\n"..version.."\n"..vendor.."\n"..device.."\n",x,y)
end

function showMemoryInfo(x,y)
  stats = love.graphics.getStats()
  str = string.format("Estimated amount of texture memory used: %.2f MB", stats.texturememory / 1024 / 1024)
  love.graphics.print(str, x, y)
end

function showFeature(x,y)
  features = love.graphics.getSupported()
  love.graphics.print(features, x, y)
end

function showKeyInfo(x,y)
  love.graphics.print("KEY : SPACEBAR , 1 ~ 6",x , y)
end

function showPlayerInfo(x,y)
  love.graphics.print("PLAYER X : "..pl:GetX().."PLAYER Y : "..pl:GetY().." ",x, y)
end

function showBlockInfo(x,y)
  love.graphics.print("blockX : "..tostring(blockX).." blockY : "..tostring(blockY).." nowX : "..tostring(nowX).." nowY: "..tostring(nowY),x,y)
  love.graphics.print("yspeed : "..tostring(pl.yspeed)..tostring(collision_Bottom_Y))
end

function showBooleanInfo(x,y)
  love.graphics.print("isJump :"..tostring(isJump).."isCanMove : "..tostring(isCanMove),x,y)
end

function showStageIfno(x,y)
  love.graphics.print("StageLevel :"..tostring(stageLevel),x,y)
end

function showBoxInfo(x,y)
  love.graphics.print("BoxCount : "..tostring(boxCount)..tostring(global_isCollision),x,y)

end

function showBridgePassIfno(x,y)
  love.graphics.print("BridegePassValue :"..tostring(BridegePassValue)..", canPass :"..tostring(canPass),x,y)
end

function showPopupIfno(x,y)
  love.graphics.print("popupCheck :"..tostring(popupCheck)..", nowLevel :"..tostring(nowLevel),x,y)
end

function showBoxDebug()
if DEBUG_SETTING then 
    
    for i = 0, boxCount -1 do
       drawDirectionBox(boxList[i],255,255,255)
       if boxList[i].isCollisionRight then 
          boxList[i]:DrawLine(boxList[i].x + BOX_WIDTH, boxList[i].y)
        end

        if boxList[i].isCollisionLeft then 
            boxList[i]:DrawLine(boxList[i].x - BOX_WIDTH, boxList[i].y)
        end

        if boxList[i].isCollisionBottom then 
           boxList[i]:DrawLine(boxList[i].x, boxList[i].y + BOX_WIDTH)
        end

        if boxList[i].isCollisionTop then 
            boxList[i]:DrawLine(boxList[i].x, boxList[i].y - BOX_WIDTH)
        end
    end 
  end  
end

function showPopupAndPhaseIfno(x,y)
  love.graphics.print("popupCheck :"..tostring(popupCheck)..", levelCheck :"..tostring(levelCheck)..", phase : "..tostring(phase),x,y)
end

function showMouseInfo(x,y)
  love.graphics.print( "Mouse X: ".. mouse_x .. " Mouse Y: " .. mouse_y, x,y )
end
