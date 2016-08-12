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
	imgDustWind = love.graphics.newImage("images/portal07.png") 
  	imgDustWind:setFilter("nearest","nearest") 

  	AnimationDustWind = newAnimation(imgDustWind,64,64,0.3,0)
  	AnimationDustWind:setMode("loop")
  	AnimationDustWind:CreateObject(PLAYER_START_X,PLAYER_START_Y)
  	self:Play()
end

function DustWind:Draw()
	if AnimationDustWind == nil then
		return
	end

	AnimationDustWind:draw()
end

function DustWind:Play()
	AnimationDustWind:play()
end

function DustWind:Move()
	-- 바람이 움직인다 
end

function DustWind:Pause()

end

function DustWind:GetX()
	return self.x
end

function DustWind:GetY()
	return self.y
end

function DustWind:RandomSeed()
	return love.math.setRandomSeed(os.time())
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
	AnimationDustWind:update(dt)
end

function DustWindDraw()
	if dustwind == nil then
		return
	end
	dustwind:Draw()
end