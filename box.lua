Box = {}
Box.__index = Box

box_frame = love.graphics.newQuad(0, 0, 20, 20, 128, 128)

BOX_WIDTH = 20
BOX_HEIGHT = 20

collisionColor = {255,0,0}
global_isCollision = false
function Box:create()
	local self = {}
	setmetatable(self, Box)
	self:reset()
	return self
end

function Box:reset(x,y)
	self.x = x
	self.y = y
	self.frame = 1
	self.onGround = true
	self.isCollision = false
end

function Box:normal(dt) --cloud 이동 
	self=BackgroundNormal(self,dt)
end

function Box:UpdateMove(dt) --cloud key이벤트 
	self=BackgroundMove(self,dt)
end

function Box:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
	local x_distance = pl:GetX() - self:GetX()
	local y_distance = pl:GetY() - self:GetY()
	if x_distance <= 12 and x_distance >= -35 then
		if y_distance <= 12 and y_distance >= -35 then 
			self.isCollision = true
			return 
		end
	else
		self.isCollision = false
	end

end

function Box:GetX()
	return self.x
end 

function Box:GetY()
	return self.y
end

function Box:draw()
	love.graphics.setColor(255,255,255) -- 흰색 RGBA
 	love.graphics.rectangle('fill', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)
 	if self.isCollision then
		love.graphics.setColor(collisionColor) -- 흰색 RGBA
 		love.graphics.rectangle('line', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)
 	end

 	love.graphics.setColor(255,255,255) -- 흰색 RGBA
end