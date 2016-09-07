ShortestPathtouse = {}
ShortestPathHouse.__index = ShortestPathHouse

ShortestPathHouse_frame = love.graphics.newQuad(0,0,32,32,32,32)

function ShortestPathHouse.create()
	local self = {}
	setmetatable(self, ShortestPathHouse)
	self:reset()
	return self
end

function ShortestPathHouse:reset(x,y,_type)
	self.width = 32
	self.height = 32
	self.type = _type
	self.x = x
	self.y = y
	self:RegistImage(self.point)
end

function ShortestPathHouse:RegistImage()
	if _type == 1 then
		imgShortestPathHouse = love.graphics.newImage("images/startHouse.png")
	elseif _type == 2 then
		imgShortestPathHouse = love.graphics.newImage("images/CheckHouse.png")
	elseif _type == 3 then
		imgShortestPathHouse = love.graphics.newImage("images/EndHouse.png")
	end
end

function ShortestPathHouse:Draw()
	love.grapgics.draw(imgShortestPathHouse,ShortestPathHouse_frame,self.x,self.y)
end
