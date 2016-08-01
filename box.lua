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

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	--1 : box 
	--2 : player
	if x1 > x2 + w2 or -- 왼쪽
       y1 > y2 + h2 or -- 위
       x2 > x1 + w1 or -- 오른쪽 
       y2 > y1 + h1    -- 아래
    then
    	--PLAYER_GROUND_Y = 135
        return false  -- No collision. Yay!
    else
        return true    -- Yes collision. Ouch!
    end
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

	self.isCollision = CheckCollision(self.x,self.y,self.width,self.height,pl:GetX(),pl:GetY(),pl.width,pl.height)
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