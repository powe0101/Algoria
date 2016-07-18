Box = {}
Box.__index = Box

BOX_WIDTH = 20
BOX_HEIGHT = 20

box_frame = love.graphics.newQuad(0, 0, 20, 20, 128, 128)

function Box:create()
	local self = {}
	setmetatable(self, Box)
	self:reset()
	return self
end

function Box:reset()
	self.frame = 1
	self.onGround = true
end

function Box:draw()
	love.graphics.draw(imgBox,)
end