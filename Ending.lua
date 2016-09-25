-- Made : 2016/08/23 - G
-- Name : Ending.lua
Ending = {}
Ending.__index = {}

-- 테이블을 대상으로 프레임별 이동 객체, 출력 텍스트 설정.

function Ending.Create()
  local self = {}
  setmetatable(self,Ending)
  self:Reset()
  return self
end

function Ending:Reset()
  self.frame = 0
  self.width = WIDTH
  self.HEIGHT = HEIGHT
  self.page = 0
end

function Ending:Move(_object,_direction,_x,_y)
  --오브젝트를 대상으로 이동.
end

function Ending:UpdateText(_text,_x,_y)
  love.graphics.print(_text)
end

function Ending:UpdatePage()
  self.page = self.page + 1
end

function Ending:Draw()

end

function Ending:Update()
  self:UpdateText()
  self:UpdatePage()
end
