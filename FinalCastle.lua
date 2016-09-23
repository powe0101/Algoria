FinalCastle = {}
FinalCastle.__index = FinalCastle

fianlCastle_frame = love.graphics.newQuad(0,0,400,200,400,200)

function FinalCastle.create()
	local self = {}
	setmetatable(self, FinalCastle)
	self:reset()
	return self
end

function FinalCastle:reset(x,y)
	self.yfix=y
	self.yspeed = 0
	self.onGround = true
	self.status = 0
	self.frame = 1
	self.x = x
	self.y = y
end

function FinalCastle:SpaceJump(dt)
	self=SCheckSpaceBarDown(self,dt)
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

function AppearFinalCastle()
	-- 겨울까지 클리어 후 특정 조건 만족시 발생

	--[[ 겨울 스테이지까지 클리어하면 마왕을 봉인했다고 생각했으나
	마왕은 자신의 진정한 힘을 각성하여 자신의 성을 마을에 떨어뜨려
	마을을 폐허로 만든다 그 후 용사와 마왕의 최후의 결전
	]]
	--[[
	1. 마왕성이 떨어지는 장면을 이미지로 만드는 방식
	2. 마왕성을 직접 y좌표가 점점 감소하게 만드는 방식
	]]

	-- 마왕성 생성
	fCastle = FinalCastle.create()
	fCastle:reset(300, 0)

	-- 암전 1 + 음악 바뀜
	-- 마왕성 하강
	if fCastle:GetY() < 100 then
		fCastle.self.y = fCastle.self.y + 10
	end
	-- 암전 2
	-- 마왕성 착지

end
