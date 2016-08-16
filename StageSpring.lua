StageSpring = {}
StageSpring.__index = StageSpring

dustWind = nil

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
end

function StageSpring:CreateDustWind()
  dustWind = DustWind.Create()
end

function StageSpring:MakePuzzle(_count)
  --for i = 1, _count do
  --  박스말고 긴 막대
  --end
end

function StageSpring:ReplacePuzzle()

end

function StageSpring:DeletePuzzle()
  --긴 막대들 삭제
end

function StageSpring:DustWindBlowing(_distance)
  local seed = dustWind:RandomSeed()
  --퍼즐은 랜덤?
  --경고?
  dustWind:Move(_distance)
  --돌풍이 움직인다
  StageSpring:ReplacePuzzle()
  --퍼즐이 바뀐다
end

function CreateSpring()
	if stageLevel == 1 then
    phase = 1
    pl:reset()
  end

  stageSpring = StageSpring.Create()
  stageSpring:CreateDustWind()

  notice = Notice.Create()
  notice:SetText("Stage Spring")

  stageSpring:MakePuzzle(5)
  pl:StartSpringStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
  CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  CreateGround(600,76)
end

function UpdateSpring() -- 메인에서 Draw 하기 위한 메서드 여기서'만'이미지 출력이 가능.
  NoticeDraw()
  dustWind:Draw()

  if love.keyboard.isDown("return") then
    stageSpring:DustWindBlowing(10)
  end

end
    --CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
 --   CreateGround(622,76)

 --   CreateRiver(346,150)
 --   CreateRiver(430,150)
 --    CreateRiver(447,150)

 --   CreateTree(150,54)
  --  CreateTree(300,54)
 --     CreateTree(600,54)
 --     CreateTree(750,54)

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
