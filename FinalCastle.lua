FinalCastle = {}
FinalCastle.__index = FinalCastle

fianlCastle_frame = love.graphics.newQuad(0,0,300,169,300,169)

function FinalCastle.create()
	local self = {}
	setmetatable(self, FinalCastle)
	self:reset()
	return self
end

function FinalCastle:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y
end

function FinalCastle:UpdateMove(dt)
	self=BackgroundMove(self,dt)
end

function FinalCastle:normal(dt)
	self=BackgroundNormal(self,dt)
end
function FinalCastle:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
	if self.y < 15 then
		self.y = self.y + 1
	end
end

function FinalCastle:draw()
	love.graphics.draw(imgFCastle,fianlCastle_frame,self.x,self.y)
end

function FinalCastle:GetX()
	return self.x
end

function FinalCastle:GetY()
	return self.y
end
