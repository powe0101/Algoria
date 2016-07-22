House = {}
House.__index = House

house_frames_x = {}
house_frames_x[0]  = love.graphics.newQuad(0,0,320,272,128,128)

function House.create()
	local self = {}
	setmetatable(self, House)
	self:reset()
	return self
end

function House:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y
	self.onGround = true
	self.yspeed = 0
	self.status = 0
	house_now_frame = house_frames_x[0]
end

function House:normal(dt)  --tree 이동 
	self=BackgroundNomal(self,dt)
end

function House:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function House:update(dt)
	self:UpdateMove(dt)
	--self:normal(dt)
end

function House:draw()
	love.graphics.draw(imgHouse,house_frames_x[0],self.x,self.y)
end

function House:GetX()
	return self.x
end

function House:GetY()
	return self.y
end