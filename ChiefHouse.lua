ChiefHouse = {}
ChiefHouse.__index = ChiefHouse

chiefHouse_frames = {}
chiefHouse_frames[0] = love.graphics.newQuad(0,0,128,100,128,100)

function ChiefHouse.create()
	local self = {}
	setmetatable(self, ChiefHouse)
	self:reset()
	return self
end

function ChiefHouse:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	chiefHouse_now_frames = chiefHouse_frames[0]
end

function ChiefHouse:normal(dt)
	self=BackgroundNormal(self,dt)
end

function ChiefHouse:UpdateMove(dt)
	self=BackgroundMove(self,dt)
  end

function ChiefHouse:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function ChiefHouse:draw()
	love.graphics.draw(imgCHouse,chiefHouse_now_frames,self.x,self.y)
end

function ChiefHouse:GetX()
	return self.x
end

function ChiefHouse:GetY()
	return self.y
end
