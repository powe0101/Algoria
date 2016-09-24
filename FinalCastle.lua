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
	--self.y = self.y + 1
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
	-- if stageLvel == 9 then 발생

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
	fCastle:reset(180, -160)

	-- 암전 1 + 음악 바뀜
	-- 마왕성 하강, 착지
	-- 암전 2 + 마을 폐허화
	-- 스테이지 레벨 변경
	-- 마을 폐허로 다시 그리기
end
