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
	self.dtBox = {}

	return self
end

function Box:reset(x,y)
	self.x = x
	self.y = y
	self.frame = 1
	self.onGround = true

	self.isCollisionRight = false
	self.isCollisionLeft = false
	self.isCollisionTop = false
	self.isCollisionBottom = false
	--박스 크기
	self.width = 20
	self.height = 20

	--위치 조정
end

function Box:GetDT()
	return self.dtBox
end

function Box:CreateDirectionBox()
  self.dtBox[0] = self.x + BOX_WIDTH
  self.dtBox[1] = self.y
   --left

  self.dtBox[2] = self.x - BOX_WIDTH
  self.dtBox[3] = self.y
   --right

  self.dtBox[4] = self.x
  self.dtBox[5] = self.y + BOX_WIDTH
  	--top

  self.dtBox[6] = self.x
  self.dtBox[7] = self.y - BOX_WIDTH
 	--bottom
end

function Box:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function Box:normal(dt) --cloud 이동 
	self=BackgroundNormal(self,dt)
	
	self.top = self:GetY() - (self.height * 2)
	self.left = self:GetX() - (self.width * 2)
	self.right = self:GetX() + (self.width * 2)
	self.bottom = self:GetY()
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

function Box:DrawLine(_x,_y)
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle('line', _x,_y, BOX_WIDTH, BOX_HEIGHT)
	love.graphics.setColor(255,255,255)
end

function Box:draw()
	love.graphics.setColor(255,255,255) -- 흰색 RGBA
  	love.graphics.rectangle('fill', self.x,self.y, BOX_WIDTH, BOX_HEIGHT)

  	if DEBUG_SETTING then 
 		drawDirectionBox(self,255,255,255)
 	end

 	if self.isCollisionRight then 
 		self:DrawLine(self.x + BOX_WIDTH, self.y)
 	end

 	if self.isCollisionLeft then 
 		self:DrawLine(self.x - BOX_WIDTH, self.y)
 	end

 	if self.isCollisionTop then 
 		self:DrawLine(self.x, self.y + BOX_WIDTH)
 	end

 	if self.isCollisionBottom then 
 		self:DrawLine(self.x, self.y - BOX_WIDTH)
 	end

 	love.graphics.setColor(255,255,255) -- 흰색 RGBA
end



function drawDirectionBox(box, r,g,b)
  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x + BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x + BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)

  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x - BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x - BOX_WIDTH, box.y, BOX_WIDTH, BOX_HEIGHT)

  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x , box.y + BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x , box.y + BOX_WIDTH , BOX_WIDTH, BOX_HEIGHT)

  love.graphics.setColor(r,g,b,70)
  love.graphics.rectangle("fill", box.x, box.y - BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
  love.graphics.setColor(r,g,b)
  love.graphics.rectangle("line", box.x, box.y - BOX_WIDTH, BOX_WIDTH, BOX_HEIGHT)
	love.graphics.setColor(darkcolor) -- 흰색 RGBA
-- 	love.graphics.rectangle('fill', self:GetX(), self:GetY(), BOX_WIDTH, BOX_HEIGHT)
end