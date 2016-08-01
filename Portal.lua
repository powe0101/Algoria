Portal = {}
Portal.__index = Portal

Portal_frames_x  = love.graphics.newQuad(0,0,64,108,64,64) -- => 이거 움짤로 만들면 리스트로 관리해야함.

function Portal.create()
	local self = {}
	setmetatable(self, Portal)
	self:reset()	
	return self
end

function Portal:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	Portal_now_frame = Portal_frames_x
end

function Portal:normal(dt) --Portal 이동 
	self=BackgroundNormal(self,dt)
end

function Portal:UpdateMove(dt) --Portal key이벤트 
	self=BackgroundMove(self,dt)
end

function Portal:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Portal:draw()
	love.graphics.draw(imgPortal,Portal_now_frame,self.x,self.y)
end