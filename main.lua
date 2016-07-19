require("player") -- include player.lua 
require("tree") -- include tree.lua
require("treeList")

WIDTH = 600--윈도우 폭 
HEIGHT = 200-- 윈도우 높이 
SCALE = 1 -- 화면의 크기 
DEBUG_SETTING = true -- true == 디버그 정보 표시 false == 디버그 정보 표시 안됨 

bgcolor = {236,243,201,255} -- 배경색 RGBA 순서 
darkcolor = {2,9,4,255} -- 검정색 RGBA

isFullScreen = false --전체화면 설정

treeList = {}
treeCount = 0

bgImg = love.graphics.newImage("images/char.png")

function love.load()
  love.graphics.setBackgroundColor(bgcolor) --배경 색을 지정함 
  loadResources() -- 이미지 리소스 불러옴 
  pl = Player.create() -- 플레이어 객체 

  CreateTree(100,50)
  CreateTree(200,50)
  updateScale()
  start() -- 시작 
end

function start()
  pl:reset() -- 플레이어 객체 새로고침 
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

  for i = 0, treeCount-1 do
    treeList[i]:update(dt)
  end
end

function drawGame()
  --love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  
  for i = 0, treeCount-1 do
    treeList[i]:draw(dt)
  end
  pl:draw() -- 플레이어 스프라이트 그리기
end

function loadResources()
  -- Load images
  imgSprites = love.graphics.newImage("images/char.png") -- char.png 등록
  imgSprites:setFilter("nearest","nearest") -- 0.9.0 이상 

  imgTree = love.graphics.newImage("images/tree.png")
  imgTree:setFilter("nearest","nearest")
  -- imgBox = love.graphics.newImage("images/box.png")
  -- imgBox::setFilter("nearest","nearest")
end