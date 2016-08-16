-- Made : 2016/08/16 - G
-- Name : Trampolin.lua

Trampolin = {}
Trampolin.__index = Trampolin

function Trampolin.Create()
  local self = {}
  setmetatable(self,Trampolin)
  self:Reset()

  return self
end

function Trampolin:Reset()
  self.x = 0
  self.y = 0
  self.frame = 0

-- self:RegisterImage()
-- self:SettingAnimation()
end

function Trampolin:RegisterImage()
  --imgTrampolin = love.graphics.newImage("images/portal06.png")
  --imgTrampolin:setFilter("nearest","nearest")
end
--이미지 추가 필요.


function Trampolin:SettingAnimation()
  AnimationTrampolin = newAnimation(imgTrampolin,64,64,0.3,0)
  AnimationTrampolin:setMode("loop")
  AnimationTrampolin:SetAniPostion(0,0)
end

function Trampolin:Draw()
  if AnimationTrampolin == nil then
    return
  end

  AnimationTrampolin:draw()
end

function Trampolin:Play()
  AnimationTrampolin:play()
end

function Trampolin:GetX()
  return self.x
end

function Trampolin:GetY()
  return self.y
end

function Trampolin:UpdateMove(dt) --tree key이벤트
	self=BackgroundMove(self,dt)
  end

function Trampolin:Normal(dt) --cloud 이동
	self=BackgroundNormal(self,dt)
end

function Trampolin:Update(dt)
	self:UpdateMove(dt)
	self:Normal(dt)
	AnimationTrampolin:update(dt)
end
