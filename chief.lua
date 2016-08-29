Chief = {}
Chief.__index = Chief

chief_frames = {}
chief_frames[0] = love.graphics.newQuad(0,0,34,32,34,32)

function Chief.create()
	local self = {}
	setmetatable(self, Chief)
	self:reset()
	return self
end

function Chief:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	chief_now_frames = chief_frames[0]
end

function Chief:normal(dt)
	self=BackgroundNormal(self,dt)
end

function Chief:UpdateMove(dt)
	self=BackgroundMove(self,dt)
  end

function Chief:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Chief:draw()
	love.graphics.draw(imgChief,chief_now_frames,self.x,self.y)
end
