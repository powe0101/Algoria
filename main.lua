require("player") -- include player.lua 
require("Box")
require("BoxList")
require("tree") -- include tree.lua
require("treeList")
require("gameDebug")
require("Control")
require("cloud")
require("cloudList")
require("House")
require("houseList")

WIDTH = 600--윈도우 폭 
HEIGHT = 200-- 윈도우 높이 
SCALE = 2 -- 화면의 크기 
DEBUG_SETTING = false -- true == 디버그 정보 표시 false == 디버그 정보 표시 안됨 

BOX_COUNT = 0

bgcolor = {236,243,201,255} -- 배경색 RGBA 순서 
darkcolor = {2,9,4,255} -- 검정색 RGBA

isFullScreen = false --전체화면 설정

isCanMoveLeft = true
isCanMoveRight = true
isCanMove = true

treeList = {}
treeCount = 0

cloudList={}
cloudCount=0

houseList = {}
houseCount = 0

function love.load()
  love.graphics.setBackgroundColor(bgcolor) --배경 색을 지정함 
  loadResources() -- 이미지 리소스 불러옴 

  pl = Player.create() -- 플레이어 객체 

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
  BoxListReset()
end

function love.update(dt)
  updateGame(dt)
end


function love.draw()
  love.graphics.scale(SCALE,SCALE) -- 크기 지정 
  love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  drawGame() -- 게임 로드 
  drawDebug(DEBUG_SETTING)
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
  TreeListUpdate(dt)
  BoxListUpdate(dt)
  CloudListUpdate(dt)
  HouseListUpdate(dt)
end

function drawGame()
  TreeListDraw()
  BoxListDraw()
  HouseListDraw()
  CloudListDraw()

  pl:draw() -- 플레이어 스프라이트 그리기 
  isCanMove = isEdge()
end

function loadResources()
  -- Load images
  imgSprites = love.graphics.newImage("images/char.png") -- char.png 등록
  imgSprites:setFilter("nearest","nearest") -- 0.9.0 이상 

  imgTree = love.graphics.newImage("images/tree.png")
  imgTree:setFilter("nearest","nearest")

  imgCloud = love.graphics.newImage("images/cloud04.png")
  imgCloud:setFilter("nearest","nearest")

  imgHouse = love.graphics.newImage("images/Sword.png")
  imgHouse:setFilter("nearest","nearest")  

end

function isEdge()
  for i = 0, BOX_COUNT-1 do 
      if pl:GetX() - (boxList[i]:GetX()-11) == 0 then
          return false
      end
  end
  return true
end

x=100
y=50
function sideScolling(x,y) --0721 근영 횡스크롤방식 이미지 삽입 
  CreateTree(x-150,y)
  CreateTree(x,y)
  CreateTree(x+300,y)
  CreateTree(x+150,y)

  CreateTree(x+450,y)
  CreateTree(x+600,y)
  CreateTree(x+750,y)
  CreateTree(x-150,y)

  CreateCloud(0,1)
  CreateCloud(100,1)
  CreateCloud(200,1)
  CreateCloud(300,1)
  CreateCloud(400,1)
  CreateCloud(500,1)

  CreateHouse(17,54)
  --CreateCloud(x+300,100)
end