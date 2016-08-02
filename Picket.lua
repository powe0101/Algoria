Picket = {}
Picket.__index = Picket

Picket_frame_x = love.graphics.newQuad(0,0,32,32,32,32)

function Picket.create()
	local self = {}
	setmetatable(self, Picket)
	self:reset()
	return self
end

function Picket:reset(x, y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	Picket_now_frame = Picket_frame_x
end

function Picket:normal(dt)
	self = BackgroundNormal(self, dt)
end

function Picket:UpdateMove(dt)
	self = BackgroundMove(self, dt)
end

function Picket:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function Picket:draw()
	love.graphics.draw(imgPicket,Picket_now_frame,self.x,self.y)
end