BlackSmithHouse = {}
BlackSmithHouse.__index = BlackSmithHouse

blackSmithHouse_frames = {}
blackSmithHouse_frames[0] = love.graphics.newQuad(0,0,128,72,128,72)

function BlackSmithHouse.create()
	local self = {}
	setmetatable(self, BlackSmithHouse)
	self:reset()
	return self
end

function BlackSmithHouse:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	blackSmithHouse_now_frames = blackSmithHouse_frames[0]
end

function BlackSmithHouse:normal(dt)  --tree 이동 
	self=BackgroundNormal(self,dt)
end

function BlackSmithHouse:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function BlackSmithHouse:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function BlackSmithHouse:draw()
	love.graphics.draw(imgBSHouse,blackSmithHouse_now_frames,self.x,self.y)
end

function BlackSmithHouse:GetX()
	return self.x
end

function BlackSmithHouse:GetY()
	return self.y
end