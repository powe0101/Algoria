BackGround = {}
BackGround.__index = BackGround

backGround_frames_x = {}


function BackGround.create()
	local self = {}
	setmetatable(self, BackGround)
	self:reset()
	return self
end

function BackGround:reset(x,y)
	--0808 근영 yfix yspeed 추가 
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	backGround_now_frame = backGround_frames_x[0]
end

function BackGround:SpaceJump(dt) --0808근영 점프함수  
	self=SCheckSpaceBarDown(self,dt)
end

function BackGround:normal(dt) --cloud 이동 
	self=BackgroundNormal(self,dt)
end

function BackGround:UpdateMove(dt) --cloud key이벤트 
	self=BackgroundMove(self,dt)
end

function BackGround:update(dt)
	if stageLevel==2 then -- 0808근영 여름 스테이지 에서 점프함수 호출 
		self:SpaceJump(dt)
	end
	self:UpdateMove(dt)
	self:normal(dt)
end

function BackGround:draw()
	if stageLevel==0 then
	backGround_frames_x[0]  = love.graphics.newQuad(0,0,300,200,300,200)
	love.graphics.draw(imgVillageBackGround,backGround_frames_x[0],self.x,self.y)
	elseif stageLevel==1 then 
		love.graphics.draw(imgSpringBackGround,backGround_frames_x[0],self.x,self.y)
	
	elseif stageLevel==3 then 
		love.graphics.draw(imgFallBackGround,backGround_frames_x[0],self.x,self.y)
	end
end