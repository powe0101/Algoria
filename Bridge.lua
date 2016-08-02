Bridge = {}
Bridge.__index = Bridge

Bridge_frames_x  = love.graphics.newQuad(0,0,128,128,128,128)

function Bridge.create()
	local self = {}
	setmetatable(self, Bridge)
	self:reset()	
	return self
end

function Bridge:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onBridge = true
	Bridge_now_frame = Bridge_frames_x
end

function Bridge:normal(dt) --Bridge 이동 
	self=BackgroundNormal(self,dt)
end

function Bridge:UpdateMove(dt) --Bridge key이벤트 
	self=BackgroundMove(self,dt)
end

function Bridge:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Bridge:draw()
	love.graphics.draw(imgBridge,Bridge_now_frame,self.x,self.y)
end