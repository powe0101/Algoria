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
  love.graphics.print("yspeed : "..tostring(pl.yspeed))
end

function showBooleanInfo(x,y)
  love.graphics.print("isJump :"..tostring(isJump).."isCanMove : "..tostring(isCanMove),x,y)
end

function showStageIfno(x,y)
  love.graphics.print("StageLevel :"..tostring(stageLevel),x,y)
end

function showBoxInfo(x,y)
  love.graphics.print("BoxCount : "..tostring(boxCount)..tostring(global_isCollision),x,y)

  for i = 0, boxCount-1 do
    love.graphics.print("x_distance :"..tostring(boxList[i].x_distance).."y_distance"..tostring(boxList[i].y_distance.."\n")..tostring(boxList[i].isCollision),x,y+(20*i)+20)
  end
end