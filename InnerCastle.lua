InnerCastle = {}
InnerCastle.__index = InnerCastle

InnerCastle_frames_x  = love.graphics.newQuad(0,0,608,208,608,128)

function InnerCastle.create()
	local self = {}
	setmetatable(self, InnerCastle)
	self:reset()
	return self
end

function InnerCastle:reset(x,y)
	self.frame = 1
	self.x = x
	self.y = y

	self.onInnerCastle = true
	InnerCastle_now_frame = InnerCastle_frames_x
end

function InnerCastle:UpdateMove(dt) --tree key이벤트 
	self=BackInnerCastleMove(self,dt)
  end

function InnerCastle:normal(dt) --InnerCastle 이동 
	self=BackInnerCastleNormal(self,dt)
end

function InnerCastle:update(dt)
	self:UpdateMove(dt)
	self:normal(dt)
end

function InnerCastle:draw()
	if stageLevel == 7 then
		love.graphics.draw(imgFallCastle,InnerCastle_now_frame,self.x,self.y)
	end
end