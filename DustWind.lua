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
end

function DustWind:Play()
	-- 바람을 맞아라
end

function DustWind:Pause()

end

function DustWind:ChangeBlocks()
	local seed = self:RandomSeed()
	--Change Block x,y boxList
	for i = 0, boxCount -1 do
		-- SetX,SetY
	end	
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
