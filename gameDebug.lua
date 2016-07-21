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
  
  local DEBUG_BLOCKINFO_X = 200
  local DEBUG_BLOCKINFO_Y = 25
  showBlockInfo(DEBUG_BLOCKINFO_X,DEBUG_BLOCKINFO_Y)

  local DEBUG_BOOLEANINFO_X = 200
  local DEBUG_BOOLEANINFO_Y = 0
  showBooleanInfo(DEBUG_BOOLEANINFO_X,DEBUG_BOOLEANINFO_Y)

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
  love.graphics.print("yspeed : "..tostring(pl:GetYSpeed()))
end

function showBooleanInfo(x,y)
  love.graphics.print("isJump :"..tostring(isJump).."isCanMove : "..tostring(isCanMove),x,y)
end