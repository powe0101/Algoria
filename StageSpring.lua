StageSpring = {}
StageSpring.__index = StageSpring

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
  _dw = DustWind.Create()
  --self:dustWind = _dw
end

function StageSpring:MakePuzzle(_count)
  

  for i = 1, _count do
    --CreateBox(love.math.random(0,self.width),love.math.random(0,self.height))
    --박스말고 긴 막대 
  end

end

function StageSpring:DeletePuzzle()
  BoxListDelete()
end

function StageSpring:DustWindBlowing()
  --바람이 분다 
  --돌풍이 움직인다 
  --퍼즐이 바뀐다
  --점프대를 추가한다.
  --퍼즐은 랜덤?
  --
end

function CreateSpring()
	if stageLevel == 1 then
    phase = 1
  end
  stageSpring = StageSpring.Create()

  stageSpring:CreateDustWind()
  notice = Notice.Create()
  notice:SetText("Stage Spring")
  stageSpring:MakePuzzle(5)



  CreateGround(-177,76) --도개교가 깔리고 그 아래 강물이 생길거니까 플레이어로 부터 얻은 좌표 기준으로 290이상 못가게 막아야 함.
  CreateGround(600,76)

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

 --   pl:StartSpringStage() --스테이지가 변경됐을때 초기좌표로 되돌리기 위한 메서드
  -- end