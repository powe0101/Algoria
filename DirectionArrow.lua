-- Made : 2016/08/31 - G
-- Name : DirectionArrow.lua
DirectionArrow = {}
DirectionArrow.__index = DirectionArrow

directionArrowFrame = love.graphics.newQuad(0, 0, 32, 32, 32, 32)


directionArrow = nil --전역 화살표 객체

function DirectionArrow.Create()
  local self = {}

  setmetatable(self,DirectionArrow)
  self:Reset()

  return self
end

function DirectionArrow:Reset()
  self.frame = 0
  self.RegisterImage() -- 이미지 등록
end

function DirectionArrow:RegisterImage()
  imgDirectionArrowRight = love.graphics.newImage("images/directionArrowRight.png")
  imgDirectionArrowRight:setFilter("nearest","nearest")
  imgDirectionArrowLeft = love.graphics.newImage("images/directionArrowLeft.png")
  imgDirectionArrowLeft:setFilter("nearest","nearest")
end

function DirectionArrow:Draw()
  if qmarkCount == nil or qmarkCount <= 0 or pl == nil then
    return -- 현재 받아야 하는 퀘스트가 없거나, 플레이어가 없으면
  end

  local qMarkX = qmarkList[qmarkCount-1].x
  local playerX = pl:GetX()
  --현재 퀘스트와 플레이어의 위치 판별
  if playerX - qMarkX < 0 then --플레이어 오른쪽에 퀘스트 존재
    love.graphics.draw(imgDirectionArrowRight,directionArrowFrame,0,50)
  elseif playerX - qMarkX > 0 then --플레이어 왼쪽에 퀘스트 존재
    love.graphics.draw(imgDirectionArrowLeft,directionArrowFrame,WIDTH-50,50)
  end
end
