Boss = {}
Boss.__index = Boss

Boss_frames = {}
Boss_frames[0]  = love.graphics.newQuad(0,0,182,141,91,70)

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
  love.graphics.draw(imgBoss,Boss_now_frame,self.x,self.y)
end