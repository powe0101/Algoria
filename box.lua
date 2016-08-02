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

	--박스 크기
	self.width = 20
	self.height = 20

	--위치 조정

end

function Box:normal(dt) --cloud 이동 
	self=BackgroundNormal(self,dt)
	self.top = self:GetY() - (self.height * 2)
	self.left = self:GetX() - (self.width * 2)
	self.right = self:GetX() + (self.width * 2)
	self.bottom = self:GetY()
end

function Box:UpdateMove(dt) --cloud key이벤트 
	self=BackgroundMove(self,dt)
end

function Box:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
	self.x_distance = pl:GetX() - self:GetX()
	self.y_distance = pl:GetY() - self:GetY()
	--Debug

end

function Box:GetX()
	return self.x
end 

function Box:GetY()
	return self.y
end

function Box:DrawLine(_color,_x,_y)
	love.graphics.setColor(_color)
	love.graphics.rectangle('line', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)
	love.graphics.setColor(255,255,255)
end

function Box:draw()
	-- love.graphics.setColor(255,255,255) -- 흰색 RGBA
 -- 	love.graphics.rectangle('fill', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)
 	drawBox(self,255,255,255)
 	if self.isCollision == false then 
 		self:DrawLine(collisionColor,self.x,self.y)
 	end
 	-- love.graphics.setColor(255,255,255) -- 흰색 RGBA
end

function drawBox(box, r,g,b)
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x, box.y, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x, box.y, BOX_WIDTH, BOX_HEIGHT)
end