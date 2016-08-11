Picket = {}
Picket.__index = Picket

Picket_frame_x = love.graphics.newQuad(0,0,32,32,32,32)

function Picket.create()
	local self = {}
	setmetatable(self, Picket)
	self:reset()
	return self
end

function Picket:reset(x, y)
 	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	Picket_now_frame = Picket_frame_x
end

function Picket:SpaceJump(dt) --0808근영 점프함수  
	self=SCheckSpaceBarDown(self,dt)
end

function Picket:normal(dt)
	self = BackgroundNormal(self, dt)
end

function Picket:UpdateMove(dt)
	self = BackgroundMove(self, dt)
end

function Picket:update(dt)
	if stageLevel==2 then -- 0808근영 여름 스테이지 에서 점프함수 호출 
		self:SpaceJump(dt)
	end
	CheckQuest(self)--0811 퀘스트 이벤트 호출 
	self:UpdateMove(dt)
	self:normal(dt)
end

function Picket:draw()
	love.graphics.draw(imgPicket,Picket_now_frame,self.x,self.y)
end