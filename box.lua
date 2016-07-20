Box = {}
Box.__index = Box

box_frame = love.graphics.newQuad(0, 0, 20, 20, 64, 64)

BOX_WIDTH = 20
BOX_HEIGHT = 20

function Box:create()
	local self = {}
	setmetatable(self, Box)
	self:reset()

	return self
end

function Box:init(x,y)
	self.x = x
	self.y = y
end

function Box:reset()
	self.frame = 1
	self.onGround = true
end

function Box:update()
	self:draw()
end

function Box:GetX()
	return self.x
end 

function Box:GetY()
	return self.y
end
function Box:draw()
 	love.graphics.rectangle('fill', self:GetX(), self:GetY(), BOX_WIDTH, BOX_HEIGHT)
end