StageSpring = {}
StageSpring.__index = StageSpring

dustWind = nil

STORM_MOVE_POWER = 1

COLLIDE_MIN_X = 300
COLLIDE_MAX_X = 500

function StageSpring.Create()
  local self = {}
  setmetatable(self, StageSpring)
  self:Reset()
  return self
end

function StageSpring:Reset()
  self.objectList = {} -- 봄에서 사용하는 오브젝트
  self.width = 500
  self.height = 200
  randomSeed = love.math.newRandomGenerator()
end

function StageSpring:CreateDustWind()
  dustWind = DustWind.Create()
end

function StageSpring:MakePuzzle(_count)
  for i = 1, _count do
    --local x = randomSeed:random(100,50)
    CreateBox(randomSeed:random(COLLIDE_MIN_X,COLLIDE_MAX_X),randomSeed:random(0,135))
  end
end

function StageSpring:DeletePuzzle()
  --긴 막대들 삭제
end

function StageSpring:DustWindBlowing(_distance)

  --퍼즐은 랜덤?
  --경고?
  dustWind:Move(_distance)
  --돌풍이 움직인다
  --퍼즐이 바뀐다
end

function CreateSpring()
	if stageLevel == 1 then
    phase = 1
    pl:reset()
  end

  PlayAudio("audio/363533.Spring.mp3",1,0.3,true) -- 파일 주소 , 피치, 볼륨, 반복
  CreateBackGround(-50,0)
  CreateBackGround(550,0)
  CreateTree(150,54)
  --CreateRiver(346,150)

  CreateTree(354,40)
  CreateTree(600,24)
  CreateTree(750,5)

  stageSpring = StageSpring.Create()
  stageSpring:CreateDustWind()
  stageSpring:MakePuzzle(5)

  notice = Notice.Create()
  notice:SetText("봄 스테이지")

  pl:StartSpringStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
  CreateGround(0,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  CreateGround(600,76)
  CreateCastle(800, 15) -- 중간보스 성

end

function UpdateSpring() -- 메인에서 Draw 하기 위한 메서드 여기서'만'이미지 출력이 가능.
  NoticeDraw()
  dustWind:Draw()

  stageSpring:DustWindBlowing(STORM_MOVE_POWER)
end

    --CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
 --   CreateGround(622,76)

 --   CreateRiver(430,150)
 --    CreateRiver(447,150)

 --    CreatePicket(400,146)

 --     --여기서부터

 --    aniBridge1 = newAnimation(imgBridge, 75, 61, 0.1, 0)
 --    aniBridge2 = newAnimation(imgBridge, 75, 61, 0.1, 0)
 --    aniBridge3 = newAnimation(imgBridge, 75, 61, 0.1, 0)

 --    aniBridge1:setMode("once")
 --    aniBridge2:setMode("once")
 --    aniBridge3:setMode("once")

 --    --위와 같이 애니메이션으로 사용할 다리 3개에 대한 생성과 설정값만 적용해놓고
 --    --아래처럼 조건문을 줘서 총 3차례에 걸쳐서 다리가 나타나게 하려고 함.
 --    --현재 문제가 없기 때문에 숫자키 '9'를 누르면 BridgePassValue값이 조금씩 증가해서
 --    --다리가 올라오게끔 구상함. by.현식 0802

  -- end
