Ground = {}
Ground.__index = Ground

Ground_frames_x  = love.graphics.newQuad(0,0,608,208,608,128) 
Ground_half_frames  = love.graphics.newQuad(0,0,304,208,304,128) 
Ground_castle_frames  = love.graphics.newQuad(0,0,608,220,608,220)  

function Ground.create()
	local self = {}
	setmetatable(self, Ground)
	self:reset()
	return self
end

function Ground:reset(x,y)
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y

	self.onGround = true
	Ground_now_frame = Ground_frames_x
end

function Ground:GetY()
	return self.y
end

function Ground:SetY(_y)
	self.y=_y
end

function Ground:SpaceJump(dt) --0808근영 점프함수  
	self=SCheckSpaceBarDown(self,dt)
end

function Ground:UpdateMove(dt) --tree key이벤트 
	self=BackgroundMove(self,dt)
  end

function Ground:normal(dt) --Ground 이동 
	self=BackgroundNormal(self,dt)
end

function Ground:update(dt)
    if stageLevel==2 then
		self:SpaceJump(dt)
	end
	self:UpdateMove(dt)
	self:normal(dt)
end

function Ground:draw()

	if stageLevel == 0 or stageLevel == 1 then
	love.graphics.draw(imgGround,Ground_now_frame,self.x,self.y)
	elseif stageLevel == 2 then 
		if canPass==false then
			love.graphics.draw(imgSCreeper,Ground_now_frame,self.x,self.y)
	    elseif canPass then
	    	love.graphics.draw(imgSGround,Ground_now_frame,self.x,self.y)
	    end
	elseif stageLevel == 3 then --가을입니다. by.현식
		if fallHalfGround then --땅을 절반만 그리고 싶을 때,
			love.graphics.draw(imgFGround,Ground_half_frames,self.x,self.y)
		else --정상적일 때,
			love.graphics.draw(imgFGround,Ground_now_frame,self.x,self.y)
		end
	elseif stageLevel == 4 then
		love.graphics.draw(imgWGround,Ground_now_frame,self.x,self.y)
	elseif stageLevel == 7 then
		love.graphics.draw(imgFallCastle,Ground_castle_frames,self.x,self.y)
	end
end