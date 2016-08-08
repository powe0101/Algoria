Heart = {}
Heart.__index = Heart

blankCheck = false --공백하트인지 꽉찬하트인지

Heart_frames_x  = love.graphics.newQuad(0,0, 20, 18, 20, 18)

function Heart.create()
	local self = {}
	setmetatable(self, Heart)
	self:reset()	
	return self
end

function Heart:reset(x,y,check)
	self.frame = 1
	self.x = x
	self.y = y

	blankCheck = check
	self.onHeart = true
	Heart_now_frame = Heart_frames_x
end

function Heart:normal(dt)
	self=BackgroundNormal(self,dt)
end

function Heart:UpdateMove(dt)
	self=BackgroundMove(self,dt)
end

function Heart:update(dt) --하트는 따라다녀야되
	--self:UpdateMove(dt)
	--self:normal(dt)
end

function Heart:draw()
	love.graphics.draw(imgHeart, Heart_now_frame, self.x, self.y)
end