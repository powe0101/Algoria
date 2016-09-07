ShortestPathHouse = {}
ShortestPathHouse.__index = ShortestPathHouse

shortestPathHouse_frame = love.graphics.newQuad(0,0,32,32,32,32)

function ShortestPathHouse.create()
	local self = {}
	setmetatable(self, ShortestPathHouse)
	self:reset()
	return self
end

function ShortestPathHouse:reset(x,y,_type)
	self.x = x
	self.y = y
	self.type = _type
end

function ShortestPathHouse:draw()
	if self.type == 1 then
		love.graphics.draw(imgShortestPathStartHouse,shortestPathHouse_frame,self.x,self.y)
	elseif self.type == 2 then
		love.graphics.draw(imgShortestPathCheckHouse,shortestPathHouse_frame,self.x,self.y)
	elseif self.type == 3 then
		love.graphics.draw(imgShortestPathEndHouse,shortestPathHouse_frame,self.x,self.y)
	end
end
