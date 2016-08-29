Boss = {}
Boss.__index = Boss

Boss_frames = {}
Boss_frames[0]  = love.graphics.newQuad(0,0,160,160,160,160)

function Boss.create()
  local self = {}
  setmetatable(self, Boss)
  self:reset()
  return self
end

function Boss:reset(x,y)
  self.frame = 1
  self.x = x
  self.y = y

  Boss_now_frame = Boss_frames[0]
end

function Boss:normal(dt)
  self=BackgroundNormal(self,dt)
end

function Boss:UpdateMove(dt)
  self=BackgroundMove(self,dt)
  end

function Boss:update(dt)
  self:UpdateMove(dt)
  --self:normal(dt)
end

function Boss:draw()
  if stageLevel == 5 then
    love.graphics.draw(imgBoss,Boss_now_frame,self.x,self.y)
  elseif stageLevel == 6 then
    love.graphics.draw(imgSBoss,Boss_now_frame,self.x,self.y)
  elseif stageLevel == 7 then
    love.graphics.draw(imgFBoss,Boss_now_frame,self.x,self.y)
  elseif stageLevel == 8 then
    love.graphics.draw(imgWBoss,Boss_now_frame,self.x,self.y)
  --파이널보스도 추가.
  end
end
