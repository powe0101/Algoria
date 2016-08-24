require("player") -- include player.lua
require("gameDebug")
require("Control")

require("AnAL") --애니메이션 관련

--그래픽 관련
require("Box")
require("BoxList")
require("tree")
require("treeList")
require("cloud")
require("cloudList")
require("House")
require("houseList")
require("ChiefHouse")
require("chiefHouseList")
require("BlackSmithHouse")

require("Portal")
require("Ground")
require("groundList")
require("River")
require("riverList")
require("Picket")
require("picketList")
require("QMark")
require("qMarkList")
require("Castle")
require("castleList")
require("Bridge")
require("bridgeList")
require("Boss")
require("bossList")
require("Creeper")
require("CreeperList")
require("background")
require("backgroundList")

require("Font")

--이하 스테이지 관련
require("village")
require("Season")
require("Stage")
require("StageSpring")
require("StageFall")
require("StageSummer")
require("StageWinter")
require("StageBoss") --중간보스 스테이지

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

--보스 관련
require("BossTalk")
require("Algorithm")
require("BubbleSort")

--봄
require("DustWind")

--block


--Title
require("Title")

--splash 0823 G
splashy = require 'splashy' -- 시작 로고를 위한 라이브러리
splash = true

WIDTH = 600--윈도우 폭
HEIGHT = 200-- 윈도우 높이
SCALE = 2 -- 화면의 크기

bgcolor = {236,243,201,255} -- 배경색 RGBA 순서
darkcolor = {2,9,4,255} -- 검정색 RGBA

isFullScreen = false --전체화면 설정


stageLevel = -1 --맵 시작 값 --0721 근영
canPass = false --도개교가 열렸을 때 지나갈 수 있도록 boolean 변수 추가. by.현식 0728

BridegePassValue = 0 --초기 값은 0. 문제를 풀때마다 30씩 증가해서 총 3번째 문제를 풀면 위의 canPass가 true로 바뀌게 됨. by.현식 0729

popupCheck = false --팝업을 만들때 다른 것들은 update시키지 않기 위한 bool형 변수. by.현식 0801
levelCheck = 1 --팝업창에서 계절을 선택하고 그 값을 stageLevel에 넘겨주는 변수. by.현식 0801

questCheck = false --표지판을 통해서 수행하는 퀘스트가 돌아가는 동안에는 메인 update를 막음.

blacksmithCheck = false -- 대장간 팝업창용 변수 popupCheck와 같다
menuSelector = 1 -- 팝업창 선택 관리 변수 (1~N)

bossTalkCheck = false --보스와의 대화 및 문제풀이를 위한 변수. 메인 update를 멈추게 만듬.
algoCheck = false --보스와의 대화가 끝난 후 알고리즘 푸는 부분으로 넘어가는 것을 감지,체크함.

bubbleTipCheck = false --버블소트에 관한 팁을 설명하기 위함.

function love.load()
  love.graphics.setBackgroundColor(darkcolor) --배경 색을 지정함
  loadResources() -- 이미지 리소스 불러옴
  createStage() -- stage 만들기 근영
  loadSplash() -- 스플래시 로드
  updateScale()

  SetGoyangFont() --폰트설정. BY.현식 0823.
  --SetNanumFont()
  start() -- 시작
  --start() -- 시작 // 0823 : 스플래시가 추가되고 스타트 메서드가 필요 없게 됨

  --audio() --오디오를 뒤로 빼면 다른 것들이 다 로딩된 다음에 로딩되므로 사운드가 살짝 늦게 나오는 느낌이 있음. by.현식
end

function loadSplash() -- 스플래시가 끝나면 자동으로 타이틀을 불러온다
    splashy.addSplash(love.graphics.newImage("images/love.png"))
    splashy.onComplete(function() TitleRun() end) -- Runs the argument once all splashes are done.
    splash = false
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

    if love.timer then love.timer.sleep(0.001) end
  end
end

function start()
  if stageLevel ~= -1 then
    pl = Player.create() -- 플레이어 객체
    pl:reset() -- 플레이어 객체 새로고침
  end
end

function love.update(dt)
  splashy.update(dt) -- Updates the fading of the splash images.

  if popupCheck == false and questCheck == false and blacksmithCheck == false
    and bossTalkCheck == false and algoCheck == false and bubbleTipCheck == false then
    updateGame(dt)
  end

  --마우스 테스트용
  mouse_x = love.mouse.getX()
  mouse_y = love.mouse.getY()

  CheckPortal()

  CheckBlackSmith()
  CheckFadeIn(dt) --정답/오답 뜰때 페이드인/아웃 적용 테스트중.. by.0804 현식.
  CheckQMark() --문제를 풀때마다 느낌표가 바뀌게 만드는 메서드. by.현식 0805
  UpdateLife() --라이프 관리를 플레이어에서 해버리면 문제풀때 플레이어의 업데이트가 멈추기 때문에 따로 뺐음. by.현식 0808
  CheckBossCastle() --중간보스 성으로 들어가는 메서드.
  CheckBossMeeting() --중간보스성 내부에서 일정좌표를 넘으면 업데이트를 멈추고 보스와 대화를 나누고 보스 문제를 푸는 단계로 넘어가는 것을 체크함.
end

function love.draw()  
  splashy.draw() -- Draws the splashes to the screen.

  love.graphics.scale(SCALE,SCALE) -- 크기 지정
  love.graphics.setColor(255,255,255,255) -- 흰색 RGBA
  drawGame() -- 게임 로드
  drawDebug(DEBUG_SETTING) -- 디버깅 호출 (On Off 는 debug.lua)

  if title == true and splash == false then
    DrawTitleMenu()
  end

  if popupCheck then --0805HS
    DrawPopup()
  end

  if blacksmithCheck then
    DrawBlackSmith()
  end

  if questCheck then --0805HS
    DrawQuest()
  end

  if bossTalkCheck then
    BossTalk() --보스와의 대화 후 알고리즘 문제 푸는 부분으로 진입.
  end

  if algoCheck then
    MakeAlgorithm()
  end

  if bubbleTipCheck then
    DrawBubbleSortTip()
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

function CheckStartGameForTitle()
  if title and love.keyboard.isDown("return") then -- 타이틀에서 게임을 시작함
    DeleteVillage() -- 타이틀용 마을 삭제
    stageLevel = 0 -- 마을 스테이지 번호 0
    title = false -- 타이틀 조건 해제
    pl = Player.create() -- 플레이어 객체
    pl:reset()
    CreateVillage() -- 실제 마을 스테이지 생성
  end
end

function love.keypressed(key,scancode) -- 키입력
  ControlBlackSmith()
  ControlPopup() --위, 아래키로 팝업창 컨트롤하는 부분. 함수로 만들어서 뺐음. by.현식 0801 --0805HS
  ControlQuest() --퀘스트 창이 떴을때 조작하는 부분. by.현식 0802 --0805HS
  ControlTalkWithBoss()
  CortrolBubbleSort()

  CheckStartGameForTitle() -- 타이틀 키 입력 체크

  if love.keyboard.isDown("return") then
      splashy.skipSplash()
  end
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
  if pl then
    pl:update(dt)
  end
  BackGroundListUpdate(dt)
  GroundListUpdate(dt)
  TreeListUpdate(dt)
  BoxListUpdate(dt)
  CloudListUpdate(dt)
  HouseListUpdate(dt)
  ChiefHouseListUpdate(dt)
  RiverListUpdate(dt)
  PicketListUpdate(dt)
  QMarkListUpdate(dt)
  HeartListUpdate(dt) --라이프
  BheartListUpdate(dt) --라이프 닳은거
  CastleListUpdate(dt)
  BossListUpdate(dt)


  if stageLevel == 1 then
    dustWind:Update(dt)
  end

  if stageLevel == 0 then
    PortalUpdate(dt)
    BlackSmithHouseUpdate(dt)
  end
  if stageLevel == 2 and checkPlaying then --여름

    CheckCreeperAniPassValue()--by.근영 0802  가시 의 애니메이션 언제 시작 할 것인지 조건 함수.
    CreeperListUpdate(dt)
  end
  if checkPlaying==false then -- by.근영 0816 가시 애니메이션 'once'한번 실행 되고 나서 중지 되었을시 delete 시킴
    CreeperListDelete()
  end
  if stageLevel == 3  then --가을
    CheckBridegeAniPassValue()--by.근영 0802  다리의 애니메이션 언제 시작 할 것인지 조건 함수. -> by.현식 0810, 리스트화 시키면서 수정함.
    BridgeListUpdate(dt)
  end
end

function drawGame()
  BackGroundListDraw()
  GroundListDraw()
  CloudListDraw()
  TreeListDraw()
  BoxListDraw()
  HouseListDraw()
  CloudListDraw()
  ChiefHouseListDraw()
  RiverListDraw()
  PicketListDraw()
  QMarkListDraw()
  CastleListDraw()
  BossListDraw()

  if stageLevel == 1 then
    UpdateSpring()
  end

  if stageLevel == 0 then
    PortalDraw()
    BlackSmithHouseDraw()
  end
   if stageLevel == 2 and canPass then --가시  애니메이션 그리는 부분.
     CreeperListDraw()
  end
   if stageLevel == 3 then --다리 애니메이션 그리는 부분.
     BridgeListDraw()
  end

  if pl then
    pl:draw() -- 플레이어 스프라이트 그리기
  end
end

function loadResources()
  -- Load images
  imgSprites = love.graphics.newImage("images/algolaChar.png") -- char.png 등록
  imgSprites:setFilter("nearest","nearest") -- 0.9.0 이상
  imgSpringChar = love.graphics.newImage("images/maskChar.png")
  imgSpringChar:setFilter("nearest","nearest")
  imgSummerChar = love.graphics.newImage("images/wingChar.png")
  imgSummerChar:setFilter("nearest","nearest")
  imgFallChar = love.graphics.newImage("images/horseChar.png")
  imgFallChar:setFilter("nearest","nearest")
  imgWinterChar = love.graphics.newImage("images/eisenChar.png")
  imgWinterChar:setFilter("nearest","nearest")

  imgTree = love.graphics.newImage("images/tree.png")
  imgTree:setFilter("nearest","nearest")
  imgSTree = love.graphics.newImage("images/summerTree.png")
  imgSTree:setFilter("nearest","nearest")
  imgFTree = love.graphics.newImage("images/fallTree.png")
  imgFTree:setFilter("nearest","nearest")
  imgWTree = love.graphics.newImage("images/winterTree.png")
  imgWTree:setFilter("nearest","nearest")

  imgCloud = love.graphics.newImage("images/cloud.png")
  imgCloud:setFilter("nearest","nearest")

  imgHouse = love.graphics.newImage("images/house.png")
  imgHouse:setFilter("nearest","nearest")
  imgCHouse = love.graphics.newImage("images/chiefhouse.png")
  imgCHouse:setFilter("nearest","nearest")
  imgBSHouse = love.graphics.newImage("images/blacksmithhouse.png")
  imgBSHouse:setFilter("nearest","nearest")

  imgPortal = love.graphics.newImage("images/portal.png")
  imgPortal:setFilter("nearest","nearest")

  imgPicket = love.graphics.newImage("images/picket.png")
  imgPicket:setFilter("nearest", "nearest")

  imgGround = love.graphics.newImage("images/ground.png")
  imgGround:setFilter("nearest","nearest")
  imgSGround = love.graphics.newImage("images/summerGround.png")
  imgSGround:setFilter("nearest","nearest")
  imgFGround = love.graphics.newImage("images/fallground.png")
  imgFGround:setFilter("nearest","nearest")
  imgWGround = love.graphics.newImage("images/winterGround.png")
  imgWGround:setFilter("nearest","nearest")

  imgSCreeper = love.graphics.newImage("images/creeper.png")
  imgSCreeper:setFilter("nearest","nearest")

  imgCreeperFire = love.graphics.newImage("images/creeperfire.png")
  imgCreeperFire:setFilter("nearest","nearest")

  imgRiver = love.graphics.newImage("images/river.png")
  imgRiver:setFilter("nearest","nearest")

  imgBridge = love.graphics.newImage("images/bridge.png")
  imgBridge:setFilter("nearest","nearest")

  imgQMark = love.graphics.newImage("images/questionMark.png")
  imgQMark:setFilter("nearest","nearest")

  imgHeart = love.graphics.newImage("images/heart.png")
  imgHeart:setFilter("nearest","nearest")
  imgHeartBlank = love.graphics.newImage("images/heart_blank.png")
  imgHeartBlank:setFilter("nearest","nearest")

  imgCastle = love.graphics.newImage("images/castle.png")
  imgCastle:setFilter("nearest","nearest")

  imgSavePaper = love.graphics.newImage("images/savePaper.png")
  imgSavePaper:setFilter("nearest","nearest")
  imgStone = love.graphics.newImage("images/springStone.png")
  imgStone:setFilter("nearest","nearest")
  imgSStone = love.graphics.newImage("images/summerStone.png")
  imgSStone:setFilter("nearest","nearest")
  imgFStone = love.graphics.newImage("images/fallStone.png")
  imgFStone:setFilter("nearest","nearest")
  imgWStone = love.graphics.newImage("images/winterStone.png")
  imgWStone:setFilter("nearest","nearest")

  imgMask = love.graphics.newImage("images/mask.png")
  imgMask:setFilter("nearest","nearest")
  imgWing = love.graphics.newImage("images/wing.png")
  imgWing:setFilter("nearest","nearest")
  imgHorse = love.graphics.newImage("images/horse.png")
  imgHorse:setFilter("nearest","nearest")
  imgEisen = love.graphics.newImage("images/eisen.png")
  imgEisen:setFilter("nearest","nearest")

  imgBoss = love.graphics.newImage("images/devil.png")  --중간보스 이미지 임시용
  imgBoss:setFilter("nearest","nearest")
  imgSBoss = love.graphics.newImage("images/summerDevil.png")
  imgSBoss:setFilter("nearest","nearest")
  imgFBoss = love.graphics.newImage("images/fallDevil.png")
  imgFBoss:setFilter("nearest","nearest")
  imgWBoss = love.graphics.newImage("images/winterDevil.png")
  imgWBoss:setFilter("nearest","nearest")
  imgFinalBoss = love.graphics.newImage("images/finalDevil.png")
  imgFBoss:setFilter("nearest","nearest")


  imgFallCastle = love.graphics.newImage("images/fallInnerCastle.png")
  imgFallCastle:setFilter("nearest","nearest")

  imgVillageBackGround = love.graphics.newImage("images/village.png")
  imgVillageBackGround:setFilter("nearest","nearest")
  imgSpringBackGround = love.graphics.newImage("images/spring.png")
  imgSpringBackGround:setFilter("nearest","nearest")
  imgFallBackGround = love.graphics.newImage("images/fallBackground.png")
  imgFallBackGround:setFilter("nearest","nearest")
  imgWinterBackGround = love.graphics.newImage("images/winter.png")
  imgWinterBackGround :setFilter("nearest","nearest")

  QuestLoad() --0805HS
  AnswerLoad() --0805HS
  FadeLoad() --정답과 관련된 이미지 호출. Answer.lua --0805HS
  BubbleTipLoad()
end


function createStage() --0721 근영 맵 만드는 함수
  if stageLevel == -1 then
    TitleRun()
  end
  if stageLevel==0 then -- if문으로 stage설정
    --CreateVillage()
    stageLevel = 7
    CreateBossCastle()
  end
end

--ControlPopup()은 Season.lua로 옮겼습니다. by.현식 0802
--CheckPassValue()는 Bridge.lua로 합침. by. 현식 0810
