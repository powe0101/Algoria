Bheart = {}
Bheart.__index = Bheart

blankCheck = false --공백하트인지 꽉찬하트인지

Bheart_frames_x  = love.graphics.newQuad(0,0, 20, 18, 20, 18)

function Bheart.create()
	local self = {}
	setmetatable(self, Bheart)
	self:reset()	
	return self
end

function Bheart:reset(x,y,check)
	self.frame = 1
	self.x = x
	self.y = y

	blankCheck = check
	self.onBheart = true
	Bheart_now_frame = Bheart_frames_x
end

function Bheart:normal(dt)
	self=BackgroundNormal(self,dt)
end

function Bheart:UpdateMove(dt)
	self=BackgroundMove(self,dt)
end

function Bheart:update(dt) --하트는 따라다녀야되
	--self:UpdateMove(dt)
	--self:normal(dt)
end

function Bheart:draw()
	love.graphics.draw(imgHeartBlank, Bheart_now_frame, self.x, self.y)
end