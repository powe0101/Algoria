require("player") -- include player.lua 
require("Box")
require("BoxList")
require("tree") -- include tree.lua
require("treeList")
require("Control")
require("cloud")
require("cloudList")
x=100
y=50
WIDTH = 600--윈도우 폭 
HEIGHT = 200-- 윈도우 높이 
SCALE = 2 -- 화면의 크기 
DEBUG_SETTING = true -- true == 디버그 정보 표시 false == 디버그 정보 표시 안됨 

BOX_COUNT = 0

bgcolor = {236,243,201,255} -- 배경색 RGBA 순서 
darkcolor = {2,9,4,255} -- 검정색 RGBA

isFullScreen = false --전체화면 설정

isCanMove = true
treeList = {}
treeCount = 0
cloudList={}
cloudCount=0

bgImg = love.graphics.newImage("images/char.png")

function love.load()
  love.graphics.setBackgroundColor(bgcolor) --배경 색을 지정함 
  loadResources() -- 이미지 리소스 불러옴 

  pl = Player.create() -- 플레이어 객체 
  tree = Tree.create()
  cloud = Cloud.create()
 
  sideScolling(x,y)

  updateScale()
  start() -- 시작 
end


  function love.run()
  if love.math then
    love.math.setRandomSeed(os.time())
  end
 
  if love.load then love.load(arg) end
 
  -- We don't want the first frame's dt to include time taken by love.load.
  if love.timer then love.timer.step() end
 
  local dt = 0
 
  -- Main loop time.
  while true do
    -- Process events.
    if love.event then
      love.event.pump()
      for name, a,b,c,d,e,f in love.event.poll() do
        if name == "quit" then
          if not love.quit or not love.quit() then
            return a
          end
        end
        love.handlers[name](a,b,c,d,e,f)
      end
    end
 
    -- Update dt, as we'll be passing it to update
    if love.timer then
      love.timer.step()
      dt = love.timer.getDelta()
    end
 
    -- Call update and draw
    if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
 
    if love.graphics and love.graphics.isActive() then
      love.graphics.clear(love.graphics.getBackgroundColor())
      love.graphics.origin()
      if love.draw then love.draw() end
      love.graphics.present()
    end
 
    if love.timer then love.timer.sleep(0.016) end
  end
end

function start()
  pl:reset() -- 플레이어 객체 새로고침 
  tree:reset(x,y)
  cloud:reset(x,y)


end

function love.update(dt)
  updateGame(dt)
end

function debug(setting)
  if setting == false then
    return 
  end
    love.graphics.setColor(darkcolor)
    love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    love.graphics.print("WIDTH : "..tostring(love.graphics.getWidth()).." HEIGHT : "..tostring(love.graphics.getHeight()),10,20)
    name, version, vendor, device = love.graphics.getRendererInfo( )
    love.graphics.print(name.."\n"..version.."\n"..vendor.."\n"..device.."\n",10,30)
    stats = love.graphics.getStats()
    str = string.format("Estimated amount of texture memory used: %.2f MB", stats.texturememory / 1024 / 1024)
    love.graphics.print(str, 10, 90)
    features = love.graphics.getSupported( )
    love.graphics.print(features, 10, 100)
    love.graphics.print("KEY : SPACEBAR , 1 ~ 6",WIDTH / 2 /2-50 , HEIGHT-20)
    love.graphics.print("PLAYER X : "..pl:GetX().."PLAYER Y : "..pl:GetY().." ",WIDTH/2/2 +100, HEIGHT-20)
  love.graphics.setColor(darkcolor)
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  love.graphics.print("WIDTH : "..tostring(love.graphics.getWidth()).." HEIGHT : "..tostring(love.graphics.getHeight()),10,20)
  name, version, vendor, device = love.graphics.getRendererInfo( )
  love.graphics.print(name.."\n"..version.."\n"..vendor.."\n"..device.."\n",10,30)
  stats = love.graphics.getStats()
  str = string.format("Estimated amount of texture memory used: %.2f MB", stats.texturememory / 1024 / 1024)
  love.graphics.print(str, 10, 90)
  features = love.graphics.getSupported( )
  love.graphics.print(features, 10, 100)
  love.graphics.print("KEY : SPACEBAR , 1 ~ 6",WIDTH / 2 /2 , HEIGHT-20)
end

function love.draw()
  love.graphics.scale(SCALE,SCALE) -- 크기 지정 
  love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  drawGame() -- 게임 로드 
  debug(DEBUG_SETTING)
end

function SetScale(key,scancode)
  if scancode == '1'then
    SCALE = 1
    updateScale()
  elseif scancode == '2' then
    SCALE = 2
    updateScale()
  elseif scancode == '3'then
    SCALE = 3
    updateScale()
  elseif scancode == '4' then
    SCALE = 4
    updateScale()
  elseif scancode == '5' then
    SCALE = 5
    updateScale()
  elseif scancode == '6' then
    SCALE = 6
    updateScale()
  end
end

function SetScreen()
  if isFullScreen == true then
    isFullScreen = false
  else
    isFullScreen = true
  end
  success = love.window.setFullscreen(isFullScreen)
end

function love.keypressed(key,scancode) -- 키입력
  if love.keyboard.isDown("lalt") and love.keyboard.isDown("return") then
    SetScreen()
   -- 테스트중 미완성
  else
    SetScale(key,scancode) -- 윈도우 크기 결정
  end
end

function updateScale()
  SCRNWIDTH = WIDTH*SCALE
  SCRNHEIGHT = HEIGHT*SCALE
  love.window.setMode(SCRNWIDTH,SCRNHEIGHT)
end

function updateGame(dt)
  pl:update(dt)

  tree:update(dt)
  TreeListUpdate(dt)
  
  cloud:update(dt)
  CloudListUpdate(dt)
end

function drawGame()
  pl:draw() -- 플레이어 스프라이트 그리기 
  BoxListDraw()
  isCanMove = isEdge()
end

function isEdge()
  for i = 0, BOX_COUNT-1 do 
      if pl:GetX() - (boxList[i]:GetX()-11) == 0 then
          return false
      end
  end
  return true
end

function drawGame()
  --love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  
  for i = 0, treeCount-1 do
    treeList[i]:draw(dt)
  end
  for i=0, cloudCount-1 do
    cloudList[i]:draw(dt)
  end
  pl:draw() -- 플레이어 스프라이트 그리기
end

function loadResources()
  -- Load images
  imgSprites = love.graphics.newImage("images/char.png") -- char.png 등록
  imgSprites:setFilter("nearest","nearest") -- 0.9.0 이상 

  imgTree = love.graphics.newImage("images/tree.png")
  imgTree:setFilter("nearest","nearest")

   imgS = love.graphics.newImage("images/c.png")
   imgS:setFilter("nearest","nearest")
  -- imgBox = love.graphics.newImage("images/box.png")
  -- imgBox::setFilter("nearest","nearest")
end

function sideScolling(x,y)
  CreateTree(x-150,y)
  CreateTree(x,y)
  CreateTree(x+300,y)
  CreateTree(x+150,y)
 CreateTree(x+450,y)
 CreateTree(x+600,y)
 CreateTree(x+750,y)
 CreateTree(x-150,y)
 CreateCloud(x+20,y+20)

  
  --CreateCloud(x+300,100)


end