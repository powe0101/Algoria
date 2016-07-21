Cloud = {}
Cloud.__index = Cloud

cloud_frames_x = {}
cloud_frames_y = {}
cloud_frames_x[0]  = love.graphics.newQuad(0,0,160,160,64,64)
cloud_frames_y[0] = love.graphics.newQuad(0,0,160,160,64,64)

	
function Cloud.create()
	local self = {}
	setmetatable(self, Cloud)
	self:reset()
	return self
end

function Cloud:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	cloud_now_frame = cloud_frames_x[0]
end

function Cloud:normal(dt) --cloud 이동 
	self=BackgroundNomal(self,dt)
end

function Cloud:UpdateMove(dt) --cloud key이벤트 
	self=BackgroundMove(self,dt)
  end

function Cloud:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Cloud:draw()
	love.graphics.draw(imgCloud,cloud_frames_x[0],self.x,self.y)
	
end

function Cloud:GetX()
	return self.x
end

function Cloud:GetY()
	return self.y
end