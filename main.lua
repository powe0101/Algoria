require("player") -- include player.lua 
require("gameDebug")
require("Control")

require("AnAL") --애니메이션 관련

--그래픽 관련
require("Box")
require("BoxList")
require("tree") -- include tree.lua
require ("treeList")
require("cloud")
require("cloudList")
require("House")
require("houseList")
require("Portal")
--require("portalList")
require("Ground")
require("groundList")
require("River")
require("riverList")
require("Bridge")
require("BridgeList")
require("Picket")
require("picketList")
require("QMark")
require("qMarkList")
require("Castle")
require("castleList")

--이하 스테이지 관련
require("village")
require("Season")
require("StageSpring")
require("StageFall")
require("StageSummer")
require("StageWinter")

--문제풀이 관련
require("Quest")
require("Answer")

--Notice
require("Notice")
require("BlackSmith")

--라이프 관련
require("Heart")
require("heartList")
require("Bheart")
require("bheartList")
require("ManageHeart")

--block
WIDTH = 600--윈도우 폭 
HEIGHT = 200-- 윈도우 높이 
SCALE = 2 -- 화면의 크기 

bgcolor = {236,243,201,255} -- 배경색 RGBA 순서 
darkcolor = {2,9,4,255} -- 검정색 RGBA

isFullScreen = false --전체화면 설정
 

stageLevel = 0 --맵 시작 값 --0721 근영 
canPass = false --도개교가 열렸을 때 지나갈 수 있도록 boolean 변수 추가. by.현식 0728

BridegePassValue = 0 --초기 값은 0. 문제를 풀때마다 30씩 증가해서 총 3번째 문제를 풀면 위의 canPass가 true로 바뀌게 됨. by.현식 0729

popupCheck = false --팝업을 만들때 다른 것들은 update시키지 않기 위한 bool형 변수. by.현식 0801
levelCheck = 1 --팝업창에서 계절을 선택하고 그 값을 stageLevel에 넘겨주는 변수. by.현식 0801

questCheck = false --표지판을 통해서 수행하는 퀘스트가 돌아가는 동안에는 메인 update를 막음.

blacksmithCheck = false -- 대장간 팝업창용 변수 popupCheck와 같다
menuSelector = 1 -- 팝업창 선택 관리 변수 (1~N) 

function love.load()
  love.graphics.setBackgroundColor(bgcolor) --배경 색을 지정함 
  loadResources() -- 이미지 리소스 불러옴 

  pl = Player.create() -- 플레이어 객체 

  createStage() -- stage 만들기 근영 

  updateScale()
  start() -- 시작 

  --audio() --오디오를 뒤로 빼면 다른 것들이 다 로딩된 다음에 로딩되므로 사운드가 살짝 늦게 나오는 느낌이 있음. by.현식
end

function audio()
  bgCheck = true
  bgMusic = love.audio.newSource("audio/1.mp3")
  love.audio.setVolume(0.3)
  love.audio.play(bgMusic)
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
end

function love.update(dt)
  if popupCheck == false and questCheck == false and blacksmithCheck == false then
    updateGame(dt)
  end

  CheckPortal()
  CheckQuest()
  CheckBlackSmith()
  CheckFadeIn(dt) --정답/오답 뜰때 페이드인/아웃 적용 테스트중.. by.0804 현식.
  CheckQMark() --문제를 풀때마다 느낌표가 바뀌게 만드는 메서드. by.현식 0805
  UpdateLife() --라이프 관리를 플레이어에서 해버리면 문제풀때 플레이어의 업데이트가 멈추기 때문에 따로 뺐음. by.현식 0808
end


function love.draw()
  test_now_frame = love.graphics.newQuad(0,0,200,115,200,115)


  love.graphics.scale(SCALE,SCALE) -- 크기 지정 
  love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  drawGame() -- 게임 로드 
  drawDebug(DEBUG_SETTING) -- 디버깅 호출 (On Off 는 debug.lua)

  if popupCheck then --0805HS
    DrawPopup()
  end

  if blacksmithCheck then
    DrawBlackSmith()
  end

  if questCheck then --0805HS
    DrawQuest()
  end

  HeartListDraw() --라이프를 맨 앞에 보이게 하기 위해서 Heart관련만 여기에 그림.
  BheartListDraw()
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
  ControlBlackSmith()
  ControlPopup() --위, 아래키로 팝업창 컨트롤하는 부분. 함수로 만들어서 뺐음. by.현식 0801 --0805HS
  ControlQuest() --퀘스트 창이 떴을때 조작하는 부분. by.현식 0802 --0805HS

  if love.keyboard.isDown("escape") then
    --esc 테스트, 일단은 넣어볼 것이 없어서 음악을 멈추고 다시틀고 하는거 만듬.
    if bgCheck then
      love.audio.pause()
      bgCheck = false
    else 
      love.audio.resume()
      bgCheck = true
    end
  end

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
  GroundListUpdate(dt)
  TreeListUpdate(dt)
  BoxListUpdate(dt)
  CloudListUpdate(dt)
  HouseListUpdate(dt)
  --PortalListUpdate(dt)
  RiverListUpdate(dt)
  --BridgeListUpdate(dt)
  PicketListUpdate(dt)
  QMarkListUpdate(dt)
  HeartListUpdate(dt) --라이프
  BheartListUpdate(dt) --라이프 닳은거
  CastleListUpdate(dt)
 
  if stageLevel == 0 or stageLevel == 3 then
    PortalUpdate(dt)
  end

  if stageLevel == 3 then --가을
    CheckPassValue()--by.근영 0802  다리의 애니메이션 언제 시작 할 것인지 조건 함수 
    aniBridge1:update(dt)
    aniBridge2:update(dt)
    aniBridge3:update(dt)
    aniBridge4:update(dt)
    aniBridge5:update(dt)
    aniBridge6:update(dt)
  end 
end

function drawGame()
  GroundListDraw()
  CloudListDraw()
  TreeListDraw()
  BoxListDraw()
  HouseListDraw()
  
  --PortalListDraw()
  RiverListDraw()
  --BridgeListDraw()
  PicketListDraw()
  QMarkListDraw()
  CastleListDraw()

  if stageLevel == 0 or stageLevel == 3 then
    PortalDraw()
  end

   if stageLevel == 3 then --다리 애니메이션 그리는 부분.
     aniBridge1:draw()--첫 문제를 풀었다고 가정
     aniBridge2:draw() --두번째 문제를 풀었다고 가정
     aniBridge3:draw()
     aniBridge4:draw()
     aniBridge5:draw()
     aniBridge6:draw()     
  end

  pl:draw() -- 플레이어 스프라이트 그리기 
  NoticeDraw()
end

function loadResources()
  -- Load images
  imgSprites = love.graphics.newImage("images/algolaChar.png") -- char.png 등록
  imgSprites:setFilter("nearest","nearest") -- 0.9.0 이상 

  imgTree = love.graphics.newImage("images/tree.png")
  imgTree:setFilter("nearest","nearest")

  imgSTree = love.graphics.newImage("images/summerTree.png")
  imgSTree:setFilter("nearest","nearest")  

  imgFTree = love.graphics.newImage("images/FallTree03.png")
  imgFTree:setFilter("nearest","nearest")

  imgWTree = love.graphics.newImage("images/winterTree.png")
  imgWTree:setFilter("nearest","nearest")  

  imgCloud = love.graphics.newImage("images/cloud04.png")
  imgCloud:setFilter("nearest","nearest")

  imgHouse = love.graphics.newImage("images/house.png")
  imgHouse:setFilter("nearest","nearest") 

  imgPortal = love.graphics.newImage("images/portal07.png") 
  imgPortal:setFilter("nearest","nearest") 

  imgPicket = love.graphics.newImage("images/picket03.png")
  imgPicket:setFilter("nearest", "nearest")

  imgGround = love.graphics.newImage("images/ground.png") 
  imgGround:setFilter("nearest","nearest") 

  imgFGround = love.graphics.newImage("images/fallground.png") 
  imgFGround:setFilter("nearest","nearest") 

  imgSGround = love.graphics.newImage("images/summerGround.png")
  imgSGround:setFilter("nearest","nearest") 

  imgWGround = love.graphics.newImage("images/winterGround.png")
  imgWGround:setFilter("nearest","nearest") 

  imgRiver = love.graphics.newImage("images/river01.png")
  imgRiver:setFilter("nearest","nearest")  
 
  imgBridge = love.graphics.newImage("images/bridge07.png")
  imgBridge:setFilter("nearest","nearest") 

  imgQMark = love.graphics.newImage("images/questionMark02.png")
  imgQMark:setFilter("nearest","nearest")

  imgHeart = love.graphics.newImage("images/heart.png")
  imgHeart:setFilter("nearest","nearest")

  imgHeartBlank = love.graphics.newImage("images/heart_blank.png")
  imgHeartBlank:setFilter("nearest","nearest")

  imgCastle = love.graphics.newImage("images/castle.png")
  imgCastle:setFilter("nearest","nearest")
  
  imgWing = love.graphics.newImage("images/wing.png") -- 용사 날개 아이템 이미지
  imgWing:setFilter("nearest","nearest")

  imgHorse = love.graphics.newImage("images/horse.png") -- 용사 말 아이템 이미지
  imgHorse:setFilter("nearest","nearest")

  imgEisen = love.graphics.newImage("images/eisen.png") -- 용사 아이젠 아이템 이미지
  imgEisen:setFilter("nearest","nearest")

  QuestLoad() --0805HS
  AnswerLoad() --0805HS
  FadeLoad() --정답과 관련된 이미지 호출. Answer.lua --0805HS
end


function createStage() --0721 근영 맵 만드는 함수
  if stageLevel==0 then -- if문으로 stage설정 
    createVillage()
  end
end

--ControlPopup()은 Season.lua로 옮겼습니다. by.현식 0802

function CheckPassValue()--by.근영 0802  다리의 애니메이션 언제 시작 할 것인지 조건 함수  
  if 0 < BridegePassValue and BridegePassValue < 186 then --첫번째 문제를 출었다고 가정 
    aniBridge1:play()
    aniBridge2:play()--두번째 문제를 풀었다고 가정
  elseif BridegePassValue >= 186 and not canPass then
    aniBridge3:play()
    aniBridge4:play()
  end
    
  if canPass then --문제를 다 풀었을 때 마지막 다리가 올라옴
    aniBridge5:play()
    aniBridge6:play()
  end
end