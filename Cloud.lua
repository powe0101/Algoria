Cloud = {}
Cloud.__index = Cloud

cloud_frames_x = {}
cloud_frames_y = {}
cloud_frames_x[0]  = love.graphics.newQuad(0,0,80,40,80,40)
cloud_frames_y[0] = love.graphics.newQuad(0,0,160,160,64,64)

function Cloud.create()
	local self = {}
	setmetatable(self, Cloud)
	self:reset()
	return self
end

function Cloud:reset(x,y)
	--0808 근영 yfix yspeed 추가
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	cloud_now_frame = cloud_frames_x[0]
end

function Cloud:SpaceJump(dt) --0808근영 점프함수
	self=SCheckSpaceBarDown(self,dt)
end

function Cloud:normal(dt) --cloud 이동
	self=BackgroundNormal(self,dt)
end

function Cloud:UpdateMove(dt) --cloud key이벤트
	self=BackgroundMove(self,dt)
end

function Cloud:update(dt)
	if stageLevel==2 then -- 0808근영 여름 스테이지 에서 점프함수 호출
		self:SpaceJump(dt)
	end
	self:UpdateMove(dt)
	self:normal(dt)
end

function Cloud:draw()
	love.graphics.draw(imgCloud,cloud_frames_x[0],self.x,self.y)
end
