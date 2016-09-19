-- Made : 2016/08/10 - G
-- Name : DustWind.lua
DustWind = {}
DustWind.__index = DustWind

function DustWind.Create()
	local self = {}
	setmetatable(self, DustWind)
	self:Reset()

	return self
end

function DustWind:Reset()
	-- Initialize
	self.x = 0
	self.y = 0
	self.frame = 0
	self.isPlay = nil
	-- 사용할지 모르겠지만 임시 변수로 남김. G

	self:SettingAnimation()
end

function DustWind:SettingAnimation()
	CreateSandStorm(300,PLAYER_START_Y)
end

function DustWind:Draw()
	if SandStorm == nil then
		return
	end

	SandStorm:draw()
end

function DustWind:Play()
	SandStorm:play()
end

function DustWind:CheckCollideBoxForDustWind(x,y)
	for i =0, boxCount-1 do
		if x - boxList[i].x < 64 and x - boxList[i].x > -64 then
			boxList[i].x = randomSeed:random(300,500)
		end
	end
end

function DustWind:Move(_distance)
	-- 바람이 움직인다
	local x = self.x
	local y = self.y

	for i=1,_distance,0.1 do
		SandStorm:SetAniPostion(x+i,y)
		self.x = x+i
	end

--	self:CheckCollideBoxForDustWind(self.x,self.y)
end

function DustWind:Pause()
	self.isPlay = false
end

function DustWind:GetX()
	return self.x
end

function DustWind:GetY()
	return self.y
end

function DustWind:UpdateMove(dt) --tree key이벤트
	self=BackgroundMove(self,dt)
  end

function DustWind:Normal(dt) --cloud 이동
	self=BackgroundNormal(self,dt)
end

function DustWind:Update(dt)
	self:UpdateMove(dt)
	self:Normal(dt)
	SandStorm:update(dt)
end

function DustWindDraw()
	if SandStorm == nil then
		return
	end
	SandStorm:Draw()
end
