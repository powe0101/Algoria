Castle = {}
Castle.__index = Castle

castle_frames = {}
castle_frames[0]  = love.graphics.newQuad(0,0,300,169,300,169)

function Castle.create()
	local self = {}
	setmetatable(self, Castle)
	self:reset()
	return self
end

function Castle:reset(x,y)
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	castle_now_frame = castle_frames[0]
end

function Castle:SpaceJump(dt) --0808근영 점프함수
	self=SCheckSpaceBarDown(self,dt)
end

function Castle:UpdateMove(dt)
	self=BackgroundMove(self,dt)
  end

function Castle:normal(dt)
	self=BackgroundNormal(self,dt)
end
function Castle:update(dt)
	 if stageLevel==2 then
		self:SpaceJump(dt)
	end
	self:UpdateMove(dt)
	self:normal(dt)
end

function Castle:draw()
	love.graphics.draw(imgCastle,castle_frames[0],self.x,self.y)
end

function Castle:GetX()
	return self.x
end

function Castle:GetY()
	return self.y
end
